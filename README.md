# NodeJs-App
Simple NodeJs Application Deployed On AWS ECS using GitHub Actions and Terraform.

 The deployment process is automated with GitHub Actions and infrastructure management is handled by Terraform.


Prerequisites

Before you begin, ensure you have the following installed:

   - Node.js (v14 or later)
   - npm (v6 or later)
   - Terraform (v0.13 or later)
   - AWS CLI
   - Docker
   - GitHub Account

Workflow
   - Checks out the repository
   - Configures AWS credentials
   - Builds the Docker image
   - Pushes the Docker image to Amazon ECR
   - Provision AWS ECS and Deploys the new image to ECS
This is a just a new update in readme file.   
