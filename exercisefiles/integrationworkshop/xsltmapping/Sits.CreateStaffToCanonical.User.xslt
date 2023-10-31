<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var" version="1.0" xmlns:ns0="http://james.newtonking.com/projects/json">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/CreateStaff" />
  </xsl:template>
  <xsl:template match="/CreateStaff">
    <User>
      <StudentCourseEnrolments>
        <StudentCourseEnrolment>
          <Users>
            <xsl:for-each select="EXCHANGE">
              <xsl:for-each select="PRS">
                <xsl:for-each select="PRS.MENSYS">
                  <User>
                    <xsl:if test="PRS_CODE.PRS.MENSYS">
                      <Code>
                        <xsl:value-of select="PRS_CODE.PRS.MENSYS/text()" />
                      </Code>
                    </xsl:if>
                    <xsl:if test="PRS_TTLC.PRS.MENSYS">
                      <Title>
                        <xsl:value-of select="PRS_TTLC.PRS.MENSYS/text()" />
                      </Title>
                    </xsl:if>
                    <xsl:if test="PRS_SURN.PRS.MENSYS">
                      <LastName>
                        <xsl:value-of select="PRS_SURN.PRS.MENSYS/text()" />
                      </LastName>
                    </xsl:if>
                    <xsl:if test="PRS_FUSD.PRS.MENSYS">
                      <ForenameUsed>
                        <xsl:value-of select="PRS_FUSD.PRS.MENSYS/text()" />
                      </ForenameUsed>
                    </xsl:if>
                    <xsl:if test="PRS_EMAD.PRS.MENSYS">
                      <InstitutionEmailAddress>
                        <xsl:value-of select="PRS_EMAD.PRS.MENSYS/text()" />
                      </InstitutionEmailAddress>
                    </xsl:if>
                    <xsl:if test="PRS_IUSE.PRS.MENSYS">
                      <InUseFlag>
                        <xsl:value-of select="PRS_IUSE.PRS.MENSYS/text()" />
                      </InUseFlag>
                    </xsl:if>
                  </User>
                </xsl:for-each>
              </xsl:for-each>
            </xsl:for-each>
          </Users>
        </StudentCourseEnrolment>
      </StudentCourseEnrolments>
    </User>
  </xsl:template>
</xsl:stylesheet>