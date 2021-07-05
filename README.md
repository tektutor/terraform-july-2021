### Configure the hostname
```
su -
hostnamectl set-hostname rps
```

### Verify if the hostname is changed to rps
```
hostname
```

### You may exit the terminal and reopen to observer the rps hostname in the shell prompt
```
exit
exit
```
Open terminal from Activities Menu --> Terminal

```
su -
hostname
```

### Install sublime text editor
Once the sublime text Linux rpm is downloaded
```
su -
cd /home/rps/Downloads
rpm -i sublime-text-3211-1.x86_64.rpm
exit
```
### You may open the sublime text edition as shown below
```
cd ~
subl .
```

### From CentOS Linux terminal install git version control 
```
su -
yum install -y git
```
When prompts for password, type redhat as the root password.

### Clone the tektutor repository
```
git clone https://github.com/tektutor/terraform-july-2021.git
cd terraform-july-2021
subl .
```
You may follow the lab instructions in the README.md file

### Ansible ping
```
cd ~
cd terraform-july-2021/Day1
ansible -i inventory all -m ping
```


### Installing Docker Community Edition
```
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
```

### In case you get any error, try the below
```
sudo yum install -y docker-ce --allowerasing
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
```
### List the groups the rps user belongs to
```
id
```
### Notice rps user doesn't have permission to access docker commands
```
docker images
```

### Add rps user to docker group to gain required access to issue docker commands as rps user
```
sudo usermod -aG docker rps
sudo su rps
id
docker images
```
