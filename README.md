# mymediawiki
Mediawiki deployment - Kubernetes, Kops, Terraform, AWS, Packer

# Steps to Automate the Mediawiki app deployment -

### 1. Create docker image - Since I already have created the Automated Build in Dockerhub account, so once it detects any commit in this repo build will automatically trigger to create latest mediwiki image with namespace/name:tag as kmlchauhan/mediawiki:latest.
### 2. Create Infra on AWS - here I am executing the following items -
####  a. Creating a new AMI to used by the nodes in the Kubernetes cluster - For this execute build-and-launch.sh script
####  b. The same script will also execute the create-kops-cluster.sh script which will do the following tasks -
     - Create the A resord set for given DNS in AWS.
     - Copy all the Kubernetes related config files and public key on S3 bucket.
     - Create one folder and the terraform(.tf) file within that folder.
####  c. And then, the same script will initialize the terraform for the given provider(aws in this case) and then will apply(create) all the resources(total 35) from .tf file.
### 3. Then after close to 15 mins the complete infra will be up and running. You can check the nodes in the cluster using the command kubectl get nodes.
### 4. Once the cluster is up and running deploy the mediawiki.yaml file using command kubectl apply -f mediawiki.yaml
### 5. Then check the running app.

# To be continued ...
