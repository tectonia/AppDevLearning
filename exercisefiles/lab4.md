# DevOps lab
### **NOTE!** 
### If you already have a .NET app from last week's session - feel free to use that. If not - feel free to clone this [python flask app](https://github.com/Azure-Samples/msdocs-python-flask-webapp-quickstart).
## What is DevOps?
The purpose of this lab is to familiarise you with the basics of using git and GitHub (don't know the difference? [click here!](https://www.geeksforgeeks.org/difference-between-git-and-github/)) and the software development cycle in an agile team. 
We'll cover the following topics:
- GitHub repositories
- Commits, branching and pull requests
- Continous integration and deployment with GitHub Actions
- GitHub Copilot

**Let's get started!**
## How to clone the python flask app (if you already have a .NET web app, you can skip this)
### :bulb: What does cloning a repository mean?

Cloning a GitHub repository means creating a local copy of a project that exists on GitHub. It's like downloading the entire project, including all its files, commit history, and branches, to your computer so you can work on it independently. 

1. Create an empty folder on your computer for your web app
   
2. Open VSCode

3. File > Open folder > Your new folder

4. Click Terminal > New Terminal

5. Navigate to Azure-Samples/msdocs-python-flask-webapp-quickstart in the terminal. This folder contains the sample application for the App Service Quickstart in Python using Flask.
    1. Click the green button that says “Clone”
    2. Copy the web URL

6. In the terminal enter this command:
```
git clone https://github.com/Azure-Samples/msdocs-python-flask-webapp-quickstart.git
 ```
7. Once it has added the code to your folder, run this command to navigate to the right folder:
 ```
cd msdocs-python-flask-webapp-quickstart
 ```


## Create a GitHub repo
1. Go to your GitHub profile and create a new repo:
   
![image](https://github.com/tectonia/AppDevLearning/assets/61530975/30241db8-c067-4578-b059-df8a1b5a1fcb)
<br>
<br>

2. Navigate to your .NET app created previously and run the command below in the terminal to initialize a git repository:
```
 git init 
 ```
:bulb: The `git init` command initializes a new Git repository in your current directory, creating the necessary files and subdirectories for version control. 
<br>
<br>

3. Stage and commit your app:
```
 git add .
 git commit -m "Creating a 'hello world' dotnet webapp"
 ```
:bulb: The `git add .` command stages all the changes in your current directory, preparing them to be committed. 

:bulb: The `git commit -m "Commit message"` command then takes those staged changes and saves them in the repository with a descriptive message, creating a new commit in the project's history.
<br>
<br>

4. Add the reference to your remote repo, create a branch reference and push your repo to the remote origin.
```
git remote add origin https://github.com/<your-github-handle>/<name-of-your-github-repo>.git
git branch -M main
git push -u origin main
 ```
:bulb: `git remote add origin https://github.com/<your-github-handle>/<name-of-your-github-repo>.git`: This command adds a remote repository (a version of your project hosted on GitHub) and names it ‘origin’. It’s like setting a bookmark to the URL of your GitHub repository so you can easily push your local changes to GitHub.

:bulb: `git branch -M main`: This command renames the current branch to ‘main’.

:bulb: `git push -u origin main`: This command uploads your local branch named ‘main’ to the remote repository ‘origin’ on GitHub and sets up tracking so that future git push commands will know where to send your changes. The -u flag is a shorthand for --set-upstream, which configures the local branch to track the remote branch.
<br>
<br>

5. Navigate back to your GitHub repo in the browser and check that the code is there!

## Commits, branching and pull requests
1. Create a new branch:
```
git switch -c dev
 ```
:bulb: The `git switch -c dev` command creates a new branch named 'dev' and switches to it. This is useful for starting a new line of development or feature without affecting the main codebase. 
<br>
<br>

2. Make a small change to your app e.g.
   
![image](https://github.com/tectonia/AppDevLearning/assets/61530975/81955d54-c20c-483b-abd6-632bca7b0494)
<br>
<br>

3. Commit changes and push your dev branch:
```
git add MyWebApp/Pages/Index.cshtml
git commit -m "Change Index page headline"
git push --set-upstream origin dev
 ```
:bulb: `git add MyWebApp/Pages/Index.cshtml`: This command stages the specific file located in the directory, preparing it to be included in the next commit. It's useful for when you want to commit changes to a particular file rather than all modified files. Change the command to be where you made your change.

:bulb: `git commit -m "Change Index page headline"`: Just like earlier, this command creates a new commit with the staged changes and includes a message describing the changes. 

:bulb: `git push --set-upstream origin dev`: This command pushes the local 'dev' branch to the remote repository 'origin' on GitHub and sets up tracking so that future `git push` commands will know where to send your changes.

<br>
<br>

4. Navigate back to the GitHub portal and make sure you can see your new branch:
![image](https://github.com/tectonia/AppDevLearning/assets/61530975/89e6543c-9c7f-4005-b03c-0657259ebd9e)
<br>
<br>

5. Create a pull request:
![image](https://github.com/tectonia/AppDevLearning/assets/61530975/64d585cc-0a13-44b9-ad4b-cbea34c8a8a4)
<br>
<br>

6. (Optional) Add your peer as a reviewer before you merge your PR (Pull Request)!
![image](https://github.com/tectonia/AppDevLearning/assets/61530975/c8d05bb1-cbe1-4828-b8e0-b7af0955f0af)
<br>
<br>

7. Merge your pull request and delete the branch.


## Setup a GitHub Actions workflow for App Service deployment
### :bulb: Why?

Creating an App Service web app and deploying code from a GitHub repository using GitHub Actions offers a streamlined and automated workflow for developers.

This approach allows for continuous deployment, meaning that every time you push changes to your GitHub repository, the updates are automatically deployed to your web app. 

It's particularly beneficial because it ensures that your application is always up-to-date with the latest code changes, reduces the risk of human error during deployment, and saves time by eliminating the need for manual deployments. 

Additionally, it provides a consistent and repeatable deployment process, which is crucial for maintaining the reliability and stability of your web application. Overall, it's a powerful method to manage and deploy web applications efficiently.

### Create an App Service Web App
1. Open up the Azure Portal

2. Search for or click on App Service (or Web App via search)

![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-0.png)
![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-0.5.png)

3. Create a new Web App 
    1. **Resource Group**: Create a new one or add to one you are already using
    2. **Name**: Name your app
    3. **Runtime Stack**: Python 3.9
    4. **Region**: UK South
    5. **Pricing plan**: Free F1
    6. (Everything else can stay default)
  
![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-1.png)
![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-2.png)


### Create a User Assigned Managed Identity
1. Click Review + Create
    1. Navigate to the resource group you created your app in
    2. Click + Create > Search “User assigned managed identity” > Click Create
    3. Create a User Assigned Managed Identity
        1. **Name**: (your app’s name)-identity
        2. Review + Create
      
![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-3.png)

### Deploy your App
1.	Navigate back to your App Service Web App
2.	Under Settings on the left hand side, click Identity
    1.	Navigate to User Assigned and click Add User Assigned Managed Identity
    2.	Click your recently created identity and then click Add
    
![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-4.png)
![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-5.png)

   
4.	Under Deployment, click Deployment Center
    1.	Fill out the following information:
    2.	**Source**: GitHub
    3.	**Organisation**: Your GitHub username
    4.	**Repository**: The repository you created with your web app’s code
    5.	**Branch**: main
    6.	**Authentication Type**: User-assigned identity
    7.	**Identity**: The identity you created earlier
    8.	Click Save
  
![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-6.png)
![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-7.png)

      
5.	Go to your GitHub repository
   1.	Navigate to the Actions tab
   2.	Watch your pipeline deploy your web app
   3.	If you get a green check, it has deployed correctly!
   4.	Check if it has been successful in the Deployment Center as well

![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-8.png)
![image](https://github.com/tectonia/AppDevLearning/blob/main/exercisefiles/images/devops-9.png)


## GitHub Copilot (with Python)
You can use [this setup guide](https://learn.microsoft.com/en-us/training/modules/introduction-copilot-python/3-exercise-setup) and [this exercise](https://learn.microsoft.com/en-us/training/modules/introduction-copilot-python/5-exercise-python-web-api). Otherwise, try to change your existing app and add some functionality. Have fun!
