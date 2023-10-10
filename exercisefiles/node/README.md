# Activate GitHub Copilot using Nodejs

Demo project for running labs to evaluate Copilot viability

## Instructions

- Download to local the exercisefile folder
- Open NodeServer.js and begin by writing a Nodejs server, check the first suggestions based on the initial text
- Open test.js file and analyze the current test
- Open a command prompt and run the test (mocha test.js)
- See the result, it should display something like:

```bash
mocha test.js
server is listening on port 3000

  Node Server

    √ should return "key not passed" if key is not passed

  1 passing (34ms)

```

- In the NodeServer.js develop the rest of the methods described in the Exercise described in the section below (do not forget to open color.json file in Visual Studio Code, so Copilot get all the context to make better recommendations)
- In the Test.js file add the methods to test the functionality
- Run the tests to verify that all is working
- Open the dockerfile file, and fill it, in order to create a docker container with a node image that can run the web server
- Create command to run docker in port 4000
- Test that the application is working in port 4000
- In the **nodeserver.js** file, you can type a new line like //run a curl command to test the server

So we can see how Copilot based on the current file produces a curl command, to be executed in command line

- Also you can be more specific like: //run a curl command to test the daysBetweenDates method

So it generates a test for a specific method

## Exercise

The exercise consist of building a web server using Nodejs that serves the request of various functionality.

The requests that the server must attend are the following:

- **/Get** :

Return a hello world message

- **/DaysBetweenDates**:

Calculate days between two dates

receive by query string 2 parameters date1 and date 2, and calculate the days between those two dates.

- **/Validatephonenumber**:

Receive by querystring a parameter called phoneNumber
validate phoneNumber with Spanish format, for example +34666777888
if phoneNumber is valid return "valid"
if phoneNumber is not valid return "invalid"

- **/ValidateSpanishDNI**:

Receive by querystring a parameter called dni
calculate DNI letter
if DNI is valid return "valid"
if DNI is not valid return "invalid"

We will create automated tests to check that the functionality is correctly implemented.
When the development is completed, we will build a container using Docker

- **/ReturnColorCode**:

Receive by querystring a parameter called color

read colors.json file and return the rgba field

get color var from querystring

iterate for each color in colors.json to find the color

return the code.hex field

- **/TellMeAJoke**:

Make a call to the joke api and return a random joke using axios

- **/MoviesByDirector**:

(this will require to browse to https://www.omdbapi.com/apikey.aspx and request a FREE API Key)

Receive by querystring a parameter called director

Make a call to the movie api and return a list of movies of that director using axios

Return the full list of movies

- **/ParseUrl**:

Retrieves a parameter from querystring called someurl

Parse the url and return the protocol, host, port, path, querystring and hash

Return the parsed host

- **/ListFiles**:

Get the current directory

Get the list of files in the current directory

Return the list of files

- **/GetFullTextFile**:

Read sample.txt and return lines that contains the word "Fusce"

(becareful with this implementation, since this normally reads the full content of the file before analizing it, so memory usage is high and may fail when files are too big)

- **/GetLineByLinefromtTextFile**:

Read sample.txt line by line

Create a promise to read the file line by line, and return a list of lines that contains the word "Fusce"

Return the list of lines

- **/CalculateMemoryConsumption**:

Return the memory consumption of the process in GB, rounded to 2 decimals

- **/MakeZipFile**:

Using zlib create a zip file called sample.gz that contains sample.txt

- **/RandomEuropeanCountry**:

Make an array of european countries and its iso codes

Return a random country from the array

Return the country and its iso code

## GitHub Copilot Chat exercises

The following tasks can be performed using the Copilot Chat add-in, currently this is in BETA so you may find some bugs.

Make sure to install the GitHub Copilot Chat extension: https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat
(If working in a codespace this will have been added automatically for you via configuration)

Open GitHub Copilot extension to see all the available functionality.

- **Explain**

Select the line that has the regex in the validatePhoneNumber method, in the chat ask Copilot chat to explain this code for you (note you can type /explain to shorten this ask).

- **Language translation**

Select some source code, like this line or the entire method:

    var randomCountry = countries[Math.floor(Math.random() * countries.length)];

In "LANGUAGE TRANSLATION" section select python and click "Ask Copilot" button, you should see new code in python.

- **Readable**

Select the content of MakeZipFile or another area you implemented.

In the chat ask Copilot to make your code more readable.

-- **Fix Bug**

In the exercise, there should be no bugs, since most of the code will be done by Copilot. We can force some errors and then test the debug functionality.

Force some errors like:

In a for loop change the beginning to (change the 0 for a 1):

    for (var i = 1

Then select the code and ask copilot chat to fix the bugs it may find (note you can type /fix to shorten this ask).

-- **Document**

Select some lines of code that you implemented

In the chat ask Copilot to add a comment to explain each line

-- **Test Generation**

You may have been creating Unit Tests for all your code so far, so if you have please remove tests for one of your implementations and select the code without tests and ask Copilot Chat to add unit tests (note you can type /tests to shorten this ask).

## Explore Copilot and Copilot Chat

Use the skills you have learned from Copilot and Copilot Chat to start some new code of your choosing and add to this code
Examples may be:
- A new website based on a new framework
- Create an application in a language you are unfamiliar with (note the codespace is only configured for node, java and dotnet)
- Create a new API
- Do some Infrastructure-as-code to create some cloud resources using Terraform, ARM or Bicep.
- Use your imagination, have some fun!
