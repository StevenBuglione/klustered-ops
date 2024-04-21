GREEN='\033[0;32m'
NO_COLOR='\033[0m'

echo "${GREEN}Checking if task is installed${NO_COLOR}"
if [ ! -f ~/.local/bin/task ]; then
  echo Task is not installed
  echo Installing Task
  sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin
else
  echo Task is installed
fi

echo "${GREEN}Checking if pip is installed${NO_COLOR}"
if ! which pip > /dev/null; then
  echo pip is not installed
  echo Installing pip
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
else
  echo pip is installed
fi

echo "${GREEN}Checking if pre-commit is installed${NO_COLOR}"
if ! which pre-commit > /dev/null; then
  echo pip is not installed
  echo Installing pip
  curl pip install pre-commit
else
  echo pre-commit is installed
fi

echo "${GREEN}Checking if ansible is installed${NO_COLOR}"
if [ ! -f /usr/bin/ansible ]; then
  echo Ansible is not installed
  echo Installing Ansible
  sudo apt update
  sudo apt install software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt install ansible
else
  echo ansible is installed
fi

echo "${GREEN}Checking if fd-find is installed${NO_COLOR}"
if [ ! -f /usr/bin/fdfind ]; then
  echo fd-find is not installed
  echo Installing fd-find
  sudo apt update
  sudo apt install fd-find
  ln -s $(which fdfind) ~/.local/bin/fd
else
  echo fd-find is installed
fi

echo "${GREEN}Checking if kubectl is installed${NO_COLOR}"
if ! which kubectl > /dev/null; then
  echo kubectl is not installed
  echo Installing kubectl
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/
else
  echo kubectl is installed
fi

echo "${GREEN}Checking if .kube directory exists${NO_COLOR}"
if [ ! -d ~/.kube ]; then
  echo .kube directory does not exist
  echo Creating .kube directory
  mkdir ~/.kube
else
  echo .kube directory exists
fi
