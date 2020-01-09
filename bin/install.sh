#!/ bin/bash
#

remote_url=https://raw.githubusercontent.com/yukiyuriweb/Mac-OS-X-clean-install-scripts/master/bin

curl -o- ${remote_url}/homebrew.sh | bash
curl -o- ${remote_url}/node-packages.sh | bash
curl -o- ${remote_url}/composer.sh | bash
curl -o- ${remote_url}/pip.sh | bash
curl -o- ${remote_url}/gem.sh | bash
