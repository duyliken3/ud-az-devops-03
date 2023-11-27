# Ensuring Quality Releases

## Introduction

In this repository, you will use a Terraform template to deploy a web server in Azure.  
For test, you will be implement Selenium and JMeter. Finally, using azure monitor to catch up logs.  

## Badges

## Dependencies

| Dependency | Link |
| ------ | ------ |
| Terraform | https://www.terraform.io/downloads.html |
| JMeter |  https://jmeter.apache.org/download_jmeter.cgi|
| Postman | https://www.postman.com/downloads/ |
| Python | https://www.python.org/downloads/ |
| Selenium | https://sites.google.com/a/chromium.org/chromedriver/getting-started |

## Getting Started

 1. Fork this Github [repo](https://github.com/udacity/cd1807-Project-Ensuring-Quality-Releases) to your account and clone it locally:

 ```ssh
    git clone https://github.com/[USERNAME]/cd1807-Project-Ensuring-Quality-Releases.git
    cd cd1807-Project-Ensuring-Quality-Releases
 ```

 2. Login Auzre on Auzre Cloud Shell:

 ```ssh
    az login
 ```

 3. Configure storage account:

 ```bash
    ./azure-storage-account.sh
```

 Fill the value of the key in the output and information of your storage account in file <b>main.tf</b>

4. Create a Service Principal with **Contributor** role:

```ssh
    az ad sp create-for-rbac --role Contributor --scopes /subscriptions/<your-subscription-id> --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
```

5. Create a SSH key and also perform a keyscan of your github to get the known hosts.

```bash
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
```

```bash
ssh-keyscan github.com
```

6. Update value to terraform in **terraform/terraform.tfvar**

Complete the following parameters:
| parameter| Link |
| ------ | ------ |
| subscription_id | subscription id |
| client_id | service principal client app id |
| client_secret | service principal password |
| tenant_id | service principal tenandt id |
| location | location |
| resource_group | Resource Group |
| application_type | Name of the APP - must be unique |
| virtual_network_name | Name of the VNet |
| packer_image | Packer Image ID  created earlier |
| admin_username | admin username of the VM |
| public_key_path | path of the id_rsa.pub file |

7. Access Azure DevOPs and setting:  
Install these Extensions:

* JMeter (https://marketplace.visualstudio.com/items?itemName=AlexandreGattiker.jmeter-tasks&targetId=625be685-7d04-4b91-8e92-0a3f91f6c3ac&utm_source=vstsproduct&utm_medium=ExtHubManageList)
  
* PublishHTMLReports (https://marketplace.visualstudio.com/items?itemName=LakshayKaushik.PublishHTMLReports&targetId=625be685-7d04-4b91-8e92-0a3f91f6c3ac&utm_source=vstsproduct&utm_medium=ExtHubManageList)

* Terraform (https://marketplace.visualstudio.com/items?itemName=ms-devlabs.custom-terraform-tasks&targetId=625be685-7d04-4b91-8e92-0a3f91f6c3ac&utm_source=vstsproduct&utm_medium=ExtHubManageList)

Create a Project 

Create the Service Connection

Add into Pipelines --> Library --> Secure files these 2 files:  **id_rsa key** **terraform.tfvars**

Create Enviroment **linux-test**

Create a New Pipeline in your Azure DevOPs Project

Create a Log Analytics workspace

Set up email alerts
