package e2e_test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_helper "github.com/lonegunmanb/terraform-module-test-helper"
	"github.com/stretchr/testify/assert"
)

func TestExamplesComplete(t *testing.T) {
	test_helper.RunE2ETest(t, "../../", "examples/complete", terraform.Options{
		Upgrade: true,
	}, func(t *testing.T, output test_helper.TerraformOutput) {
		assertOutputRegexp(t, output, "name_empty", "^st.+")
		assertOutputRegexp(t, output, "suffix", "^stsufix.+")
		assertOutputRegexp(t, output, "random", "^st.+")
		assertOutputEqual(t, output, "everything", "prefixstsufixra")
	})
}

func assertOutputRegexp(t *testing.T, output test_helper.TerraformOutput, outputName, regex string) {
	value, ok := output[outputName].(string)
	assert.True(t, ok)
	assert.Regexp(t, regex, value)
}

func assertOutputEqual(t *testing.T, output test_helper.TerraformOutput, outputName, expected string) {
	value, ok := output[outputName].(string)
	assert.True(t, ok)
	assert.Equal(t, expected, value)
}
