#  File: apply.sh 
#
#  Use: Perform puppet apply of site module
#
#  Description:  Execute puppet apply to install jenkins server
#
#  Note: None
#
#  Command: sudo apply.sh

# Apply Jenkins Changes
export PATH=$PATH:/opt/puppetlabs/bin

puppet apply puppet/manifests/site.pp --modulepath=/vagrant/puppet/modules/
