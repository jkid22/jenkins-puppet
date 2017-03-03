#  File: test.sh
#
#  Use: Perform puppet test of site module
#
#  Description: Execute puppet test to install jenkins server
#
#  Note: None
#
#  Command: sudo test.sh

# Test Jenkins Changes
export PATH=$PATH:/opt/puppetlabs/bin

puppet apply puppet/manifests/site.pp --modulepath=/vagrant/puppet/modules/ --noop
