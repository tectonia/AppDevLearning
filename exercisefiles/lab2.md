# Cloud Native/App Service lab
Following the plan [here](https://learn.microsoft.com/en-us/azure/app-service/quickstart-dotnetcore?tabs=net70&pivots=development-environment-vscode)

## Prerequities
1. An Azure account with an active subscription.
2. Visual Studio Code.
3. The Azure Tools extension.
4. The latest .NET 7.0 SDK.

**Align with Simon on this **


## Step Zero Understanding web apps
Cover:
1. App Service is the umbrella terms of web apps, web app for containers, APIs etc.
2. platform as a service - managed service -what that means
3. Fastest way to get some web capability public
4. Cares little about the programming language or runtime
5. TLS out of the box (not so with all other compute services)
6. Deploying the web app and deploying its code are two separate things - each with their own lifecycle. Deploying the code must be after the web app and is usually done much more frequently.

   
## Step One Create an ASP.NET web app

Things to think about:
1. It's name
2. Resource Group
3. Region
4. Service plan - Windows or Linux and SKU
5. Runtime

## Step Two build and run locally
This should be covered from the previous session. Make sure your application is up and running locally.

## Step Three Create a web app in the portal
Steps:
1. type "web app" in the search part of the portal
2. Choose the "App Services" item in the search results
![alt text](./images/portal-web-apps.png "App Services")

3. Choose "Create" then "Web App"
![alt text](./images/portal-web-app-create.png "create web app")
   
4. You should then choose some suitable values for the web app. The name must be unique. 
![alt text](./images/portal-web-app-create-options.png "web app create options")

5. Hit the "Create" button and then wait a few minutes.

You should now have a web application in the portal. This is now a public-facing live web site with the URL https://YOUR_WEB_APP_NAME.azurewebsites.net.

Try putting that in a browser session (with your web app name). You should see something like this:
![alt text](./images/empty-web-app-runnning.png "web app running before code")

If this is the case, then the web app exists and is running. All we have to do now it to put our own code on the web app so that it is a real application.

## Step Four Deploy/Publish from VS Code to the web app

## Step Five make a change and redeploy

## Stretch goal
1. container
2. deployment slot
3. authentication
4. 
