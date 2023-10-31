<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var" version="1.0">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/CreateTerm" />
  </xsl:template>
  <xsl:template match="/CreateTerm">
    <Term>
      <xsl:if test="EXCHANGE/YPS/YPS.SRS/YPS_AYRC.YPS.SRS">
        <AcademicYearCode>
          <xsl:value-of select="EXCHANGE/YPS/YPS.SRS/YPS_AYRC.YPS.SRS/text()" />
        </AcademicYearCode>
      </xsl:if>
      <xsl:if test="EXCHANGE/YPS/YPS.SRS/YPS_PSLC.YPS.SRS">
        <PeriodSlotCode>
          <xsl:value-of select="EXCHANGE/YPS/YPS.SRS/YPS_PSLC.YPS.SRS/text()" />
        </PeriodSlotCode>
      </xsl:if>
      <xsl:if test="EXCHANGE/YPS/YPS.SRS/YPS_BEGD.YPS.SRS">
        <StartDate>
          <xsl:value-of select="EXCHANGE/YPS/YPS.SRS/YPS_BEGD.YPS.SRS/text()" />
        </StartDate>
      </xsl:if>
      <xsl:if test="EXCHANGE/YPS/YPS.SRS/YPS_ENDD.YPS.SRS">
        <EndDate>
          <xsl:value-of select="EXCHANGE/YPS/YPS.SRS/YPS_ENDD.YPS.SRS/text()" />
        </EndDate>
      </xsl:if>
    </Term>
  </xsl:template>
</xsl:stylesheet>