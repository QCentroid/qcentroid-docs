This runbook shows the steps to restart the platform software.
This will not destroy and recreate the whole infrastructure, it will just end the platform services and start them again.

## Posible causes to run this procedure

* The platform is performing very slow.
* The platform is not running, a 503 error page appears instead.


## Overview

To restart the platform software, the easiest way is to restart the whole EC2 instance where the platform is running.
When the instante starts again, the platform services will also start automatically

## Step-by-step procedure

1. Connect to the AWS administration console
    * Through the Okta applications dashboard: https://moodys.okta.com
    * Or directly through this URL: https://eu-west-1.console.aws.amazon.com/console/home?region=eu-west-1#
2. Go to **EC2**
3. Click on **Instances (running)** to see the list of instances currently running
4. Find the one with this name: ***ec2-cpg-quantum-backoffice-nprd***
5. Click on that instace's ID to access the instance details
6. On the top-right corner, click on **Instance state**
7. And click on **Reboot instance**

Now, just wait until the instance reboots and the services start again, this may take a few minutes.
After this, visit the platform URL again to see if the platform is accessible and behaviouring normally.


