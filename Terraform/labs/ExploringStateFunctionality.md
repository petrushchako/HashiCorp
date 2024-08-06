# Exploring Terraform State Functionality


### Introduction
Understanding and being comfortable with Terraform state is crucial to mastering it. In this hands-on lab, we will deploy resources using Kubernetes, a container orchestration tool, and see how Terraform maintains a state file to track changes and deploy containers declaratively.

### Additional Resources
Link to the GitHub respository containing Terraform code for this lab:

https://github.com/linuxacademy/content-hashicorp-certified-terraform-associate-foundations.git


<br><br>

## Check Terraform and Minikube Status
- Check the Terraform status using the version command:

    `terraform version`


    Since the Terraform version is returned, you have validated that Terraform is installed and functioning properly.


- Check the minikube status:

    `minikube status`

    The `minikube status` command should return `host`,`kubelet`, and `apiserver` in `Running` state and kubeconfig in `Configured` state. 
    It will look something similar to this:

    ```sh
    minikube
    type: Control Plane
    host: Running
    kubelet: Running
    apiserver: Running
    kubeconfig: Configured
    ```

<br>

## Clone Terraform Code
- The Terraform code required for this lab has already been cloned onto the provided VM. Switch to the directory where the code is located:

    ```sh
    cd lab_code/
    cd section2-hol1/
    ```

- View the code in the `main.tf` file:

    `vim main.tf`

    The code is configured with Kubernetes as the provider, allowing Terraform to interact with the Kubernetes API to create and destroy resources. Within the `kubernetes_deployment` resource, the `replicas` attribute controls the number of deployments, which in turn controls the number of pods being deployed.


<br>

## Deploy Terraform Code And Observe the State File

### Deploy the Cloned Terraform Code

- Initialize the working directory and download the required providers:

    `terraform init`

- Review the actions that will be performed when you deploy the Terraform code:

    `terraform plan`

    In this case, it will create 2 resources as configured in the Terraform code.

- List the files in the directory:

    `ls`

    Notice that the list of files does not include the `terraform.tfstate` at this time. You must deploy the Terraform code for the state file to be created.

- Deploy the code:

    `terraform apply`

    When prompted, type yes and press Enter.

<br>

### Observe How the Terraform State File Tracks Resources
- Once the code has executed successfully, list the files in the directory:

    `ls`

    Notice that the `terraform.tfstate` file is now listed. This state file tracks all the resources that Terraform has created.

- Optionally, verify that the pods required were created by the code as configured using kubectl:

    `kubectl get pods`

    There are currently 2 pods in the deployment.

- List all the resources being tracked by the Terraform state file using the terraform state command:

    `terraform state list`

    There are two resources being tracked: `kubernetes_deployment.tf-k8s-deployment` and `kubernetes_service.tf-k8s-service`.

- View the replicas attribute being tracked by the Terraform state file using grep and the `kubernetes_deployment.tf-k8s-deployment` resource:

    `terraform state show kubernetes_deployment.tf-k8s-deployment | egrep replicas`

    There should be 2 replicas being tracked by the state file.

- Open the `main.tf` file to edit it:

    `vim main.tf`

- Change the integer value for the replicas attribute from 2 to 4.

- Review the actions that will be performed when you deploy the Terraform code:

    `terraform plan`

    In this case, 1 resource will change: the `kubernetes_deployment.tf-k8s-deployment` resource for which we have updated the `replicas` attribute in our Terraform code.

- Deploy the code again:

    `terraform apply`

    When prompted, type yes and press Enter.

- Optionally, verify that the pods required were created by the code as configured:

    `kubectl get pods`

    There are now 4 pods in the deployment.

- View the replicas attribute being tracked by the Terraform state file again:

    `terraform state show kubernetes_deployment.tf-k8s-deployment | egrep replicas`

    There should now be 4 replicas being tracked by the Terraform state file. It is accurately tracking all changes being made to the Terraform code.

<br>

### Tear Down the Infrastructure
- Remove the infrastructure you just created:

    `terraform destroy`

- When prompted, type yes and press Enter.
- List the files in the directory:

    `ls`

    Notice that Terraform leaves behind a backup file — `terraform.tfstate.backup` — in case you need to recover to the last deployed Terraform state.

