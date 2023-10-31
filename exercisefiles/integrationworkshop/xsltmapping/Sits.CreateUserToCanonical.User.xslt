<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var" version="1.0" xmlns:ns0="http://james.newtonking.com/projects/json">
  <xsl:import href="https://az818438.vo.msecnd.net/functoids/functoidsscript.xslt" />
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/CreateUser" />
  </xsl:template>
  <xsl:template match="/CreateUser">
    <User>
      <StudentCourseEnrolments>
        <xsl:for-each select="EXCHANGE">
          <xsl:for-each select="SCE">
            <xsl:for-each select="SCE.SRS">
              <StudentCourseEnrolment>
                <xsl:if test="SCE_SCJC.SCE.SRS">
                  <StudentCourseJoinCode>
                    <xsl:value-of select="SCE_SCJC.SCE.SRS/text()" />
                  </StudentCourseJoinCode>
                </xsl:if>
                <xsl:if test="SCE_SEQ2.SCE.SRS">
                  <SequenceNumber>
                    <xsl:value-of select="SCE_SEQ2.SCE.SRS/text()" />
                  </SequenceNumber>
                </xsl:if>
                <xsl:if test="SCE_STUC.SCE.SRS">
                  <StudentCode>
                    <xsl:value-of select="SCE_STUC.SCE.SRS/text()" />
                  </StudentCode>
                </xsl:if>
                <xsl:if test="SCE_AYRC.SCE.SRS">
                  <AcademicYearCode>
                    <xsl:value-of select="SCE_AYRC.SCE.SRS/text()" />
                  </AcademicYearCode>
                </xsl:if>
                <xsl:if test="SCE_CRSC.SCE.SRS">
                  <CourseCode>
                    <xsl:value-of select="SCE_CRSC.SCE.SRS/text()" />
                  </CourseCode>
                </xsl:if>
                <xsl:if test="SCE_BLOK.SCE.SRS">
                  <YearOfCourse>
                    <xsl:value-of select="SCE_BLOK.SCE.SRS/text()" />
                  </YearOfCourse>
                </xsl:if>
                <xsl:if test="SCE_OCCL.SCE.SRS">
                  <Occurrence>
                    <xsl:value-of select="SCE_OCCL.SCE.SRS/text()" />
                  </Occurrence>
                </xsl:if>
                <xsl:if test="SCE_STAC.SCE.SRS">
                  <CourseStatus>
                    <xsl:value-of select="SCE_STAC.SCE.SRS/text()" />
                  </CourseStatus>
                </xsl:if>
                <xsl:if test="SCE_DPTC.SCE.SRS">
                  <DepartmentCode>
                    <xsl:value-of select="SCE_DPTC.SCE.SRS/text()" />
                  </DepartmentCode>
                </xsl:if>
                <xsl:if test="SCE_FACC.SCE.SRS">
                  <FacultyCode>
                    <xsl:value-of select="SCE_FACC.SCE.SRS/text()" />
                  </FacultyCode>
                </xsl:if>
                <Users>
                  <xsl:for-each select="STU">
                    <xsl:for-each select="STU.SRS">
                      <User>
                        <xsl:if test="STU_CODE.STU.SRS">
                          <Code>
                            <xsl:value-of select="STU_CODE.STU.SRS/text()" />
                          </Code>
                        </xsl:if>
                        <xsl:if test="STU_TITL.STU.SRS">
                          <Title>
                            <xsl:value-of select="STU_TITL.STU.SRS/text()" />
                          </Title>
                        </xsl:if>
                        <xsl:if test="STU_SURN.STU.SRS">
                          <LastName>
                            <xsl:value-of select="STU_SURN.STU.SRS/text()" />
                          </LastName>
                        </xsl:if>
                        <xsl:if test="STU_FUSD.STU.SRS">
                          <ForenameUsed>
                            <xsl:value-of select="STU_FUSD.STU.SRS/text()" />
                          </ForenameUsed>
                        </xsl:if>
                        <InstitutionEmailAddress>
                          <xsl:value-of select="STU_INEM.STU.SRS/text()" />
                        </InstitutionEmailAddress>
                        <Faculties>
                          <xsl:for-each select="FAC">
                            <xsl:for-each select="FAC.SRS">
                              <Faculty>
                                <xsl:if test="FAC_CODE.FAC.SRS">
                                  <Code>
                                    <xsl:value-of select="FAC_CODE.FAC.SRS/text()" />
                                  </Code>
                                </xsl:if>
                                <xsl:if test="FAC_NAME.FAC.SRS">
                                  <Name>
                                    <xsl:value-of select="FAC_NAME.FAC.SRS/text()" />
                                  </Name>
                                </xsl:if>
                              </Faculty>
                            </xsl:for-each>
                          </xsl:for-each>
                        </Faculties>
                      </User>
                    </xsl:for-each>
                  </xsl:for-each>
                </Users>
                <Courses>
                  <xsl:for-each select="CRS">
                    <xsl:for-each select="CRS.SRS">
                      <Course>
                        <xsl:if test="CRS_CODE.CRS.SRS">
                          <Code>
                            <xsl:value-of select="CRS_CODE.CRS.SRS/text()" />
                          </Code>
                        </xsl:if>
                        <xsl:if test="CRS_NAME.CRS.SRS">
                          <Name>
                            <xsl:value-of select="CRS_NAME.CRS.SRS/text()" />
                          </Name>
                        </xsl:if>
                      </Course>
                    </xsl:for-each>
                  </xsl:for-each>
                </Courses>
                <StudentEnrolmentModuleDetails>
                  <xsl:for-each select="SMO">
                    <xsl:for-each select="SMO.CAMS">
                      <xsl:variable name="var:v1" select="&quot;true&quot;" />
                      <StudentEnrolmentModuleDetail>
                        <xsl:attribute name="ns0:Array">
                          <xsl:value-of select="$var:v1" />
                        </xsl:attribute>
                        <xsl:if test="SPR_CODE.SMO.CAMS">
                          <StudentProgrammeRouteCode>
                            <xsl:value-of select="SPR_CODE.SMO.CAMS/text()" />
                          </StudentProgrammeRouteCode>
                        </xsl:if>
                        <xsl:if test="MOD_CODE.SMO.CAMS">
                          <ModuleCode>
                            <xsl:value-of select="MOD_CODE.SMO.CAMS/text()" />
                          </ModuleCode>
                        </xsl:if>
                        <xsl:if test="MAV_OCCUR.SMO.CAMS">
                          <Occurrence>
                            <xsl:value-of select="MAV_OCCUR.SMO.CAMS/text()" />
                          </Occurrence>
                        </xsl:if>
                        <xsl:if test="AYR_CODE.SMO.CAMS">
                          <AcademicYearCode>
                            <xsl:value-of select="AYR_CODE.SMO.CAMS/text()" />
                          </AcademicYearCode>
                        </xsl:if>
                        <xsl:if test="PSL_CODE.SMO.CAMS">
                          <PeriodSlotCode>
                            <xsl:value-of select="PSL_CODE.SMO.CAMS/text()" />
                          </PeriodSlotCode>
                        </xsl:if>
                      </StudentEnrolmentModuleDetail>
                    </xsl:for-each>
                  </xsl:for-each>
                </StudentEnrolmentModuleDetails>
              </StudentCourseEnrolment>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:for-each>
      </StudentCourseEnrolments>
    </User>
  </xsl:template>
</xsl:stylesheet>