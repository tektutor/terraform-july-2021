### Installing Go Programming Language
```
cd ~/Downloads
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
tar xvfz go1.13.linux-amd64.tar.gz
```

### Add Go Language path in environment settings
Add the below in the .bashrc file under your home directory
Make sure you append the below line without removing existing configurations in bashrc file
```
export GO_HOME=/home/jegan/Downloads/go
export PATH=/usr/local/bin:$GO_HOME/bin:$PATH
```
### To apply the settings without closing and reoping terminal
```
source ~/.bashrc
```
Now your shell should be able to locate go
```
which go
```

### Testing terraform code using terratest framework
```
go test
```
The expected output is
<pre>
[jegan@tektutor IntegrationTest]$ go test
TestTerraformHelloWorldExample 2021-07-09T02:45:03-07:00 retry.go:91: terraform [init -upgrade=false]
TestTerraformHelloWorldExample 2021-07-09T02:45:03-07:00 logger.go:66: Running command terraform with args [init -upgrade=false]
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Initializing the backend...
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Initializing provider plugins...
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Terraform has been successfully initialized!
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: You may now begin working with Terraform. Try running "terraform plan" to see
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: any changes that are required for your infrastructure. All Terraform commands
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: should now work.
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: If you ever set or change modules or backend configuration for Terraform,
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: rerun this command to reinitialize your working directory. If you forget, other
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: commands will detect it and remind you to do so if necessary.
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 retry.go:91: terraform [apply -input=false -auto-approve -lock=false]
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Running command terraform with args [apply -input=false -auto-approve -lock=false]
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Changes to Outputs:
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66:   + hello_world = "Hello, World!"
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: You can apply this plan to save these new output values to the Terraform
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: state, without changing any real infrastructure.
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Outputs:
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: hello_world = "Hello, World!"
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 retry.go:91: terraform [output -no-color -json hello_world]
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Running command terraform with args [output -no-color -json hello_world]
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: "Hello, World!"
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 retry.go:91: terraform [destroy -auto-approve -input=false -lock=false]
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Running command terraform with args [destroy -auto-approve -input=false -lock=false]
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Changes to Outputs:
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66:   - hello_world = "Hello, World!" -> null
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: You can apply this plan to save these new output values to the Terraform
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: state, without changing any real infrastructure.
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: Destroy complete! Resources: 0 destroyed.
TestTerraformHelloWorldExample 2021-07-09T02:45:04-07:00 logger.go:66: 
PASS
ok  	_/home/jegan/terraform-july-2021/Day5/IntegrationTest	0.494s
</pre>

