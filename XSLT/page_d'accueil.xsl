<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="html"/>

    <xsl:template match="master">

        <!-- création de la page d'accueil -->
        <xsl:result-document method="html" href="index.html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Catalogues</xsl:text>
                    </xsl:element>
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>../css/accueil.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="body">
                    <xsl:element name="h1">
                        <xsl:text>Catalogues carolingiens</xsl:text>
                    </xsl:element>
                    <xsl:element name="nav">
                        <xsl:element name="ul">
                            <xsl:element name="h2">Triés par Abbayes</xsl:element>
                            <xsl:for-each-group select=".//tei:settlement" group-by="./@nymRef">
                                <xsl:element name="li">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="current-grouping-key()"/>
                                            <xsl:text>.html</xsl:text>

                                        </xsl:attribute>
                                        <xsl:value-of select="current-grouping-key()"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:for-each-group>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="ul">
                        <xsl:element name="h2">Triés par Auteur</xsl:element>
                        <xsl:element name="li">
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>Auteurs.html</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Liste des auteurs</xsl:text>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="ul">
                        <xsl:element name="h2">Triés par Thèmes</xsl:element>
                        <xsl:element name="li">
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>Thèmes.html</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Liste des Thèmes</xsl:text>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="ul">
                        <xsl:element name="h2">Vocabulaire</xsl:element>
                        <xsl:element name="li">
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>Epithete_auteurs.html</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Epithète des auteurs</xsl:text>
                            </xsl:element>
                            <xsl:element name="li">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>Rubriques.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Titre des Rubriques</xsl:text>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="li">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>Codex.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Codex, volumen, liber...</xsl:text>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="li">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>Spécification.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Spécifications et gloses</xsl:text>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="ul">
                        <xsl:element name="h2">Triés par Livres</xsl:element>
                        <xsl:element name="li">
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>Livres.html</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Liste des livres</xsl:text>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:call-template name="abbayes"/>
            <xsl:call-template name="auteurs"/>
            <xsl:call-template name="thèmes"/>
            <xsl:call-template name="rubriques"/>
            <xsl:call-template name="auteur"/>
            <xsl:call-template name="gloses"/>
            <xsl:call-template name="codex"/>
            <xsl:call-template name="livres"/>
        </xsl:result-document>
    </xsl:template>

    <!-- Catalogues par abbayes, groupés par dates -->
    <xsl:template match="//tei:TEI" name="abbayes">
        <xsl:for-each-group select=".//tei:settlement" group-by="./@nymRef">
            <xsl:result-document method="html" href="{current-grouping-key()}.html">
                <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
                <xsl:element name="html">
                    <xsl:element name="head">
                        <xsl:element name="title">
                            <xsl:value-of select="current-grouping-key()"/>
                        </xsl:element>
                        <xsl:element name="meta">
                            <xsl:attribute name="charset">
                                <xsl:text>UTF-8</xsl:text>
                            </xsl:attribute>
                        </xsl:element>
                        <xsl:element name="link">
                            <xsl:attribute name="rel">
                                <xsl:text>stylesheet</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="href">
                                <xsl:text>../css/abbayes.css</xsl:text>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="body">
                    <xsl:call-template name="retour"/>
                    <xsl:element name="h1">
                        <xsl:value-of select="current-grouping-key()"/>
                    </xsl:element>
                    <xsl:element name="ul">
                        <xsl:element name="h2">
                            <xsl:attribute name="id">
                                <xsl:text>Sommaire</xsl:text>
                            </xsl:attribute> Catalogues par dates </xsl:element>
                        <xsl:for-each select="current-group()">
                            <xsl:element name="li">
                                <xsl:if test="ancestor::tei:msDesc//tei:date/@notBefore">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:text>#</xsl:text>
                                            <xsl:value-of
                                                select="substring(ancestor::tei:msDesc//tei:date/@notBefore, 2)"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                            select="substring(ancestor::tei:msDesc//tei:date/@notBefore, 2)"/>
                                        <xsl:if test="ancestor::tei:msDesc//tei:date/@notAfter">
                                            <xsl:text>-</xsl:text>
                                            <xsl:value-of select="substring(ancestor::tei:msDesc//tei:date/@notAfter, 2)"/>
                                        </xsl:if>
                                    </xsl:element>
                                </xsl:if>
                                <xsl:if test="ancestor::tei:msDesc//tei:date/@when">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:text>#</xsl:text>
                                            <xsl:value-of
                                                select="substring(ancestor::tei:msDesc//tei:date/@when, 2)"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="substring(ancestor::tei:msDesc//tei:date/@when, 2)"
                                        />
                                    </xsl:element>
                                </xsl:if>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                    <xsl:for-each select="current-group()">
                        <xsl:element name="h2">
                            <xsl:attribute name="id">
                                <xsl:choose>
                                    <xsl:when test="ancestor::tei:msDesc//tei:date/@notBefore">
                                        <xsl:value-of select="substring(ancestor::tei:msDesc//tei:date/@notBefore, 2)"/>
                                    </xsl:when>
                                    <xsl:when test="ancestor::tei:msDesc//tei:date/@when">
                                        <xsl:value-of select="substring(ancestor::tei:msDesc//tei:date/@when, 2)"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="ancestor::tei:msDesc//tei:date/@notBefore">
                                    <xsl:value-of select="substring(ancestor::tei:msDesc//tei:date/@notBefore, 2)"/>
                                    <xsl:if test="ancestor::tei:msDesc//tei:date/@notAfter">
                                        <xsl:text>-</xsl:text>
                                        <xsl:value-of select="substring(ancestor::tei:msDesc//tei:date/@notAfter, 2)"/>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="ancestor::tei:msDesc//tei:date/@when">
                                    <xsl:value-of select="substring(ancestor::tei:msDesc//tei:date/@when, 2)"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:element>
                        <xsl:for-each select="ancestor::tei:TEI//tei:body/*">
                            <xsl:choose>
                                <xsl:when test="self::tei:p">
                                    <xsl:element name="p">
                                        <xsl:apply-templates/>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:when test="self::tei:div">
                                    <xsl:element name="h3">
                                        <xsl:value-of select="tei:head"/>
                                    </xsl:element>
                                    <xsl:element name="ul">
                                        <xsl:for-each select="tei:p">
                                            <xsl:element name="li">
                                                <xsl:value-of select="@n"/>
                                                <xsl:text>. </xsl:text>
                                                <xsl:apply-templates/>
                                            </xsl:element>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:when>

                            </xsl:choose>
                        </xsl:for-each>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:text>#Sommaire</xsl:text>
                            </xsl:attribute>
                            <xsl:text>Retour au sommaire par date</xsl:text>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>

    <!-- Liste alphabétique des auteurs -->
    <xsl:template match="tei:TEI" name="auteurs">
        <xsl:result-document method="html" href="Auteurs.html">
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
                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>../css/liste_auteurs.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>

            <xsl:element name="body">
                <xsl:call-template name="retour"/>
                <xsl:element name="h1">
                    <xsl:text>Liste des auteurs</xsl:text>
                </xsl:element>
                <xsl:element name="nav">
                    <xsl:element name="ul">
                        <xsl:for-each-group select=".//tei:author"
                            group-by="substring(./@corresp, 2)">
                            <xsl:sort select="substring(./@corresp, 2)" order="ascending"/>
                            <xsl:element name="li">
                                <a href="{current-grouping-key()}.html">
                                    <xsl:value-of select="replace(current-grouping-key(), '_', ' ')"
                                    />
                                </a>
                            </xsl:element>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
        <xsl:call-template name="author"/>
    </xsl:template>

    <!-- Listes alphabétiques des thèmes -->
    <xsl:template match="tei:TEI" name="thèmes">
        <xsl:result-document method="html" href="Thèmes.html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Thèmes</xsl:text>
                    </xsl:element>
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>../css/liste_thèmes.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>

            <xsl:element name="body">
                <xsl:call-template name="retour"/>
                <xsl:element name="h1">
                    <xsl:text>Liste des Thèmes</xsl:text>
                </xsl:element>
                <xsl:element name="nav">
                    <xsl:element name="ul">
                        <xsl:for-each-group select=".//tei:bibl" group-by="./@type">
                            <xsl:sort select="./@type" order="ascending"/>
                            <xsl:element name="li">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="current-grouping-key()"/>
                                        <xsl:text>.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="current-grouping-key()"/>
                                </xsl:element>
                            </xsl:element>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
        <xsl:call-template name="thème"/>
    </xsl:template>

    <!-- Listes des textes des auteurs -->
    <xsl:template match="//tei:TEI" name="author">
        <xsl:for-each-group select=".//tei:author" group-by="substring(./@corresp, 2)">
            <xsl:result-document method="html" href="{current-grouping-key()}.html">
                <xsl:element name="html">
                    <xsl:element name="head">
                        <xsl:element name="title">
                            <xsl:value-of select="current-grouping-key()"/>
                        </xsl:element>
                        <xsl:element name="meta">
                            <xsl:attribute name="charset">
                                <xsl:text>UTF-8</xsl:text>
                            </xsl:attribute>
                        </xsl:element>
                        <xsl:element name="link">
                            <xsl:attribute name="rel">
                                <xsl:text>stylesheet</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="href">
                                <xsl:text>../css/liste_auteurs.css</xsl:text>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="body">
                        <xsl:call-template name="retour"/>
                        <xsl:element name="h1">
                            <xsl:text>Liste des livres par abbayes</xsl:text>
                        </xsl:element>
                        <xsl:for-each-group select="current-group()"
                            group-by="ancestor::tei:TEI//tei:msDesc//tei:settlement/@nymRef">
                            <xsl:element name="h3">
                                <xsl:value-of select="current-grouping-key()"/>
                            </xsl:element>
                            <xsl:element name="ul">
                                <xsl:for-each select="current-group()">
                                    <xsl:element name="li">
                                        <xsl:for-each select="ancestor::tei:bibl[@corresp]">
                                            <xsl:apply-templates/>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:element>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>
     
     <!-- Liste des textes par thèmes -->
    <xsl:template match="//tei:TEI" name="thème">
        <xsl:for-each-group select=".//tei:bibl" group-by="./@type">
            <xsl:result-document method="html" href="{current-grouping-key()}.html">
                <xsl:element name="html">
                    <xsl:element name="head">
                        <xsl:element name="title">
                            <xsl:value-of select="current-grouping-key()"/>
                        </xsl:element>
                        <xsl:element name="meta">
                            <xsl:attribute name="charset">
                                <xsl:text>UTF-8</xsl:text>
                            </xsl:attribute>
                        </xsl:element>
                        <xsl:element name="link">
                            <xsl:attribute name="rel">
                                <xsl:text>stylesheet</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="href">
                                <xsl:text>../css/liste_auteurs.css</xsl:text>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="body">
                        <xsl:call-template name="retour"/>
                        <xsl:element name="nav">
                            <xsl:element name="h1">
                                <xsl:text>Liste des oeuvres par abbayes</xsl:text>
                            </xsl:element>
                            <xsl:for-each-group select="current-group()" group-by="ancestor::tei:TEI//tei:msDesc//tei:settlement/@nymRef">
                                <xsl:element name="h3">
                                    <xsl:value-of select="current-grouping-key()"/>
                                </xsl:element>
                            <xsl:element name="ul">
                                <xsl:for-each select="current-group()">
                                    <xsl:element name="li">
                                        <xsl:apply-templates/>
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:element>
                            </xsl:for-each-group>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>
     
     <!-- Liste des titres des rubriques par abbayes -->
    <xsl:template match="tei:TEI" name="rubriques">
        <xsl:result-document method="html" href="Rubriques.html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Rubriques</xsl:text>
                    </xsl:element>
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>../css/rubriques.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="body">
                <xsl:call-template name="retour"/>
                <xsl:element name="nav">
                    <xsl:element name="h1">
                        <xsl:text>Titres des rubriques par abbayes</xsl:text>
                    </xsl:element>
                    <xsl:element name="ul">
                        <xsl:for-each select="tei:TEI">
                            <xsl:if test=".//tei:head">
                                <xsl:element name="ul">
                                    <xsl:element name="h3">
                                        <xsl:value-of select=".//tei:settlement/@nymRef"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:for-each select=".//tei:head">
                                    <xsl:element name="li">
                                        <xsl:apply-templates/>
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>

    <!-- Liste des épithètes des auteurs -->
    <xsl:template match="tei:TEI" name="auteur">
        <xsl:result-document method="html" href="Epithete_auteurs.html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Epithète des auteur</xsl:text>
                    </xsl:element>
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>../css/liste_auteurs.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="body">
                <xsl:call-template name="retour"/>
                <xsl:element name="nav">
                    <xsl:element name="h1">
                        <xsl:text>Epithète des auteurs</xsl:text>
                    </xsl:element>
                    <xsl:for-each-group select=".//tei:author"
                            group-by="substring(./@corresp, 2)">
                            <xsl:sort select="current-grouping-key()" order="ascending"/>
                            <xsl:element name="h3">
                                <xsl:value-of select="replace(current-grouping-key(), '_', ' ')"/>
                            </xsl:element>
                            <xsl:element name="ul">
                            <xsl:for-each-group select="current-group()"
                                group-by="normalize-space(.)">
                                <xsl:element name="li">
                                    <xsl:value-of select="current-grouping-key()"/>
                                </xsl:element>
                            </xsl:for-each-group>
                            </xsl:element>
                        </xsl:for-each-group>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>


     <!-- proportion des termes dans les catalogues -->
    <xsl:template match="tei:TEI" name="codex">
        <xsl:result-document method="html" href="Codex.html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Codex, volumen, liber</xsl:text>
                    </xsl:element>
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>../css/liste_auteurs.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>

            <xsl:element name="body">
                <xsl:element name="nav">
                    <xsl:call-template name="retour"/>
                    <xsl:element name="h1">
                        <xsl:text>Proportion des termes codex, liber et volumen</xsl:text>
                    </xsl:element>
                    <xsl:element name="ul">
                        <xsl:for-each-group select=".//tei:term" group-by="./@type">
                            <xsl:sort select="current-grouping-key()" order="ascending"/>
                            <xsl:element name="li">
                                <xsl:value-of select="current-grouping-key()"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of select="count(current-group())"/>
                            </xsl:element>
                        </xsl:for-each-group>
                        <img class="graphique" src="../image/Proportion_des_termes.jpg"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>

    <!-- liste des gloses par abbayes -->
    <xsl:template match="tei:TEI" name="gloses">
        <xsl:result-document method="html" href="Spécification.html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Gloses</xsl:text>
                    </xsl:element>
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>../css/rubriques.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="body">
                <xsl:call-template name="retour"/>
                <xsl:element name="nav">
                    <xsl:element name="ul">
                        <xsl:for-each select="tei:TEI">
                            <xsl:if test=".//tei:gloss">
                                <xsl:element name="ul">
                                    <xsl:element name="h3">
                                        <xsl:value-of select=".//tei:settlement/@nymRef"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:for-each select=".//tei:gloss">
                                    <xsl:element name="li">
                                        <xsl:for-each select="ancestor::tei:p">
                                            <xsl:apply-templates/>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>

     <!-- Tableau des livres, avec une colonne identifiant, une colonne titres des livres et une colonne lieux -->
    <xsl:template match="tei:TEI" name="livres">
        <xsl:result-document method="html" href="Livres.html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt;</xsl:text>
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="title">
                        <xsl:text>Livres</xsl:text>
                    </xsl:element>
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>../css/liste_auteurs.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>

            <xsl:element name="body">
                <xsl:call-template name="retour"/>
                <xsl:element name="nav">
                    <xsl:element name="ul">
                        <xsl:element name="table">
                            <xsl:element name="thead">
                                <xsl:element name="tr">
                                    <xsl:element name="th">
                                        <xsl:text>Identifiant</xsl:text>
                                    </xsl:element>
                                    <xsl:element name="th">
                                        <xsl:text>Titres dans le catalogue</xsl:text>
                                    </xsl:element>
                                    <xsl:element name="th">
                                        <xsl:text>Lieux</xsl:text>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>

                            <xsl:element name="tbody">
                                <xsl:for-each-group select=".//tei:bibl[@corresp]"
                                    group-by="substring(@corresp, 2)">
                                    <xsl:sort select="current-grouping-key()" order="ascending"/>
                                    <xsl:element name="tr">
                                        <!-- premier élément du tableau, les identifiants -->
                                        <xsl:element name="td">
                                            <xsl:value-of select="current-grouping-key()"/>
                                        </xsl:element>
                                        <!-- deuxième éléments du tableau, les livres -->
                                        <xsl:element name="td">
                                            <xsl:element name="ul">
                                                <xsl:for-each-group select="current-group()"
                                                  group-by="normalize-space(.)">
                                                  <xsl:element name="li">
                                                      <xsl:apply-templates/>
                                                  </xsl:element>
                                                </xsl:for-each-group>
                                            </xsl:element>
                                        </xsl:element>
                                        <!-- troisième élément du tableau, les lieux -->
                                        <xsl:element name="td">
                                            <xsl:element name="ul">
                                                <xsl:for-each-group select="current-group()"
                                                    group-by="normalize-space(.)">
                                                    <xsl:element name="li">
                                                        <xsl:value-of select="ancestor::tei:TEI//tei:msDesc/tei:msIdentifier/tei:settlement/@nymRef"/>
                                                    </xsl:element>
                                                </xsl:for-each-group>
                                            </xsl:element>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:for-each-group>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>


    <!-- template pour mettre les auteurs en gras -->
    <xsl:template match="tei:TEI//tei:author">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>AUTEURS</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- template pour mettre les gloses en italiques -->
    <xsl:template match="tei:TEI//tei:gloss">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>GLOSES</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- template pour le retour à l'accueil -->
    <xsl:template name="retour">
        <xsl:element name="p">
            <a class="accueil" href="index.html">← Retour à l'accueil</a>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
