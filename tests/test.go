package test

import (
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/ssh"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformDeployment(t *testing.T) {
	// Specify the path to the Terraform code
	terraformOptions := &terraform.Options{
		TerraformDir: "../main",
	}

	// Ensure resources are destroyed after test
	defer terraform.Destroy(t, terraformOptions)

	// Initialize and apply Terraform configuration
	terraform.InitAndApply(t, terraformOptions)

	// Retrieve outputs
	publicIPs := terraform.OutputList(t, terraformOptions, "vm_public_ips")
	privateIPs := terraform.OutputList(t, terraformOptions, "vm_private_ips")

	// Assertions for outputs
	assert.NotEmpty(t, publicIPs, "Public IPs should not be empty")
	assert.NotEmpty(t, privateIPs, "Private IPs should not be empty")

	// Validate SSH connectivity to each VM
	for _, publicIP := range publicIPs {
		testSSHConnection(t, publicIP)
	}

	// Add a delay to ensure resources are fully ready before connectivity checks
	time.Sleep(20 * time.Second)
}

// Helper function to test SSH connectivity
func testSSHConnection(t *testing.T, publicIP string) {
	sshUser := "ubuntu"
	sshKeyPath := "~/.ssh/id_rsa"

	// Create an SSH key pair
	keyPair := ssh.KeyPair{
		PrivateKeyFile: sshKeyPath,
	}

	sshHost := ssh.Host{
		Hostname:    publicIP,
		Port:        22,
		SshUserName: sshUser,
		KeyPair:     &keyPair,
	}

	// Attempt an SSH connection
	_, err := ssh.CheckSshConnectionE(t, sshHost)
	assert.NoError(t, err, "Failed to connect to VM via SSH")
}
