<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:import href="https://az818438.vo.msecnd.net/functoids/functoidsscript.xslt" />
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/CreateCourse" />
  </xsl:template>
  <xsl:template match="/CreateCourse">
    <Course>
      <Modules>
        <xsl:for-each select="EXCHANGE">
          <xsl:for-each select="MAV">
            <xsl:for-each select="MAV.CAMS">
              <xsl:variable name="var:v1" select="userCSharp:StringSubstring(string(AYR_CODE.MAV.CAMS/text()) , &quot;3&quot; , &quot;4&quot;)" />
              <xsl:variable name="var:v2" select="userCSharp:StringConcat(string(PSL_CODE.MAV.CAMS/text()) , &quot;_&quot; , string($var:v1))" />
              <xsl:variable name="var:v3" select="string(AYR_CODE.MAV.CAMS/text())" />
              <xsl:variable name="var:v4" select="userCSharp:StringSubstring($var:v3 , &quot;3&quot; , &quot;4&quot;)" />
              <xsl:variable name="var:v5" select="string(PSL_CODE.MAV.CAMS/text())" />
              <xsl:variable name="var:v7" select="string(MAV_UDF7.MAV.CAMS/text())" />
              <xsl:variable name="var:v8" select="string(MOD_CODE.MAV.CAMS/text())" />
              <xsl:variable name="var:v9" select="string(MAV_OCCUR.MAV.CAMS/text())" />
              <Module>
                <xsl:if test="MOD_CODE.MAV.CAMS">
                  <Code>
                    <xsl:value-of select="MOD_CODE.MAV.CAMS/text()" />
                  </Code>
                </xsl:if>
                <xsl:if test="MAV_OCCUR.MAV.CAMS">
                  <Occurrence>
                    <xsl:value-of select="MAV_OCCUR.MAV.CAMS/text()" />
                  </Occurrence>
                </xsl:if>
                <xsl:if test="AYR_CODE.MAV.CAMS">
                  <AcademicYearCode>
                    <xsl:value-of select="AYR_CODE.MAV.CAMS/text()" />
                  </AcademicYearCode>
                </xsl:if>
                <xsl:if test="PSL_CODE.MAV.CAMS">
                  <PeriodSlotCode>
                    <xsl:value-of select="PSL_CODE.MAV.CAMS/text()" />
                  </PeriodSlotCode>
                </xsl:if>
                <PersonnelCode>
                  <xsl:value-of select="PRS/PRS.MENSYS/PRS_EMAD.PRS.MENSYS/text()" />
                </PersonnelCode>
                <xsl:if test="DPT_CODE.MAV.CAMS">
                  <DepartmentCode>
                    <xsl:value-of select="DPT_CODE.MAV.CAMS/text()" />
                  </DepartmentCode>
                </xsl:if>
                <xsl:if test="MAV_UDF7.MAV.CAMS">
                  <SectionCreateFlag>
                    <xsl:value-of select="MAV_UDF7.MAV.CAMS/text()" />
                  </SectionCreateFlag>
                </xsl:if>
                <xsl:if test="MAV_MAVN.MAV.CAMS">
                  <Name>
                    <xsl:value-of select="MAV_MAVN.MAV.CAMS/text()" />
                  </Name>
                </xsl:if>
                <SIS_Term_Id>
                  <xsl:value-of select="$var:v2" />
                </SIS_Term_Id>
                <xsl:variable name="var:v6" select="userCSharp:CreateSisCourseID(string(MAV_UDF7.MAV.CAMS/text()) , string(MOD_CODE.MAV.CAMS/text()) , $var:v5 , string($var:v4) , string(MAV_OCCUR.MAV.CAMS/text()))" />
                <SIS_Course_Id>
                  <xsl:value-of select="$var:v6" />
                </SIS_Course_Id>
                <xsl:variable name="var:v10" select="userCSharp:CreateSisCourseID($var:v7 , $var:v8 , $var:v5 , string($var:v4) , $var:v9)" />
                <SIS_Section_Id>
                  <xsl:value-of select="$var:v10" />
                </SIS_Section_Id>
                <ModuleDetails>
                  <xsl:for-each select="MOD">
                    <xsl:for-each select="MOD.CAMS">
                      <ModuleDetail>
                        <xsl:if test="MOD_CODE.MOD.CAMS">
                          <Code>
                            <xsl:value-of select="MOD_CODE.MOD.CAMS/text()" />
                          </Code>
                        </xsl:if>
                        <xsl:if test="DPT_CODE.MOD.CAMS">
                          <DepartmentCode>
                            <xsl:value-of select="DPT_CODE.MOD.CAMS/text()" />
                          </DepartmentCode>
                        </xsl:if>
                        <xsl:if test="MOD_FACC.MOD.CAMS">
                          <FacultyCode>
                            <xsl:value-of select="MOD_FACC.MOD.CAMS/text()" />
                          </FacultyCode>
                        </xsl:if>
                      </ModuleDetail>
                    </xsl:for-each>
                  </xsl:for-each>
                </ModuleDetails>
                <PeriodSlots>
                  <xsl:for-each select="PSL">
                    <xsl:for-each select="PSL.SRS">
                      <PeriodSlot>
                        <xsl:if test="PSL_CODE.PSL.SRS">
                          <Code>
                            <xsl:value-of select="PSL_CODE.PSL.SRS/text()" />
                          </Code>
                        </xsl:if>
                        <xsl:if test="PSL_NAME.PSL.SRS">
                          <Name>
                            <xsl:value-of select="PSL_NAME.PSL.SRS/text()" />
                          </Name>
                        </xsl:if>
                        <xsl:if test="PSL_BEGW.PSL.SRS">
                          <BeginningWeek>
                            <xsl:value-of select="PSL_BEGW.PSL.SRS/text()" />
                          </BeginningWeek>
                        </xsl:if>
                        <xsl:if test="PSL_ENDW.PSL.SRS">
                          <EndingWeek>
                            <xsl:value-of select="PSL_ENDW.PSL.SRS/text()" />
                          </EndingWeek>
                        </xsl:if>
                      </PeriodSlot>
                    </xsl:for-each>
                  </xsl:for-each>
                </PeriodSlots>
              </Module>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:for-each>
      </Modules>
    </Course>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[

public string CreateSisCourseID (string sectionCreateFlag,                                                                                       string moduleCode,
                                                     string periodSlotCode, 
                                                     string yearCode, string occurrence)
{  
   string sisCourseID = "undefined";

    if (sectionCreateFlag == "A")
    {
       sisCourseID = moduleCode + "_" + "ALL" + "_" + periodSlotCode + "_" +  yearCode;
    }
   if (sectionCreateFlag == "O")
    {
       sisCourseID = moduleCode + "_" + occurrence + "_" + periodSlotCode + "_" +   yearCode;
    }

   if (sectionCreateFlag == "A\t")
    {
       sisCourseID = moduleCode + "_" + "ALL" + "_" + periodSlotCode + "_" +  yearCode;
    }
   if (sectionCreateFlag == "O\t")
    {
       sisCourseID = moduleCode + "_" + occurrence + "_" + periodSlotCode + "_" +   yearCode;
    }
    
   return sisCourseID;
}



]]></msxsl:script>
</xsl:stylesheet>