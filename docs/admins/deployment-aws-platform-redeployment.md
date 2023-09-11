# Platform re-deployment

When the platform has been deployed following [this procedure](deployment-aws-platform.md), it can be re-deployed if needed following the procedure described in this section.

## Posible causes to run this procedure

The main reasons for a full platform re-deployment could be:

- Unstable behavior of the platform.
- Planned reconfiguration of the infrastructure.


## Prerequisites

This is the list of prerequisites needed for the deployment of the QCentroid Platform:

- [ ] AWS infrastructure deployment as specified in the previous sections.
- [ ] AWS credentials 
- [ ] The repository url of the registry (ECR) named qcentroid-ecr-url (example: 3434.dkr.ecr.eu-west-1.amazonaws.com)
- [ ] Platform container images already pushed to the ECR registry

