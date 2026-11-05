# Modern End-to-End DevOps Pipeline

## Project Overview

This capstone project demonstrates the implementation of an automated end-to-end DevOps pipeline using AWS, Terraform, Ansible, Docker, Docker Compose, GitHub, Maven, and Jenkins.

The project provisions cloud infrastructure, deploys two applications on a single AWS EC2 instance, and automates application builds and deployments whenever changes are pushed to GitHub.

## Project Objectives

- Provision AWS infrastructure using Terraform.
- Configure and manage the server using Ansible.
- Containerize two applications using Docker.
- Deploy both applications using Docker Compose.
- Configure Jenkins for Continuous Integration and Continuous Deployment (CI/CD).
- Automatically detect GitHub changes and trigger deployments.
- Verify successful application deployments.

## Technology Stack

| Technology | Purpose |
|---|---|
| AWS EC2 | Cloud infrastructure hosting |
| Terraform | Infrastructure as Code |
| Ansible | Configuration management |
| Docker | Application containerization |
| Docker Compose | Multi-container deployment |
| Jenkins | CI/CD automation |
| GitHub | Source code management |
| Maven | Java application build automation |
| Java 17 | Java application runtime and build |
| Java 21 | Jenkins runtime |
| Nginx | Portfolio website hosting |

## Architecture

The CI/CD workflow follows this sequence:

```text
Developer
    |
    v
GitHub Repository
    |
    v
Jenkins SCM Polling
    |
    v
Jenkins Pipeline
    |
    +---- Checkout Source Code
    |
    +---- Verify Build Environment
    |
    +---- Build Java Application (Maven)
    |
    +---- Build Docker Images
    |
    +---- Deploy with Docker Compose
    |
    +---- Verify Deployment
    |
    v
AWS EC2 Instance
    |
    +---- Java Yearbook Application :8081
    |
    +---- Portfolio Website :8082
```

Terraform provisions the AWS infrastructure, while Ansible supports server configuration and management.

## Project Directory Structure

```text
capstone_project/
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.ini
│   └── playbook.yml
├── java/
│   ├── Dockerfile
│   ├── pom.xml
│   └── src/
│       └── main/
│           └── java/
│               └── Application.java
├── myportfolio/
│   ├── Dockerfile
│   └── index.html
├── jenkins/
│   └── Jenkinsfile
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
│   └── terraform.tfvars
├── docker-compose.yml
├── .gitignore
└── README.md
```

## Applications

### 1. Java Yearbook Application

A Java application built using Maven and packaged into a Docker image.

- Language: Java 17
- Build tool: Maven
- Container: `java-yearbook`
- Port: `8081`

### 2. Portfolio Website

A static portfolio website served using Nginx inside a Docker container.

- Technologies: HTML, CSS, and Nginx
- Container: `portfolio`
- External port: `8082`
- Internal port: `80`

## Infrastructure Provisioning with Terraform

Terraform is used to provision the AWS infrastructure, including:

- EC2 instance running Amazon Linux 2023.
- Security group controlling inbound network access.
- Infrastructure outputs such as instance ID, public IP, and SSH connection details.

Example commands:

```bash
cd terraform
terraform init
terraform validate
terraform plan
terraform apply
```

Review the Terraform plan carefully before applying changes.

## Configuration Management with Ansible

Ansible is used for server configuration and management.

Example commands:

```bash
ansible all -m ping
ansible-playbook playbook.yml
```

Run these commands from the `ansible` directory with the correct inventory and SSH configuration.

## Docker Deployment

Docker Compose manages both applications on the same EC2 server.

Build the images:

```bash
docker compose -p devops-capstone build
```

Start the applications:

```bash
docker compose -p devops-capstone up -d
```

Check running containers:

```bash
docker compose -p devops-capstone ps
```

## Jenkins CI/CD Pipeline

Jenkins automates the application build and deployment process.

The pipeline configuration is stored in:

```text
jenkins/Jenkinsfile
```

### Pipeline Stages

1. **Checkout:** Retrieve source code from GitHub.
2. **Verify Environment:** Check Java, Git, Maven, and Docker.
3. **Build Java Application:** Compile and package the Java application using Maven.
4. **Build Docker Images:** Build both application images.
5. **Deploy Applications:** Deploy using Docker Compose.
6. **Verify Deployment:** Check container status and application HTTP responses.

### Automatic Deployment

Jenkins uses SCM polling with the following schedule:

```text
H/5 * * * *
```

Jenkins checks the GitHub repository approximately every five minutes.

When a new commit is detected, Jenkins automatically executes the CI/CD pipeline.

The automatic deployment workflow was tested successfully by updating the Portfolio website, pushing the change to GitHub, and confirming that Jenkins deployed the update.

## Security Considerations

- Jenkins port 8080 is accessed privately using SSH port forwarding.
- SSH access to EC2 is restricted using security group rules.
- Jenkins requires authentication.
- Docker group membership grants elevated host privileges and should be limited to trusted users.
- Terraform state files, credentials, and SSH private keys must not be committed to GitHub.
- Production deployments should use HTTPS, restricted application access, and stronger CI/CD isolation.

## Testing and Verification

The following tests were completed successfully:

- Terraform infrastructure provisioning.
- EC2 SSH connectivity.
- Ansible connectivity verification.
- Docker container deployment.
- Jenkins GitHub checkout.
- Maven build execution.
- Docker image building.
- Docker Compose deployment.
- Application HTTP verification.
- Automatic Jenkins pipeline triggering using SCM polling.

## Conclusion

This project demonstrates the integration of Infrastructure as Code, configuration management, containerization, and CI/CD automation.

Using Terraform, Ansible, Docker, GitHub, and Jenkins, two applications are deployed to a shared AWS EC2 instance, with automated builds and deployments triggered by source code changes.

The result is a functional end-to-end DevOps pipeline that reduces manual deployment effort and provides a foundation for further improvements in security, monitoring, testing, and deployment reliability.
