# Automating EKS Cluster Deployment and Nginx Application Deployment with Terraform and Jenkins CI/CD Pipeline
![screenshot](project.png)

Before starting the project we need to have:
- Terraform installed
- AWS account with Access keys
- AWS CLI configured

## Step 1: Creating an EC2 instance and deply Jenkins on it using Terraform (Jenkins-server repo)
- We define first the provider AWS to communicate with Terraform
- We define the Backend where our artifcats are going to store ( S3 Bucket)
- Initialize Terraform to check the configuration: #Terraform init
- Then in Data file we need to define an AMI to be used for EC2 creation
- Then we define in Main VPC, Security Group and EC2 instances and necessary variables (variables file define variables with thier types where terraform.ftvars define the values of the variables
- We create Jenkins-install.sh file and pass it as user-data to the EC2 for installing: Jenkins, terraform, Kubernetes and AWS CLI
- Then we initialize again Terraform, plan and apply to create resources.
## Step 2: Creating EKS Cluster using Terraform (AWS-EKS)
- We Ceate also the provider and backend with S3
- We mention in data file the avalaibility zone
- We create in main file, VPC and EKS
- We initilize terraform and plan
- Push the code in Github
## Step 3: Creation of Jenkins Pipeline (EKS Cluster)
- We open the IP of our EC2 in port 8080 to open Jenkins
- We then install all necessary plugins
- We link AWS with Jenkins so that Jenkins can access AWS Services by giving Access keys to Jenkins in Manage Jenkins-->Credentials-->Global-->Add credentials
- We create a new pipeline on Jenkins and give it a script with access keys and Github link of our repo
- Add initlization of terraform and validation and plan and finally apply in the script (use terraforn apply --auto-aprove command )
- Build the pipeline
- Check in AWS account the creation of EKS
## Step 4: Implenting Deployment files (Kubctl)
- Create deployment and service files in the configuration files to deploy nginx
- Add s stage in Jenkins script to deploy nginx
## Step 5: Deploying changes to AWS
