<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" 
    version="2.0"><xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>
    <xsl:strip-space elements="*"/>
<!--    <xsl:param name="filterkb"/>-->
    <xsl:param name="filterkb"/>
    <!-- identity transform -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- This file can be huge, so crushing extra spaces and removing indent can 
        cut the file by 75%. -->   
    <xsl:template mode="fr" match="@*">
        <xsl:copy/>        
    </xsl:template>
    <xsl:template mode="en" match="@*">
        <xsl:copy/>
    </xsl:template>
    <xsl:template match="text()" >
        <xsl:value-of select="replace(., '  +', ' ')"/>
    </xsl:template>
    <xsl:template mode="en" match="text()" >
        <xsl:value-of select="replace(., '  +', ' ')"/>
    </xsl:template>
    <xsl:template mode="fr" match="text()" >
        <xsl:value-of select="replace(., '  +', ' ')"/>
    </xsl:template>
    
    
    
    <!--    xmlns:saxon="http://saxon.sf.net/"
        
    <xsl:template match="link[@rel='stylesheet']">
        <xsl:variable name="filename"><xsl:value-of select="@href"/></xsl:variable>
        <xsl:element name="style"><xsl:text>&#xa;</xsl:text>  
            <xsl:value-of select="unparsed-text($filename,'UTF-8')" disable-output-escaping="yes"/>
        </xsl:element>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
      
    <xsl:template mode="en fr" match="img/@src">
        <xsl:variable name="filename"><xsl:value-of select="self::node()"/></xsl:variable>
        <xsl:variable name="uri2"><xsl:value-of select="concat('file:///',translate($filename,'\','/'))"/></xsl:variable>
        <xsl:variable name="uri"><xsl:value-of select="resolve-uri($filename)"/></xsl:variable>
        <xsl:attribute name="src"><xsl:text>data:image/png;base64,</xsl:text><xsl:value-of select="saxon:read-binary-resource($uri)"/></xsl:attribute>      
    </xsl:template>-->
    <xsl:template match="body">
        <xsl:copy>
            <div class="tab-folder">
                <xsl:comment>Starting French</xsl:comment>
                <div id="fr" class="tab-content">
                    <a class="buttonlang" href="#en">View this page in English...</a>
                    <xsl:apply-templates mode="fr" select="node()"/>
                </div>
                <xsl:comment>Ending French</xsl:comment>
                <xsl:comment>Starting English</xsl:comment>
                <div id="en" class="tab-content">
                    <a class="buttonlang" href="#fr"> Voir cette page en français...</a>
                    <xsl:apply-templates mode="en" select="node()"/>
                </div>
                <xsl:comment>Ending English</xsl:comment>
            </div>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="p|tr|ol|ul|li">
        <xsl:text>&#xa;</xsl:text>
        <xsl:copy>            
            <xsl:apply-templates select="@*|node()|text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template mode="fr" match="p|tr|ol|ul|li">
        <xsl:if test=".[not(contains(@xml:lang, 'en'))]|.[not(@xml:lang)]">
            <xsl:if test="not(contains(@class,$filterkb))">
                 <xsl:text>&#xa;</xsl:text>
                 <xsl:copy>            
                     <xsl:apply-templates mode="fr" select="@*|node()|text()"/>
                 </xsl:copy>
             </xsl:if>
        </xsl:if>
    </xsl:template>
    <xsl:template mode="en" match="p|tr|ol|ul|li">
        <xsl:if test=".[not(contains(@xml:lang, 'fr'))]|.[not(@xml:lang)]">
            <xsl:if test="not(contains(@class,$filterkb))">
                <xsl:text>&#xa;</xsl:text>
                <xsl:copy>            
                    <xsl:apply-templates mode="en" select="@*|node()|text()"/>
                </xsl:copy>
            </xsl:if>
        </xsl:if>
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
    <xsl:template mode="en" match="node()">
        <xsl:if test=".[not(contains(@xml:lang, 'fr'))]|.[not(@xml:lang)]">
            <xsl:if test="not(contains(@class,$filterkb))">
                <xsl:choose>
                    <xsl:when test="self::text()">
                        <xsl:value-of select="replace(., '  +|&#xa;|&#xd;', ' ')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>            
                            <xsl:apply-templates mode="en" select="@*|node()|text()"/>
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>

        </xsl:if>
    </xsl:template>
    <xsl:template mode="fr" match="node()">
        <xsl:if test=".[not(contains(@xml:lang, 'en'))]|.[not(@xml:lang)]">
            <xsl:if test="not(contains(@class,$filterkb))">
                <xsl:choose>
                    <xsl:when test="self::text()">
                        <xsl:value-of select="replace(., '  +|&#xa;|&#xd;', ' ')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>            
                            <xsl:apply-templates mode="fr" select="@*|node()|text()"/>
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>