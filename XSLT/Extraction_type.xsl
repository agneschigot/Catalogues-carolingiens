<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml"/>
    
    <xsl:template match="master">
        <xsl:element name="TEI">
            <xsl:element name="teiHeader"></xsl:element>
            <xsl:element name="text">
                <xsl:element name="body">
                    <xsl:element name="listType"><!-- je crée un élément listType, qui va me servir de cadre pour ma chrono -->
                        
                        <xsl:for-each-group select=".//tei:bibl" group-by="@type">
                            <xsl:sort select="@type" order="ascending"/>
                            <xsl:element name="li">
                                <xsl:value-of select="current-grouping-key()"/>
                            </xsl:element>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>     
    </xsl:template>
</xsl:stylesheet>