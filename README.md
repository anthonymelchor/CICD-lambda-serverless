# Project Introduction: Streamlined AWS CodePipeline for Lambda and CloudFormation

Welcome to the GitHub repository: [CICD-lambda-serverless](https://github.com/anthonymelchor/CICD-lambda-serverless.git). This project is all about optimizing your deployment process with an AWS CodePipeline that seamlessly handles Lambda functions and CloudFormation stacks.

### Key Highlights:
- **CodePipeline Magic:** Discover the power of AWS CodePipeline as it automates your deployment workflow, ensuring efficient and reliable delivery.
- **Leveraging Lambda:** Dive into Lambda functions hosted directly from GitHub. Witness the synergy between code management and serverless architecture.
- **Effortless Infrastructure:** Explore CloudFormation templates orchestrating the creation of resource stacks, offering a simplified way to manage your infrastructure.

The repository holds all the insights, code, and documentation you need to explore and implement this project. Whether you're new to DevOps or an experienced developer, this repository provides a valuable resource for enhancing your deployment strategies.

Visit the repository: [CICD-lambda-serverless](https://github.com/anthonymelchor/CICD-lambda-serverless.git) to uncover the full potential of AWS CodePipeline and streamline your serverless deployment journey.

### Happy coding!

### Cloud9 Enviroment Creation
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
