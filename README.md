# Streamlined AWS CodePipeline for Lambda and CloudFormation

Welcome to the GitHub repository: [CICD-lambda-serverless](https://github.com/anthonymelchor/CICD-lambda-serverless.git). This project is all about optimizing your deployment process with an AWS CodePipeline that seamlessly handles Lambda functions and CloudFormation stacks.

### Key Highlights:
- **CodePipeline Magic:** Discover the power of AWS CodePipeline as it automates your deployment workflow, ensuring efficient and reliable delivery.
- **Leveraging Lambda:** Dive into Lambda functions hosted directly from GitHub. Witness the synergy between code management and serverless architecture.
- **Effortless Infrastructure:** Explore CloudFormation templates orchestrating the creation of resource stacks, offering a simplified way to manage your infrastructure.

The repository holds all the insights, code, and documentation you need to explore and implement this project. Whether you're new to DevOps or an experienced developer, this repository provides a valuable resource for enhancing your deployment strategies.

Visit the repository: [CICD-lambda-serverless](https://github.com/anthonymelchor/CICD-lambda-serverless.git) to uncover the full potential of AWS CodePipeline and streamline your serverless deployment journey.

### Happy coding!

### Creating Cloud9 Enviroment
Initially, we will use the AWS Cloud9 service to execute our CloudFormation template.

1. Navigate to the Cloud9 service in the AWS console and create a new Cloud9 Environment.

![1](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/efb98289-6337-4084-b620-b0a87d41674f)

2. Give it a name, and then leave all the defaults as in. Press the "Create" button to create the environment.

![2](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/68e42bd1-0245-4b81-aa01-80b710b1617c)

## Creating Stacks
1. After the environment has been successfully created, open it up, and from the console, clone the current repository:
```
git clone https://github.com/anthonymelchor/CICD-lambda-serverless.git
```
![3](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/8dca9429-5caa-4ef1-a4f2-6bbd2616c7b0)

2.  Navigate to the 'CICD-lambda-serverless' project and then to the 'code_pipeline' folder. Execute the following command to create our first services stack:
```
sh codepipeline.sh
```
![4](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/5bd9ef76-2711-4bf2-ad23-604b966fc234)

3. To validate that the process of creating the stack was successful, we can go into the AWS CloudFormation service, where we will visualize the 'codepipeline-transactions' stack and its resources:

![5](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/8e2f282a-06fe-43c7-bebe-d9efaf21db69)

4. We will follow a similar process to create our second stack:

```
sh dynamodb.sh
```
![6](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/8a354367-c143-4bb8-a61b-9058c074436a)

### Creating Pipeline
1. Navigate to the CodePipeline service in the AWS console and create a new pipeline:

![7](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/4859b15e-d3e7-4045-8c61-89311cac16d6)

2. Give it a name, select the 'Existing service role' option, and then choose the role 'codePipelineRole' created through the 'codepipeline-transactions' stack. Press the "Next" button:

![8](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/fad458b5-2bd7-42e5-8ef1-b5faa892d890)

3. Choose  GitHub as source provider in the 'source' pption, we connect to GitHub acount where the source code is hosted.  We select the repository and the branch. Press the button 'Next':

![9](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/d19c3572-ee98-4bf3-9039-ed3f0e82941f)

![10](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/de4651bf-c3d5-4a7d-9ee8-79b0a2f3da54)

4. Choose AWS CodeBuild as the Build provider y we proceed to create a new project:

![11](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/489b2839-d37e-497e-9c8a-bcd7f8a3dead)

![12](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/48746a5d-3962-46a4-b599-fed9a292f5b6)

![13](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/59d0f439-8694-4213-b23e-be3fb124803f)

Select the 'Existing service role' option, and then choose the role 'codeBuildRole' created through the 'codepipeline-transactions' stack.

![14](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/6bfc1fff-b6ad-45d7-9b09-2f102395be4c)


Choose the 'Additional configuration' option to set up an environment variable. Type 'S3_BUCKET' in the 'Name' field and paste the bucket name that was generated in the 'codepipeline-transactions' stack into the 'Value' field. You'll find the specific bucket name under the 'Resources' tab within the 'codepipeline-transactions' stack. The 'S3_BUCKET' variable will play a role in storing the compiled package for the pipeline. You'll also observe how this environment variable is used in the 'buildspec.yml' file.

![15](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/9c168212-bea4-4493-a055-3c043b970cd1)

![16](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/ff4d6d97-a31f-4505-abac-9cb4e76d262d)

In the 'Buildspec' option select 'Use a buildspec file' and type 'config/buildspec.yml'. This file is a collection of build commands and related settings, in YAML format, that CodeBuild uses to run a build. Press the button 'Continue to CodePipeline'.

![17](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/6079bc07-67a7-4d51-a5eb-81ac9a58e6f5)

In the 'Add deploy stage' step, choose AWS CloudFormation as the deploy provider. Select the 'Create or update a stack' option, and then provide a name for the 'stack name.' Next, pick 'BuildArtifact' in the 'Artifact name' field and in the file name field, put the name of the output template. In the 'file name' field, enter the name of the output template, which is generated during the artifact compilation step and defined in the 'buildspec.yml' file. In our scenario, this template is named 'output.yml'.

![18](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/32312074-2b23-461f-9a94-9b771ea1dae4)

Choose the 'capabilities' option and select the CloudFormation role that was created using the 'codepipeline-transactions' stack. Then, click on the 'Next' button followed by the 'Create pipeline' button.

![19](https://github.com/anthonymelchor/CICD-lambda-serverless/assets/48603061/8f4302fb-ab30-4b78-8ac3-fb4373fb8f7c)



