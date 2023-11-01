# Integration/Logic App lab 

![Logic App](/exercisefiles/images/Drawing1.png)
# Step 0 - Create Resource Group

1. Navigate to Azure Portal and create a Resource Group.

  *  Resource Group Name : rg-eic-integration-**[YOUR-INITIALS]**
  *  Resource Group Location : westeurope

  > **Note** 
  > Replace **[YOUR-INITIALS]** with your own initials.

![Resource Group](images/ResourceGroup.png)

# Step 1 - Create Service Bus Namespace and topics


1. Clone the AppDevLearning repo to your local folder, and open it in VS Code.

1. On the VS Code, navigate on the top menu and click on View.
1. Click on Terminal, which should open a terminal window at the bottom pane - where you can run cli commands\
1. In the terminal window, navigate to the path exercisefiles\integrationworkshop\bicep
1. Login to Azure if you haven't already done so previously
    ```
    az login  
    ```
1. From here you can run the following command, which will create the Service bus namespace, topics and subscriptions. 
    ```
    az deployment group create --resource-group [YOUR-RESOURCE-GROUP] --template-file servicebus.bicep --parameters servicebus.bicepparam  
    ```
      > **Note** 
      > Replace **[YOUR-RESOURCE-GROUP]** with the resource group name you created at the beginning from the lab.
      
1. Once the command is succesful, you can navigate to the Azure Portal, and check in the resource group that a new service bus namespace has been created, and that it has the topics and subscriptions.

# Step 2 - Create Azure Functions
1. Using the same Terminal window, you can run another cli command as shown below which will create the Azure function app.
    ```
    az deployment group create --resource-group [YOUR-RESOURCE-GROUP] --template-file functions.bicep --parameters functions.bicepparam
    ```
      > **Note** 
      > Replace **[YOUR-RESOURCE-GROUP]** with the resource group name you created at the beginning from the lab.
      
1. Navigate to the Azure Portal, and check that Function App resource has been created for you.

1. Within this function app, we will create 2 Azure Functions within this Function App, which we will call as 1) MessageType and 2) FormatJSONPayload

1. To create the first Azure Function, from the overview page of the FunctionApp, click Create on Portal as shown below.

    ![Resource Group](images/FunctionsCreate.png)

1. Select a HttpTrigger template, and change the name to **MessageType** as shown below. Click Create, which will create the http triggered function for you, with some default code inside it.


    ![Resource Group](images/FunctionsCreate2.png)

1. Once the MessageType function is created, click on the code+test tab as shown below.

1. The code what you see here is the default code when you create a httptrigger function. Lets replace that with the code with prewritten code for you.
  
1. This function will determine if the incoming message type, and will spit out the xslt map name to be used, service bus topic on which this message should be published etc. This way, we are making these dynamic integrations, where we decide based on the incoming message, which map will be used and where will it go in the service bus.
   
    ![Resource Group](images/FunctionsCreate3.png)

1. To replace the code - navigate to Appdevlearning/exercisefiles/integrationworkshop/functionscode/messagetype.csx

1. Copy the code which is in messagetype.csx file in its entirety and paste it over the default code which it generated.

1. It should look something like this, after you finish pasting this code.
  

    ![Resource Group](images/FunctionsCreate4.png) 

1. Now to create the second Azure function, follow the same steps as you created the first Azure Function. Name it **FormatJsonPayload**, and copy paste the code from the formatjsonpayload.csx file.

1. At the end of the this step, you should have 2 functions called MessageType and FormatJsonPayload within your function app.

    ![Resource Group](images/FunctionsCreate5.png) 

**Optionally you can test the function app from the portal as well.**

# Step 3 - Create Logic App

1. Next step is to create a logic app. This is where we will be writing the integration steps, using a visual tool called workflow designer. This is helpful for developers to visually see the business process integration. At the end of step 3, you should see a logic app which will look like this. 
2. As you build the logic app in workflow designer, there is a code behind which is generated for you. This is a JSON file and is workflow definition language. I will be pasting the code behind for each of the actions you add, as a reference for you to check that you are doing it correctly in the designer. 
  
    ![Resource Group](images/finishedlogicapp.png)

3. Start creating a logic apps resource under the same resource group which we have been using
4. The following few screen shots should help you create a logic app
   
 
    ![Resource Group](images/logicapp1.png) 

    ![Resource Group](images/la3.1.png)
     > **Note** 
     > Give the Logic Apps a unique name. For example, you can use rg-eic-integration-**[YOUR-INITIALS]**-logicapp replacing **[YOUR-INITIALS]** with your own initials.
     
    ![Resource Group](images/la4.png) 
    ![Resource Group](images/la5.png) 
    ![Resource Group](images/la6.png) 
    ![Resource Group](images/la8.png) 
    ![Resource Group](images/la10.png)


1. Now that the logic app is created, which like function app, is a high level construct under which we can create multiple workflows (just like how you can create multiple functions within a function app)

2. We will be using XSLT mapping in our workshop. XSLT is a xml markup schema language to transform XML messages. These XSLT files are precreated for you. You can find them under integrationworkshop/xsltmapping folder in this repo. 

3. As shown below, please upload the 4 xslt files to maps tab as shown below. We will use these xslt maps when defining the integration in the next steps.
  
    ![Resource Group](images/uploadmaps.png)
   
4. Let us now create a new workflow under the logic app resource you have created. The following screen shots will help you in this process. 


    ![Resource Group](images/la11.png)

1. Give a meaningful workflow name, and mark it as stateful. Hit the create button
  
    ![Resource Group](images/la12.png)
1. Once the workflow is created for you, you can click on the designer tab, which is the visual designer which we will be using for developing our logic apps. If you have used PowerAutomate before, some of these will be familiar for you
1. First step in the logic app is the Trigger of that workflow. We will use a http request triggered workflow.

  ![Resource Group](images/la13.png)
    ![Resource Group](images/lahttprequest.png)
1. Rename the http request to something meaningful like "Student Enroled in SITS"
  
    ![Resource Group](images/la14.png)
```json
Code view for the trigger shape
{
  "type": "Request",
  "kind": "Http"
}
```
1. Next step is to add a Action to call one of the Azure functions we have created before.Let's rename this action to **Return Message Type** - Using the following screen shots, you can add this Azure function action, and create a connection string to call the **MessageType** function we created earlier.
1. We will be passing the same message which came in to the http request to the Azure function, along with sending 2 header values messagetype and operation, which are incoming from the http request as well.
  
    ![Resource Group](images/la15.png)
    ![Resource Group](images/la16.png)
    ![Resource Group](images/la17.png)
    ![Resource Group](images/la18.png)

    
    ![Resource Group](images/la19.png)

1. Let's pass the 2 header values which are part of the incoming message, called messagetype and operation. These 2 headers will determine what type of message we are receving, and we will pass these 2 header values to the MessageType function.
   
    ![Resource Group](images/la20.png)
    First header name is messagetype, and for the value - we will pass the header from the incoming message. Using the screen shot below, you can pass the value called 'messagetype'. When you finish this - the value should look something like this
    ```
    triggerOutputs()?['headers']['messagetype']
    ```
    ![Resource Group](images/la21.png)
    Now to add the second header called "operation", and the value set to the operation from the incoming message. When you are finished, it should look like this.
    ```
    triggerOutputs()?['headers']['operation']
    ```
    ![Resource Group](images/laoperationheader.png)
    
    Final view after adding both the headers.
    ![Resource Group](images/la22.png)
```json
Code view for the Return Message Type action
{
  "type": "Function",
  "inputs": {
    "method": "POST",
    "body": "@triggerBody()",
    "headers": {
      "messagetype": "@{triggerOutputs()?['headers']['messagetype']}",
      "operation": "@{triggerOutputs()?['headers']['operation']}"
    },
    "function": {
      "connectionName": "azureFunctionOperation"
    }
  },
  "runAfter": {}
}
```

1. Lets add the next action to our workflow, which is a compose Action. Compose action in logic app is to compose/create any message. In this case we are using compose shape to create a new json message, which is to wrap the incoming json message with a overall root node. Why do you need to wrap into a overall root node, you may be wondering. This is because we will be converting this json message to xml messagein the following steps - and xml conversion will expect a overall root node. The exact name of the root node to be wrapped will be returned by the Return Message Type
    
    ![Resource Group](images/la23.png)

    ![Resource Group](images/la24.png)

2. Let's rename this action as **Wrap in root node**
    ![Resource Group](images/la25.png)
3. For the inputs, we need to create a json as shown below. so we start with 2 curly brackets, and then use the wrapper element and the actual body of the message. When you finish the steps in the following 2 images, you should end up with a new json like this. As you see, we are wrapping the incoming message with a wrapper rootnode (this is returned from the Return Message Type)

    ![Resource Group](images/la26.png)
    Put a colon, and then add the trigger body as shown below - to have a valid json. 
    ![Resource Group](images/wraprootnode2.png)

    ```json
    This is how the json will look like when you finish this step.
    {
    "@body('Return_Message_Type')['wrapper']": "@triggerBody()"
    }
    ```

    ```json
    Code view for the Wrap in the root node action
    {
      "type": "Compose",
      "inputs": {
        "@body('Return_Message_Type')['wrapper']": "@triggerBody()"
      },
      "runAfter": {
        "Return_Message_Type": [
          "SUCCEEDED"
        ]
      }
    }
   ```
4. Let's add the next shape into our workflow, which is to Transform the XML message from one format to another. We will use an action called Transform XML as shown below.



  ![Resource Group](images/xmlaction.png)

5. Because Transform XML works with xml message, we need to convert the json file which we have to xml. Logic apps have built-in functions to do such conversions, one of them is called xml(), which will convert the object passed into XML. We will use this function to convert.
  
    ![Resource Group](images/la28.png)
1. We will dynamically use a map based on the incoming message, as determined by the returnmessagetype.Click on the Map Name text box, and provide the map name from the body of the Return message type as shown below 
  ![Resource Group](images/mapname.png)
```json
Code view of this Transform XML action
{
  "type": "Xslt",
  "inputs": {
    "content": "@xml(outputs('Wrap_in_Root_Node'))",
    "map": {
      "source": "LogicApp",
      "name": "@body('Return_Message_Type')['map']"
    }
  },
  "runAfter": {
    "Wrap_in_Root_Node": [
      "SUCCEEDED"
    ]
  }
}
```


2. Time to add the next action, which is again calling the second Azure function which we created called FormatJsonPayload. This function will take the incoming json, and formats, indents and sends the message back.
 
  ![Resource Group](images/la29.png)
3. Make sure you are using a new connection string for this Function call, as you want to call the FormatJsonPayload. At the bottom of the shape, you can see "change connection" - click on that
    ![Resource Group](images/la30.png)

```json
Code view of this Format JSON action
{
  "type": "Function",
  "inputs": {
    "method": "POST",
    "body": "@json(body('Transform_XML'))",
    "function": {
      "connectionName": "azureFunctionOperation-2"
    }
  },
  "runAfter": {
    "Transform_XML": [
      "SUCCEEDED"
    ]
  }
}
```

4. Time to add the next action in our workflow, which will be to send the message to Service Bus
5. You need to create a connection string to the service bus. To get the connection string for the service bus, refer the screen shot which states Serice Bus connection string.
 
    ![Resource Group](images/la32.png)
    ![Resource Group](images/la33.png)
![Resource Group](images/la28.png)
1. We will dynamically use a map based on the incoming message, as determined by the returnmessagetype. 
![Resource Group](images/mapname.png)
1. Time to add the next action, which is again calling the second function which we created called FormatJsonPayload. This function will take the incoming json, and formats, indents and sends the message back. 

![Resource Group](images/la29.png)

1. Make sure you are using a new connection string for this Function call, as you want to call the FormatJsonPayload. At the bottom of the shape, you can see "change connection" - click on that
   
![Resource Group](images/la30.png)
1. Time to add the next action in our workflow, which will be to send the message to Service Bus
1. You need to create a connection string to the service bus. To get the connection string for the service bus, refer the screen shot which states Serice Bus connection string.
* 
![Resource Group](images/la32.png)
![Resource Group](images/la33.png)

   **Service Bus Connecting String**
![Resource Group](images/sbconnectinnstring.png)

![Resource Group](images/la38.png)
![Resource Group](images/la37.png)
Final step is to add the Response as shown below. 
![Resource Group](images/la39.png)

# Step 4 - Send Request from Postman

Now that you have completed developing logic app, its time to test it by passing on a message.

We will use postman to mimic the student enrolled in SITS and a request coming into Azure.

I have created sample files for you to test - Integrationworkshop/testfiles.

Using postman you can start creating requests to test the logic app. 
