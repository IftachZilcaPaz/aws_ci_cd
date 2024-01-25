[![MasterHead](https://thecloudlegion.com/images/devops.gif)](https://rishavchanda.io)

---

<p>
<h1> Hey Again &nbsp;<img src="https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif" height="45" width="45"/>&nbsp;&nbsp;Welcome To My "Aws CI/CD Proj" &nbsp;=)</h1>
</p>
<br/>


## 💻 Languages and Tools:

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white) ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=flat&logo=amazon-aws&logoColor=white) ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white)

---


# -- Create repo --

## Manual we can from:
<img width="1169" alt="image" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/2c4edc73-e765-409c-a599-ac5a99127b10">


## or with CLI

command : "aws ecr create-repository --repository-name my-repo"

### (It will work if we have this:
### - export AWS_ACCESS_KEY_ID="<>"
### - export AWS_SECRET_ACCESS_KEY="<>"
### - export AWS_DEFAULT_REGION="<>"
### )
<br>
<br>

## or we can also to create from terraform:

resource "aws_ecr_repository" "example_repository" {<br>
  &nbsp;&nbsp;name                 = "example-repo" # name of the repository<br>
  &nbsp;&nbsp;image_tag_mutability = "MUTABLE"      # or "IMMUTABLE"<br>
<br>
  &nbsp;&nbsp;image_scanning_configuration {<br>
    &nbsp;&nbsp;&nbsp;&nbsp;scan_on_push = true # enable or disable scanning of images on push<br>
  }<br>

##If you want to add more configuration like encryption, lifecycle policy, etc., you can add here
}

---

# -- Create code_commit --

first go to users in IAM:
<img width="141" alt="image" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/ed106334-b42f-4120-8c8b-f9314e9ac29c"><br>
go to -> security_credentials
<img width="649" alt="image" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/673c95f7-c686-444d-9c70-42e622f50840"><br><br>
then go down:
<img width="1106" alt="image" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/cab0a8d5-d5c4-41f2-93f5-66fd774b0ef3">
and generate cred for this, this will use when we want to clone pull and push

then proceed ==>>
<br><br><br>

<img width="1132" alt="image 2" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/b4ad7dbb-ef03-4fa6-82f7-f989d95b4494">


## We can also create it with terraform:

==>> create:
resource "aws_codecommit_repository" "example_repository" {<br>
  &nbsp;&nbsp;repository_name = "example-repo" # name of the repository<br>
 &nbsp;&nbsp; description     = "An example repository"<br>
##Other configurations...<br>
}<br>

==>> output: (for http, if I want ssh or https just change in the value Line in the end to what I want)

output "codecommit_repository_clone_url_http" {<br>
  &nbsp;&nbsp;description = "The HTTP clone URL of the CodeCommit repository"<br>
  &nbsp;&nbsp;value       = aws_codecommit_repository.example_repository.clone_url_http<br>
}<br>
<br>
### (When get the url we need to clone the repo to local and then we can do changes and push, in the end of the CI/CD build, each time when we change some and push it, it will trigger the pipeline.)

now clone the repo, add the files here to you repo (add,commit,push)

---

# -- Create code_build --

<img width="1124" alt="image 3" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/d35dc6f2-8759-4ae2-8fa6-263b1c3a1841">

<img width="865" alt="image 4" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/d943de78-9e73-49c0-b36e-a696bd2a11e6">
<img width="814" alt="image 5" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/e6d4914a-32aa-43a9-aa8e-d7e37dd6010d">


## Then when we put the name of it above we will get auto service:
<img width="816" alt="image 6" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/f91c2a91-83b4-4507-8c1d-c88b87444848">
<img width="825" alt="image 7" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/3d09c75d-344e-40bf-b01d-be82fce255b3">


## Then 
<img width="485" alt="image 8" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/49ccb2ab-7285-4e60-8e62-73cb98c395cf">



---

# -- Create code deploy --

<img width="1136" alt="image 9" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/c7271ad2-215f-43f5-887e-dfa0e6d3ca33">
<img width="856" alt="image 10" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/927ae5ec-4cdb-4843-afc5-717130c99866">
<img width="1155" alt="image 11" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/0efb74c4-c606-4520-b7b0-bb94fe737b6c">
<img width="809" alt="image 12" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/9c52a68d-8f5d-4d2c-92e1-c5bb1aa83880">

## ==>> This is the role policies:
<img width="1118" alt="image 13" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/345d2ca8-ad40-472b-80a8-982f69fccf4f">

## Then back to the deploy group, look for the instance:
<img width="816" alt="image 14" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/136e8d44-c7e9-4d0a-bae3-fb2cf002e945">
<img width="820" alt="image 15" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/d95e8653-58e5-48c4-aeb6-a54ac7f50608">
<img width="858" alt="image 16" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/d9235b7a-5870-4328-9e76-b60b346b03ef">



---

# -- Create codepipeline --

<img width="887" alt="image 17" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/e986455a-f251-451a-835c-4404ab92fe53">
<img width="858" alt="image 18" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/c909d4b9-9c45-45ac-b9df-2fed089de7f0">
<img width="903" alt="image 19" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/2d2562ff-3215-422f-90b4-61d23ed42024">
<img width="887" alt="image 20" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/40e2eafd-dcb4-4558-b4fb-285f1ae5a66c">
<img width="877" alt="image 21" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/28771286-bf5a-4566-98c8-d0cc895fdaa1">
<img width="869" alt="image 22" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/893dfdad-ece9-43dc-a5e5-41e15a8acab4">


---

# Debug:

Click on details
<img width="340" alt="image 23" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/644a8c63-fa7b-4148-9a3d-55bbd4f96d54">

Then
<img width="313" alt="image 24" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/62f8bd59-028a-4791-9aad-c833f7341835">

Then in the bottom:

<img width="1155" alt="image 25" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/4bdef69d-157e-404c-a46f-8dc7327df780">

<img width="114" alt="image 26" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/2e6f4a73-560a-4dab-befa-bbacdf855879">


Here we can see if there is an error:

<img width="1124" alt="image 27" src="https://github.com/IftachZilcaPaz/aws_ci_cd/assets/151572520/366e165b-93ef-4970-8c31-859b6c03bc4f">


----

# More debug:
## In the instance ==>

tail -n 100 /var/log/aws/codedeploy-agent/codedeploy-agent.log

And see if there is an error, for example:

2024-01-24T14:29:37 ERROR [codedeploy-agent(4557)]: InstanceAgent::Plugins::CodeDeployPlugin::CommandPoller: Missing credentials - please check if this instance was started with an IAM instance profile

# The solution might be:

**IAM Role Permissions**:
* Ensure that the IAM role attached to your EC2 instance has the necessary permissions for CodeDeploy. AWS provides a managed policy named AWSCodeDeployRole for this purpose, or you can create a custom policy with the required permissions.
