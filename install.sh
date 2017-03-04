#
#  File: install.sh 
#
#  Use: Builds Jenkins Server
#
#  Description: Clones the Jenkins installation environment and starts vagrant
#
#  Assumptions: Vagrant, Git, and VirtualBox are installed
#
#  Systems: Works on MacOS or Windows 10
#
#  Note: None
#
#  Command:  install.sh

# Settings
REPOSITORY=https://github.com/cdrobey/jenkins-puppet.git
WORKINGDIR=jenkins-puppet

echo ">>> Clone Github Repository and Kick Starting Vagrant"

# Clone github Repository & Start Vagrant
if [  -d "$WORKINGDIR" ]; then
	rm -rf $WORKINGDIR
	if [ $? -gt 0 ]; then
		echo ">>> Unable to delete $WORKINGDIR" 
		exit 1
	fi
fi

git clone "$REPOSITORY"
if [ $? -eq  0 ]; then
	cd "$WORKINGDIR"
	if [ $? -eq 0 ]; then
		vagrant up
	fi
else
	echo ">>> Git Failed to Clone Repository"
	exit 1
fi

echo ">>> Done"


