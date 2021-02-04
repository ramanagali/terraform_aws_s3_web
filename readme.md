# Steps
echo '*** Step-1: Terraform format *** '
terraform fmt

echo '*** Step-2: Terraform validate *** '
terraform validate

echo '*** Step-3: Terraform init *** '
terraform init --backend-config="main.config"

echo '*** Step-4: Terraform Plan *** '
terraform plan -var-file="main.tfvars"

echo '*** Step-5: Terraform Apply *** '
terraform apply -var-file="main.tfvars" 

# upload your index.html file to the bucket 
aws s3 sync dist s3://$DOMAIN_NAME
