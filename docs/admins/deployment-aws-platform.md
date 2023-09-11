# Platform deployment in AWS

This section includes the required steps to deploy the QCentroid Platform on the infrastructure deployed using [this procedure](deployment-aws-infrastructure.md) in an AWS environment.

!!! note "Note"

    This procedure shall be run after the infrastructure deployment following this other procedure:
    
    [Infrastructure deploymnet in AWS](deployment-aws-infrastructure.md)


## Prerequisites

This is the list of prerequisites needed for the deployment of the QCentroid Platform:

- [ ] AWS infrastructure deployment as specified in [this section](deployment-aws-infrastructure.md)
- [ ] Generate aws credentials (`aws-access-key`, `aws-secret-key`, `aws-session-token`, `aws-region`) with ECR (container registry) permissions:
```JSON
{ 
   "Version": "2012-10-17", 
   "Statement": [ 
     { 
       "Effect": "Allow", 
       "Action": [ 
         "ecr:GetAuthorizationToken", 
         "ecr:BatchCheckLayerAvailability", 
         "ecr:GetDownloadUrlForLayer", 
         "ecr:GetRepositoryPolicy", 
         "ecr:DescribeRepositories", 
         "ecr:ListImages", 
         "ecr:BatchGetImage", 
         "ecr:PutImage" 
       ], 
       "Resource": "*" 
     } 
   ] 
}
```
- [ ] The repository url of the registry (ECR) named qcentroid-ecr-url (example: 3434.dkr.ecr.eu-west-1.amazonaws.com)
- [ ] Platform container images already pushed to the ECR registry

## Procedure overview

TBC

## What's next

:octicons-chevron-right-12: [Get started using the platform](../platform/getting-started.md)
