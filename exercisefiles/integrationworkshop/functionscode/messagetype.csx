#r "Newtonsoft.Json"

using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Primitives;
using Newtonsoft.Json;


public static async Task<IActionResult> Run(HttpRequestMessage req, ILogger log)
{
    string jsonContent = await req.Content.ReadAsStringAsync();
    dynamic data = JsonConvert.DeserializeObject(jsonContent);
    string mapName = "";
    var headers = req.Headers;
    string messageType = headers.GetValues("messagetype").First();
    string operationName = headers.GetValues("operation").First();
    string topicName = "";
    string wrapperName = "";
   
    switch (operationName)
    {
        case "DeleteStudentInformation":
            switch (messageType)
            {
                case "SMO":
                    topicName = "DELETECOURSEENROLLMENT";
                    break; 

                case "MAV":
                    topicName = "DELETECOURSE";
                    break;   

                case "SCE":
                    topicName = "DELETEGROUPMEMBERSHIP";
                    break;  

                case "CRS":
                    topicName = "DELETEGROUP";
                    break;               

                default:
                    break;
            }
            break;


        case "PostStudentInformation":
            switch (messageType)
            {
                case "MAV":
                    wrapperName = "CreateCourse";
                    topicName = "CREATECOURSE";
                    mapName = "Sits.CreateCourseToCanonical.Course";
                    break;

                case "SMO":
                    wrapperName = "EnrolUserCourse";
                    topicName = "ENROLUSERCOURSE";
                    mapName = "Sits.EnrolUserCourseToCanonical.Course";
                    break;

                case "CRS":
                    wrapperName = "CreateGroup";
                    topicName = "CREATEGROUP";
                    mapName = "Sits.CreateGroupToCanonical.Group";
                    break;

                case "YPS":
                    wrapperName = "CreateTerm";
                    topicName = "CREATETERM";
                    mapName = "Sits.CreateTermToCanonical.Term";
                    break;

                case "SCE":
                    wrapperName = "CreateUser";
                    topicName = "CREATEUSER";
                    mapName = "Sits.CreateUserToCanonical.User";
                    break;

                default:
                    break;
            }
            break;

        case "PostStaffInformation":
            switch (messageType)
            {
                case "PRS":
                    wrapperName = "CreateStaff";
                    topicName = "CREATESTAFF";
                    mapName = "Sits.CreateStaffToCanonical.User";
                    break;

                default:
                    break;
            }
            break;
            
        case "PutStudentInformation":
            switch (messageType)
            {
                case "STU":
                    wrapperName = "EditUser";
                    topicName = "EDITUSER";
                    mapName = "Sits.EditUserToCanonical.User";
                    break;
                
                case "MAV":
                    wrapperName = "CreateCourse";
                    topicName = "EDITCOURSE";
                    mapName = "Sits.CreateCourseToCanonical.Course";
                    break;

                case "YPS":
                    wrapperName = "CreateTerm";
                    topicName = "EDITTERM";
                    mapName = "Sits.CreateTermToCanonical.Term";
                    break;
                
                case "CRS":
                    wrapperName = "CreateGroup";
                    topicName = "CREATEGROUP";
                    mapName = "Sits.CreateGroupToCanonical.Group";
                    break;

                case "SCE":
                    wrapperName = "CreateUser";
                    topicName = "EDITCOURSEENROLLMENT";
                    mapName = "Sits.CreateUserToCanonical.User";	
                    break;

                default:
                    break;
            }
            break;

        default:
        wrapperName = "CreateUser23";
        topicName = "EDITCOURSEENROLLMENT23";
        mapName = "Sits.CreateUserToCanonical.User23";	
            break;
    }
    
     
    var result = new OkObjectResult(new { wrapper = $"{wrapperName}",
        topic = $"{topicName}",
        map = $"{mapName}"});
    return result;
}