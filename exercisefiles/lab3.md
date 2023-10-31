# Integration/Logic App lab 

![Logic App](/exercisefiles/images/Drawing1.png)
# Step 0 - Create Resource Group

* Navigate to Azure Portal and create a Resource Group.

  >  Resource Group Name : rg-eic-integration-<initials>\
  >  Resource Group Location : westeurope

![Resource Group](images/ResourceGroup.png)

# Step 1 - Create Service Bus Namespace and topics


* Clone the AppDevLearning repo to your local folder, and open it in VS Code.

* On the VS Code, navigate on the top menu and click on View.
* Click on Terminal, which should open a terminal window at the bottom pane - where you can run cli commands\
* In the terminal window, navigate to the path exercisefiles\integrationworkshop\bicep
* From here you can run the following command, which will create the Service bus namespace, topics and subscriptions. 
```
az deployment group create --resource-group <rg name> --parameters servicebus.bicepparam  
```
* Once the command is succesful, you can navigate to the Azure Portal, and check in the resource group that a new service bus namespace has been created, and that it has the topics and subscriptions.

# Step 2 - Create Azure Functions
* Using the same Terminal window, you can run another cli command as shown below which will create the Azure function app.
```
az deployment group create --resource-group <rg name> --parameters functions.bicepparam
```
* Navigate to the Azure Portal, and check that Function App resource has been created for you.

* Within this function app, we will create 2 Azure Functions within this Function App, which we will call as 1) MessageType and 2) FormatJSONPayload

* To create the first Azure Function, from the overview page of the FunctionApp, click Create on Portal as shown below.

![Resource Group](images/FunctionsCreate.png)

* Select a HttpTrigger template, and change the name to **MessageType** as shown below. Click Create, which will create the http triggered function for you, with some default code inside it.


![Resource Group](images/FunctionsCreate2.png)

* Once the MessageType function is created, click on the code+test tab as shown below.

* The code what you see here is the default code when you create a httptrigger function. Lets replace that with the code with prewritten code for you.
  
* This function will determine if the incoming message type, and will spit out the xslt map name to be used, service bus topic on which this message should be published etc. This way, we are making these dynamic integrations, where we decide based on the incoming message, which map will be used and where will it go in the service bus.
   
![Resource Group](images/FunctionsCreate3.png)

* To replace the code - navigate to Appdevlearning/exercisefiles/integrationworkshop/functionscode/messagetype.csx

* Copy the code which is in messagetype.csx file in its entirety and paste it over the default code which it generated.

* It should look something like this, after you finish pasting this code.
  

![Resource Group](images/FunctionsCreate4.png) 

* Now to create the second Azure function, follow the same steps as you created the first Azure Function. Name it **FormatJsonPayload**, and copy paste the code from the formatjsonpayload.csx file.

* At the end of the this step, you should have 2 functions called MessageType and FormatJsonPayload within your function app.

![Resource Group](images/FunctionsCreate5.png) 

**Optionally you can test the function app from the portal as well.**

# Step 3 - Create Logic App

* Next step is to create a logic app. This is where we will be writing the integration steps, using a visual tool called logic apps designer. At the end of step 3, you should see a logic app which will look like this. 
  
![Resource Group](images/finishedlogicapp.png)

* Start creating a logic apps resource under the same resource group which we have been using
* The following few screen shots should help you create a logic app
  
![Resource Group](images/logicapp1.png) 
![Resource Group](images/la2.png) 
![Resource Group](images/la3.png) 
![Resource Group](images/la3.1.png) 
![Resource Group](images/la4.png) 
![Resource Group](images/la5.png) 
![Resource Group](images/la6.png) 
![Resource Group](images/la8.png) 
![Resource Group](images/la10.png)

* Now that the logic app is created, which like function app, is a hihg level construct under which we can create multiple workflows (just like how you can create multiple functions within a function app)

* We will be using XSLT mapping in our workshop, and these XSLT files are precreated for you. You can find them under integrationworkshop/xsltmapping folder in this repo. 

* As shown below, please upload the 4 xslt files to maps tab as shown below. We will use these xslt maps when defining the integration in the next steps.
  
![Resource Group](images/uploadmaps.png)
* Let us now create a new workflow under the logic app resource you have created. The following screen shots will help you in this process. 


![Resource Group](images/la11.png)

* Give a meaningful workflow name, and mark it as stateful. Hit the create button
  
![Resource Group](images/la12.png)
* Once the workflow is created for you, you can click on the designer tab, which is the visual designer which we will be using for developing our logic apps. If you have used PowerAutomate before, some of these will be familiar for you
* First step in the logic app is the Trigger of that workflow. We will use a http request triggered workflow.
  
![Resource Group](images/la13.png)
![Resource Group](images/lahttprequest.png)
* Rename the http request to something meaningful like "Student Enroled in SITS"
  
![Resource Group](images/la14.png)

* Next step is to add a Action to call one of the Azure functions we have created before.
  
![Resource Group](images/la15.png)
![Resource Group](images/la16.png)
![Resource Group](images/la17.png)
![Resource Group](images/la18.png)

test
![Resource Group](images/la19.png)
![Resource Group](images/la20.png)
![Resource Group](images/la21.png)
![Resource Group](images/la22.png)
![Resource Group](images/la23.png)

![Resource Group](images/la24.png)
![Resource Group](images/la25.png)
![Resource Group](images/la26.png)
![Resource Group](images/la27.png)
![Resource Group](images/la28.png)
![Resource Group](images/la29.png)
![Resource Group](images/la30.png)
![Resource Group](images/la32.png)
![Resource Group](images/la33.png)
![Resource Group](images/la36.png)
![Resource Group](images/la37.png)
![Resource Group](images/la38.png)
![Resource Group](images/la39.png)

# Step 4 - Send Request from Postman

Now that you have completed developing logic app, its time to test it by passing on a message.

We will use postman to mimic the student enrolled in SITS and a request coming into Azure.

I have created sample files for you to test - Integrationworkshop/testfiles.

Using postman you can start creating requests to test the logic app. 