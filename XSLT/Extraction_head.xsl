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
                    <xsl:element name="listTitre"><!-- je crée un élément listPerson, qui va me servir de cadre pour ma chrono -->
                        <xsl:for-each select=".//tei:head">
                            <xsl:element name="p">
                                <xsl:value-of select="."/>
                            </xsl:element>
                        </xsl:for-each>
                        <!--<xsl:element name="author">
                                <xsl:value-of select="substring(./@corresp, 2)"/>
                            </xsl:element>-->
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>     
    </xsl:template>
</xsl:stylesheet>