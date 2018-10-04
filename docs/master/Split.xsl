<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"><xsl:output method="html" version="4.0"
        encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>
    <!-- identity transform -->
    <xsl:template match="object">
        <xsl:variable name="filename"><xsl:value-of select="@data"/></xsl:variable>
        <xsl:variable name="importfile" select="document($filename)/body"/>
        <xsl:value-of select="$importfile"/>
    </xsl:template>
    <xsl:template match="@*|node()"><xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy></xsl:template>
    <xsl:template match="*[contains(@xml:lang, 'fr')]"/>
    <xsl:template match="*[contains(@class, 'az')]"/>
</xsl:stylesheet>