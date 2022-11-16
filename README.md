# Here is a look and work around of AWS's EC2. Beginning with the General Purpose instance type (t2.micro).

## The file will be updated when as new additions are made to it.

## In order to access the webserver after provisioning it on a client engine, the key-par that's initially created while setting up EC2 must be made reference to in the config file by using an AWS resource known as aws_key_pair. This will point to the file path. After doing this, you go to the instance block, beneath the bash script, and point to the key-pair's id.

## To allow ssh access to the resource from the internet,
#### create a security group that ensures the resource can only be accessed via ssh from port 22
#### reference the group in the resource by giving the argument: vpc_security_group_id the value referencing the security group's id. The value expects a list; ensure the value is encased in square brackets.

## I ran into a problem connecting the key-pair i created manually on aws to my ec2 instance. This resource helped clear that out https://www.youtube.com/watch?v=lJbf0J9rRzE. This is to my future self.