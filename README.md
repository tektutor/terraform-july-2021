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
git clone https://github.com/tektutuor/terraform-july-2021.git
cd terraform-july-2021
subl .
```
You may follow the lab instructions in the README.md file
