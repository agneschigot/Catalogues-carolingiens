<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="master">
        <TEI>
            <teiHeader/>
            <text>
                <body>
                    
                    <listAuteur>
                        
                        <!-- 1) Regrouper par @corresp -->
                        <xsl:for-each-group select=".//tei:author"
                            group-by="substring(@corresp, 2)">
                            
                            <xsl:sort select="current-grouping-key()"/>
                            
                            <li>
                                <!-- Valeur @corresp (sans #) -->
                                <xsl:value-of select="current-grouping-key()"/>
                                
                                <ul>
                                    
                                    <!-- 2) Sous-groupe : regrouper les textes d'auteur -->
                                    <xsl:for-each-group 
                                        select="current-group()"
                                        group-by="normalize-space(.)">
                                        
                                        <xsl:sort select="current-grouping-key()"/>
                                        
                                        <li>
                                            <!-- texte de la balise <author> -->
                                            <xsl:value-of select="current-grouping-key()"/>
                                        </li>
                                        
                                    </xsl:for-each-group>
                                    
                                </ul>
                            </li>
                            
                        </xsl:for-each-group>
                        
                    </listAuteur>
                    
                </body>
            </text>
        </TEI>
    </xsl:template>
    
</xsl:stylesheet>
