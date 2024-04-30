# Deployment Process Documentation

## Overview
This guide covers the tools and procedures for deploying our application using Kubernetes, CI/CD with AWS CodeBuild, and version control systems.

### Prerequisites
Ensure the following tools are installed and configured:
- Docker and Docker CLI
- Git and Git CLI
- Python 3.x and PIP
- AWS CLI
- GitHub account

### Configuration
1. **AWS and Kubernetes Setup**:
    - Configure AWS CLI with your credentials.
    - Create an EKS Cluster using:
      ```bash
      eksctl create cluster --name my-cluster --region us-east-1 --nodegroup-name my-nodes --node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2
      ```
    - Update the kubeconfig for your cluster:
      ```bash
      aws eks --region us-east-1 update-kubeconfig --name my-cluster
      ```

2. **Deploy Kubernetes Resources**:
    - Apply Kubernetes configurations with `kubectl apply -f <filename>` for:
        - ConfigMaps (`db-configmap.yaml`)
        - Secrets (`db-secret.yaml`)
        - Persistent Volumes (`pv.yaml`)
        - Persistent Volume Claims (`pvc.yaml`)
        - Deployment (`postgresql-deployment.yaml`)
        - Service (`postgresql-service.yaml`)
        - Application Deployment (`coworking.yaml`)

### Building the Application
1. **Repository Setup**:
    - Clone the repository: `git clone https://github.com/TrongPhungF/coworking`
    - Navigate to the project directory.

2. **Docker and Build Configuration**:
    - Create a Dockerfile and buildspec.yml in the project directory.
    - Configure AWS ECR (Elastic Container Registry):
      ```bash
      aws ecr create-repository --repository-name <repo_name> --region <region>
      ```

### Deployment
1. **AWS CodeBuild Setup**:
    - Set up CodeBuild project to build the Docker image and push it to ECR.
    - Ensure buildspec.yml is configured to use environment variables for AWS credentials and repository details.

2. **Monitor and Manage Deployment**:
    - Attach the CloudWatchAgentServerPolicy to the EKS node role:
      ```bash
      aws iam attach-role-policy --role-name AmazonEKSNodeRole --policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy
      ```
    - Deploy the CloudWatch addon to the cluster:
      ```bash
      aws eks create-addon --addon-name amazon-cloudwatch-observability --cluster-name eks-aws
      ```

### Validation and Logs
- Check application status using:
  ```bash
  kubectl get pods
  kubectl get svc
  kubectl logs <pod_name>
  kubectl describe svc <svc_name>
