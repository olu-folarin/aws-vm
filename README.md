# Here is a look and work around of AWS's EC2. Beginning with the General Purpose instance type (t2.micro).

## The file will be updated when as new additions are made to it.

## In order to access the webserver after provisioning it on a client engine, the key-par that's initially created while setting up EC2 must be made reference to in the config file by using an AWS resource known as aws_key_pair. This will point to the file path. After doing this, you go to the instance block, beneath the bash script, and point to the key-pair's id.