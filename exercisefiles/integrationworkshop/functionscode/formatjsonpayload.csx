#r "Newtonsoft.Json"

using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Primitives;
using Newtonsoft.Json;
using System.Xml;
using System.Net.Http.Headers;

public static async Task<IActionResult> Run(HttpRequest req, ILogger log)
{
    log.LogInformation("C# HTTP trigger function processed a request.");
    string requestContent = await new StreamReader(req.Body).ReadToEndAsync();             
    var xmlNode = JsonConvert.DeserializeXmlNode(requestContent);
    var doc = new XmlDocument();
    doc.LoadXml(xmlNode.OuterXml);    
    return new OkObjectResult(doc.DocumentElement);
}