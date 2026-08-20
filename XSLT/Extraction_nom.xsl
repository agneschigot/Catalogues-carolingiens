<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
   
    <xsl:template match="master">
        
        <xsl:result-document method="html" href="Nom.html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Auteurs</xsl:text>
                    </xsl:element>
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            
            <xsl:element name="body">
                <xsl:element name="nav">
                    <xsl:element name="ul">
                        <xsl:for-each-group select=".//tei:author" group-by="substring(./@corresp, 2)">
                            <xsl:sort select="substring(./@corresp, 2)" order="ascending"/>
                            <xsl:element name="li">
                                <a href="{current-grouping-key()}.html">
                                    <xsl:value-of select="replace(current-grouping-key(),'_',' ')"/>
                                </a>
                                
                            </xsl:element>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            
        </xsl:result-document>  
        <xsl:call-template name="author"></xsl:call-template>
    </xsl:template>
    <xsl:template match="//tei:TEI" name="author">
        <xsl:for-each-group select=".//tei:author" group-by="substring(./@corresp, 2)">
            <xsl:result-document method="html" href="{current-grouping-key()}.html">
                <xsl:element name="html">
                    <xsl:element name="head">
                        <xsl:element name="title">
                            <xsl:value-of select="current-grouping-key()"></xsl:value-of>
                        </xsl:element>
                        <xsl:element name="meta">
                            <xsl:attribute name="charcet">
                                <xsl:text>UTF-8</xsl:text>
                            </xsl:attribute>
                        </xsl:element>
                     </xsl:element>
                    <xsl:element name="body">
                        <xsl:element name="ul">
                            <xsl:for-each select="current-group()">
                                <xsl:element name="li"><xsl:value-of select="ancestor::tei:bibl"/></xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                
                
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>