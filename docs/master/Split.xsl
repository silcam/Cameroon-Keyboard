<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"><xsl:output method="html" version="4.0"
        encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>
    <!-- identity transform -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template mode="en" match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates mode="en" select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template mode="fr" match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates mode="fr" select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <!--<xsl:template match="link[@rel='stylesheet']">
        <xsl:variable name="filename"><xsl:value-of select="@href"/></xsl:variable>
        <xsl:variable name="importfile" select="document($filename)"/>
        <xsl:element name="style"><xsl:copy-of select="$importfile"/></xsl:element>
    </xsl:template>-->
    <xsl:template match="body">
        <!-- <div id="menu">
            <a class="buttonlang" href="#en">English</a> <a class="buttonlang" href="#fr">Français</a>
        </div> -->
        <xsl:copy>
            <div class="tab-folder" width="100%">
                <xsl:comment>Starting French</xsl:comment>
                <div id="fr" class="tab-content">
                    <a class="buttonlang" href="#en">View this page in English</a>
                    <xsl:apply-templates mode="fr" select="node()"/>
                </div>
                <xsl:comment>Ending French</xsl:comment>
                <xsl:comment>Starting English</xsl:comment>
                <div id="en" class="tab-content">
                    <a class="buttonlang" href="#fr"> Voir cette page en Français</a>
                    <xsl:apply-templates mode="en" select="node()"/>
                </div>
                <xsl:comment>Ending English</xsl:comment>
            </div>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="object">
        <xsl:variable name="filename"><xsl:value-of select="@data"/></xsl:variable>
        <xsl:variable name="importfile" select="document($filename)/html/body/child::*"/>
        <xsl:copy-of select="$importfile"/>
    </xsl:template>
    <xsl:template mode="fr" match="object">
        <xsl:variable name="filename"><xsl:value-of select="@data"/></xsl:variable>
        <xsl:variable name="importfile" select="document($filename)/html/body/child::*"/>
        <xsl:copy-of select="$importfile"/>
    </xsl:template>
    <xsl:template mode="en" match="object">
        <xsl:variable name="filename"><xsl:value-of select="@data"/></xsl:variable>
        <xsl:variable name="importfile" select="document($filename)/html/body/child::*"/>
        <xsl:copy-of select="$importfile"/>
    </xsl:template>
    <xsl:template mode="en" match="*[contains(@xml:lang, 'fr')]"/>
    <xsl:template mode="fr" match="*[contains(@xml:lang, 'en')]"/>
    <xsl:template mode="en"  match="*[contains(@class, 'az')]"/>
    <xsl:template mode="fr" match="*[contains(@class, 'az')]"/>
</xsl:stylesheet>