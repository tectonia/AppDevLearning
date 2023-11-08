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
## Create a GitHub repo
1. Go to your GitHub profile and create a new repo:
   
![image](https://github.com/tectonia/AppDevLearning/assets/61530975/30241db8-c067-4578-b059-df8a1b5a1fcb)
3. Navigate to your .NET app created previously and run the command below in the terminal to initialize a git repository:
```
 git init 
 ```
3. Stage and commit your app:
```
 git add .
 git commit -m "Creating a 'hello world' dotnet webapp"
 ```
4. Add the reference to your remote repo, create a branch reference and push your repo to the remote origin.
```
git remote add origin https://github.com/<your-github-handle>/<name-of-your-github-repo>.git
git branch -M main
git push -u origin main
 ```
5. Check that your code is in your repo!
## Commits, branching and pull requests
6. Create a new branch:
```
git switch -c dev
 ```
7. Make a small change to your app e.g.
   
![image](https://github.com/tectonia/AppDevLearning/assets/61530975/81955d54-c20c-483b-abd6-632bca7b0494)
8. Commit changes and push your dev branch:
```
git add MyWebApp/Pages/Index.cshtml
git commit -m "Change Index page headline"
git push --set-upstream origin dev
 ```
9. Go back to the portal and make sure you can see your new branch:

![image](https://github.com/tectonia/AppDevLearning/assets/61530975/89e6543c-9c7f-4005-b03c-0657259ebd9e)
10. Create a pull request:

![image](https://github.com/tectonia/AppDevLearning/assets/61530975/64d585cc-0a13-44b9-ad4b-cbea34c8a8a4)
11. (Optional) Add your peer as a reviewer before you merge your PR!

![image](https://github.com/tectonia/AppDevLearning/assets/61530975/c8d05bb1-cbe1-4828-b8e0-b7af0955f0af)
12. Merge your pull request and delete the branch. 

## Setup a GitHub Actions workflow for App Service deployment
(Optional) If you don't have app service, go to portal.azure.com and create one:

![image](https://github.com/tectonia/AppDevLearning/assets/61530975/6df84f21-d75c-4040-aafe-f4d05bb1fc52)

Make sure you choose Python 3.9 on the creation page and fill in the required fields:

![image](https://github.com/tectonia/AppDevLearning/assets/61530975/f87c2717-6c68-46c0-9780-9eccf3457a4d)



13. Go to the Azure Portal and navigate to the previously deployed App Service's configuration under settings and enable basic authentication:

![image](https://github.com/tectonia/AppDevLearning/assets/61530975/00a9f8a7-754f-400a-b57e-21a5fd0a851d)
14. Go to the deployment centre:

![image](https://github.com/tectonia/AppDevLearning/assets/61530975/37d5e408-7586-4a78-8129-608d28e4e589)
15. Set up your code repo to be your GitHub repo:

![image](https://github.com/tectonia/AppDevLearning/assets/61530975/29914a8a-2397-4877-a349-1414d6d01588)

16. Check out the new GitHub Actions workflow deploying your app in the GitHub portal!

![image](https://github.com/tectonia/AppDevLearning/assets/61530975/9a9869b0-fdec-4b74-ae30-46de8ed91672)


## GitHub Copilot (with Python)
You can use [this setup guide](https://learn.microsoft.com/en-us/training/modules/introduction-copilot-python/3-exercise-setup) and [this exercise](https://learn.microsoft.com/en-us/training/modules/introduction-copilot-python/5-exercise-python-web-api). Otherwise, try to change your existing app and add some functionality. Have fun!
