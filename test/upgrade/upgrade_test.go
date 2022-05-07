package upgrade

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_helper "github.com/lonegunmanb/terraform-module-test-helper"
)

func TestExampleUpgrade(t *testing.T) {
	currentRoot, err := test_helper.GetCurrentModuleRootPath()
	if err != nil {
		t.FailNow()
	}
	currentMajorVersion, err := test_helper.GetCurrentMajorVersionFromEnv()
	if err != nil {
		t.FailNow()
	}
	test_helper.ModuleUpgradeTest(t, "lonegunmanb", "terraform-azurerm-naming", "examples/complete", currentRoot, terraform.Options{
		Upgrade: true,
		//VarFiles: []string{fmt.Sprintf("%s/examples/complete/fixtures.us-east.auto.tfvars", currentRoot)},
	}, currentMajorVersion)
}
