wf=$1
#!/bin/bash

#install wget
Wget=$(which wget)
#echo "${Dock}"
if [[ -z ${Wget} ]]; then
   echo "wget installation"
   sudo apt-get install -y wget
fi

#Docker & Cloudify installation
if [[ ! -f  tools-install.sh ]]; then
  wget https://github.com/WorkflowCenter-Repositories/ToolsInstallationScripts/raw/master/tools-install.sh
  chmod u+x tools-install.sh
fi

. ./tools-install.sh

sudo service docker start

echo "deploy the workflow"
if [[ ${wf} == 1 ]]; then
   if [[ -d ~/Random ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -rf ~/Random
   fi
  cfy local init --install-plugins -p Random.yaml --input input.yaml
else
   if [[ -d ~/Random-1dock ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -rf ~/Random-1dock
   fi
  cfy local init --install-plugins -p Random-1dock.yaml -i input.yaml
fi

cfy local execute -w install


