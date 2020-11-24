<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" 
    version="2.0"><xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="no"/>
    <xsl:param name="php"/>
    <!-- identity transform -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="head">
        <xsl:variable name="title"><xsl:value-of select="./title/text()"/></xsl:variable>
        <xsl:text>&lt;?php $pagename = 'Cameroon QWERTY (SIL)'; $pagetitle = 'Cameroon QWERTY'; require_once('header.php'); ?")\&gt;</xsl:text>
<!--        <xsl:value-of select="unparsed-text($phphead)/>-->
    </xsl:template>
    <xsl:template match="html"><xsl:apply-templates select="@*|node()"/></xsl:template>
    <xsl:template match="body"><xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy></xsl:template>
   
 
   <xsl:template match="head">
                        <xsl:text ><?php $pagename = 'Cameroon QWERTY (SIL)'; $pagetitle = 'Cameroon QWERTY'; require_once('header.php'); ?></xsl:text>
    </xsl:template>
</xsl:stylesheet>