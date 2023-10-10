# Goal

The goal is to create a Minimal WebAPI using .NET 7.0 and a corresponding Docker image with the help of GitHub Copilot.
Follow the instructions below and try to use GitHub Copilot as much as possible.
Try different things and see what GitHub Copilot can do for you, like generating a Dockerfile or a class, add comments, etc.

> Make sure GitHub Copilot is configure and enabled for the current laguage, just check the status bar on the bottom right corner of VS Code.

## Instructions

The `dotnet` folder contains the `MinimalAPI.sln` solution, with 2 projects:

- `MinimalAPI` is a minimal WebAPI project created using `dotnet new webapi -minimal`
- `MinimalAPI.Tests` is a minimal xUnit project created using `dotnet new xunit`

To run the tests, open a terminal in the `dotnet` folder and run:

```bash
dotnet test
```

To run the app, open a terminal in the `dotnet` folder and run:

```bash
dotnet run --project .\MinimalAPI\MinimalAPI.csproj
```

### Exercise 1

- Inside `MinimalAPI\Program.cs` add a new Hello World endpoint at `/` that returns a `Hello World!` string.
- Run `dotnet test`
- If test pass you should see something like this:

```bash
Microsoft (R) Test Execution Command Line Tool Version 17.6.0 (x64)
Copyright (c) Microsoft Corporation.  All rights reserved.

Starting test execution, please wait...
A total of 1 test files matched the specified pattern.

Passed!  - Failed:     0, Passed:     1, Skipped:     0, Total:     1, Duration: < 1 ms - MinimalAPI.Tests.dll
```

### Exercise 2

- Inside `MinimalAPI\Program.cs` add the following endpoints:

- **/DaysBetweenDates**:

Calculate days between two dates

receive by query string 2 parameters date1 and date 2, and calculate the days between those two dates.

- **/validatephonenumber**:

Receive by querystring a parameter called phoneNumber
validate phoneNumber with UK format, for example +44666777888
if phoneNumber is valid return true

- **/validateukpostcode**:

Receive by querystring a parameter called postcode
validate the UK postcode
if the postcode is valid return "valid"
if the postcode is not valid return "invalid"

- **/returncolorcode**:

Receive by querystring a parameter called color

read colors.json file and return the rgba field

get color var from querystring

iterate for each color in colors.json to find the color

return the code.hex field

- **/tellmeajoke**:

Make a call to the joke api (https://v2.jokeapi.dev/joke/Any) and return a random joke using axios

- **/moviesbydirector**:

(this will require to browse to https://www.omdbapi.com/apikey.aspx and request a FREE API Key)

Receive by querystring a parameter called director

Make a call to the movie api and return a list of movies of that director using axios

Return the full list of movies

- **/parseurl**:

Retrieves a parameter from querystring called someurl

Parse the url and return the protocol, host, port, path, querystring and hash

Return the parsed host

- **/listfiles**:

Get the current directory

Get the list of files in the current directory

Return the list of files

- **/calculatememoryconsumption**:

Return the memory consumption of the process in GB, rounded to 2 decimals

- **/randomeuropeancountry**:

Make an array of european countries and its iso codes

Return a random country from the array

Return the country and its iso code

### Exercise 3

- Create a Dockerfile for the Minimal API project.

- Build the image and run the app on port 8080

```powershell
docker build -t dotnetapp .
docker run -d -p 8080:80 --name dotnetapp dotnetapp
```

# GitHub Copilot Chat exercises

The following tasks can be performed using the Copilot Chat add-in, currently this is in BETA so you may find some bugs.

Make sure to install the GitHub Copilot Chat extension: https://marketplace.visualstudio.com/items?itemName=GitHub.copilot-chat
(If working in a codespace this will have been added automatically for you via configuration)

Open GitHub Copilot extension to see all the available functionality.

- **Explain**

Select the line that has the regex in the validatePhoneNumber method, in the chat ask Copilot chat to explain this code for you (note you can type /explain to shorten this ask).

- **Language translation**

Select some source code such as your randomeuropeancountry:

```csharp
var countries = new[] { "Spain", "France", "Germany", "Italy", "Portugal", "Sweden", "Norway", "Denmark", "Finland", "Iceland", "Ireland", "United Kingdom", "Greece", "Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Estonia", "Hungary", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Poland", "Romania", "Slovakia", "Slovenia" };
    return countries[new Random().Next(0, countries.Length)];
```

Then in Copilot Chat ask if it can rewrite this code in Python.

- **Readable**

Select the content of randomeuropeancountry

In the chat ask Copilot to make your code more readable.

- **Add Unit Tests**

You probably have been creating Unit Tests for all your code so far, so if you have please remove tests for one of your implementations and select the code and ask Copilot Chat to add unit tests (note you can type /tests to shorten this ask).

- **Fix Bug**

In the exercise, there should be no bugs, since most of the code will be done by CoPilot. We can force some errors and then test the debug functionality.

Force some errors like:

```csharp
return countries[countries.Length + 1];
```

Then select the code method and ask copilot chat to fix the bugs it may find (note you can type /fix to shorten this ask).

- **Document Code**

Select some lines of code

In the chat ask Copilot to add a comment to explain each line

## Explore Copilot and Copilot Chat

Use the skills you have learned from Copilot and Copilot Chat to start some new code of your choosing and add to this code
Examples may be:

- A new website based on a new framework
- Create an application in a language you are unfamiliar with (note the codespace is only configured for node, java and dotnet)
- Create a new API
- Do some Infrastructure-as-code to create some cloud resources using Terraform, ARM or Bicep.
- Use your imagination, have some fun!
