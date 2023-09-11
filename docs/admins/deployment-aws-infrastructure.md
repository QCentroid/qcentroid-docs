# Infrastructure deployment in AWS

This section includes the required steps to deploy the infrastructure resources needed to deploy the QCentroid Platform in an AWS environment.

## Prerequisites

This is the list of prerequisites needed for the deployment in an AWS environment:

- [ ] Terraform client installed
    - Download it here: https://developer.hashicorp.com/terraform/downloads
- [ ] AWS Region and Zone to deploy (Zone is optional)
- [ ] AWS credentials
    - `aws_access_key`
    - `aws_secret_key`
    - `aws_session_token` (not always required)
- [ ] QCentroid Terraform scripts (qcentroid-tf package)


## Procedure overview

1. Check that all the prerequisites have been fulfilled.
2. Download/clone the QCentroid Terraform repository (qcentroid-tf) with the scripts.
3. Type cd tf
4. Complete the Terraform setup with “terraform init”.
5. Check the set-up with “terraform plan” to see everything is fine.
6. Execute the scripts. "terraform apply"
7. Check the execution output in the console for a successful execution.
8. Check inside AWS components through the AWS web dashboard that the elements were generated successfully.


## Procedure step-by-step

1. Unzip the qcentroid-tf package in a folder in your local machine.

2. Access the folder “tf” inside the repository:
```
$ cd tf
```

3. Perform the terraform init:
```
$ terraform init
```
    This will install all the dependencies needed and complete the Terraform client set-up.
    
    You should get a message like this one:
```
Terraform has been successfully initialized!
```

4. Execute the Terraform Plan to see if the AWS credentials and the set-up is fine:
```
$ terraform plan
```
    This will show the plan and the number of operations that it’s going to run.
    
    You shouldn’t get any errors in this step and you will see a summary like this:
```bash
Plan: 96 to add, 0 to change, 0 to destroy
```

5. Execute the complete set of scripts to create all the resources listed in the previous step:
```
$ terraform apply
```
    When it starts running it will require confirmation. Type “yes” to continue.

6. Check the output of the execution. You should see something like this:
```bash
Apply complete! 96 added, 0 changed, 0 destroyed.

Outputs:

ec2instance-dns = "ec2-1-1-1-1.eu-west-1.compute.amazonaws.com"
ec2instance-ip = "1.1.1.1"
qcentroid-ec-cache-ips = "ec-qcentroid-cache-dev.nkliko.0001.euw1.cache.amazonaws.com:6379"
qcentroid_additionals_tags = tomap({
  "tag1" = "tag1_value"
  "tag2" = "tag2_value"
})
qcentroid_ecr_url = "xxx.dkr.ecr.eu-west-1.amazonaws.com"
qcentroid_ecs_cluster_name = "qcentroid-cluster-dev"
qcentroid_rds_dbname = "qcentroid"
qcentroid_rds_url = "rds-qcentroid-backoffice-dev-default.xxxx.eu-west-1.rds.amazonaws.com:3306"
qcentroid_rds_username = "dbadmin"
qcentroid_rds_password = <sensitive>
qcentroid_sqs_executors_url = "https://sqs.eu-west-1.amazonaws.com/xxx/executors-dev"
qcentroid_sqs_jobs_creator_url = "https://sqs.eu-west-1.amazonaws.com/xxx/jobs-creator-dev"
qcentroid_sqs_public_api_url = "https://sqs.eu-west-1.amazonaws.com/xxx/public-api-dev"
qcentroid_sqs_update_state_url = "https://sqs.eu-west-1.amazonaws.com/xxx/update-state-dev"
```
    It’s important to save this output because it contains important information to be used later.

7. Finally, to confirm that the whole process went ok, you can go check inside AWS components through the AWS web dashboard that all the elements were generated successfully.


## Destroy/Undo

In the case of needing to undo these steps and destroy all the resources created, use “terraform destroy”:
```
$ terraform destroy
```

After the execution, you should see something like this confirming that all the objects have been destroyed successfully:
```bash
Destroy complete! Resources: 96 destroyed.
```

## Constraints and known issues

This list shows the constraints and potential issues that may be faced during this deployment process:

- RDS Subnet multi-AZ needs to be configured in Terraform
- Credential file-based automation script is needed to run terraform successfully from local machine without manually copy pasting of keys
- lambda execution role name collision
- ECR repos stayed around / not deleted / cleaned up after terraforming.
- Lambdas need to be in private VPCs to talk to RDS.
- RDS need to be private subnets
- Lambdas have to be in the VPC
- We cannot have public S3 Buckets, so they need to work on the static assets
- We need ALB load balancer in front of EC2
- We cannot have 0.0.0.0/0 SG rules for the EC2


## What's next

:octicons-chevron-right-12: [Deploy the platform](deployment-aws-platform.md)