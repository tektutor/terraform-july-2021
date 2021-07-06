### Install Ansible (Run this command as rps user)
```
sudo yum install -y epel-release
sudo yum install -y ansible
```

### Check if ansible is installed properly (Run this command as rps user)
```
ansible --version
```
The expected output is
<pre>
jegan@tektutor terraform-july-2021]$ ls
Day1  Day2  README.md
[jegan@tektutor terraform-july-2021]$ ansible --version
ansible 2.9.23
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/jegan/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.6/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.6.8 (default, Aug 24 2020, 17:57:11) [GCC 8.3.1 20191121 (Red Hat 8.3.1-5)]
[jegan@tektutor terraform-july-2021]$ 
</pre>

### Check if you can ping the localhost using ansible ad-hoc command
```
cd /home/rps/terraform-july-2021/Day1
ansible -i inventory all -m ping
```
The expected output is
<pre>
[jegan@tektutor terraform-july-2021]$ cd Day1
[jegan@tektutor Day1]$ ls
inventory  README.md  ubuntu-ansible  url.txt
[jegan@tektutor Day1]$ ansible -i inventory all -m ping
localhost | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
</pre>

### Create ansible node containers using the above custom docker image
```
docker run -d --name ubuntu1 --hostname ubuntu1 -p 2001:22 -p 8001:80 tektutor/ansible-ubuntu:latest
docker run -d --name ubuntu2 --hostname ubuntu2 -p 2002:22 -p 8002:80 tektutor/ansible-ubuntu:latest
```

### List the two containers and see if they running
```
docker ps
```

### Test if you can perform ssh to ubuntu1 and ubuntu2 containers without typing password
```
ssh -p 2001 root@localhost
ssh -p 2002 root@localhost
```

### Install terraform
```
wget https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip
unzip terraform_1.0.1_linux_amd64.zip
sudo mv terraform /usr/bin
```
For instruction on how to install terraform in other Operating System, you may refer https://www.terraform.io/downloads.html

### Test if terraform works fine
```
terraform
```
The expected output is
<pre>
[jegan@tektutor Backup]$ terraform
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
</pre>


