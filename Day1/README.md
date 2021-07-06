### Installing Docker
```
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce --allowerasing
```

### Starting Docker Service
```
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker rps
sudo su rps
```

### Testing if docker is working
```
docker --version
docker images
```
