<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="nl.amis/workflow"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/RetrieveIssuesFromDB"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns xp20 oraxsl mhdr oraext dvm xref socket">
    <oracle-xsl-mapper:schema>
        <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
        <oracle-xsl-mapper:mapSources>
            <oracle-xsl-mapper:source type="XSD">
                <oracle-xsl-mapper:schema location="../Schemas/RetrieveIssuesFromDB_table.xsd"/>
                <oracle-xsl-mapper:rootElement name="OowIssuesCollection"
                                               namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/RetrieveIssuesFromDB"/>
            </oracle-xsl-mapper:source>
        </oracle-xsl-mapper:mapSources>
        <oracle-xsl-mapper:mapTargets>
            <oracle-xsl-mapper:target type="XSD">
                <oracle-xsl-mapper:schema location="../Schemas/Issues.xsd"/>
                <oracle-xsl-mapper:rootElement name="IssueList" namespace="nl.amis/workflow"/>
            </oracle-xsl-mapper:target>
        </oracle-xsl-mapper:mapTargets>
        <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SUN SEP 28 05:58:39 PDT 2014].-->
    </oracle-xsl-mapper:schema>
    <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
    <xsl:template match="/">
        <tns:IssueList>
            <xsl:for-each select="/ns0:OowIssuesCollection/ns0:OowIssues">
                <xsl:if test=".">
                    <tns:Issue>
                        <tns:Identifier>
                            <xsl:value-of select="ns0:identifier"/>
                        </tns:Identifier>
                        <xsl:if test="ns0:title">
                            <tns:Title>
                                <xsl:value-of select="ns0:title"/>
                            </tns:Title>
                        </xsl:if>
                        <xsl:if test="ns0:description">
                            <tns:Description>
                                <xsl:value-of select="ns0:description"/>
                            </tns:Description>
                        </xsl:if>
                        <tns:Reporter>
                            <xsl:value-of select="ns0:identifiedBy"/>
                        </tns:Reporter>
                        <xsl:if test="ns0:status">
                            <tns:Status>
                                <xsl:value-of select="ns0:status"/>
                            </tns:Status>
                        </xsl:if>
                        <tns:DateOfOriginalReport>
                            <xsl:value-of select="ns0:creationDate"/>
                        </tns:DateOfOriginalReport>
                        <xsl:if test="ns0:comments">
                            <tns:Comments>
                                <xsl:value-of select="ns0:comments"/>
                            </tns:Comments>
                        </xsl:if>
                        <tns:DateOfLatestUpdate>
                            <xsl:value-of select="ns0:lastUpdate"/>
                        </tns:DateOfLatestUpdate>
                    </tns:Issue>
                </xsl:if>
            </xsl:for-each>
        </tns:IssueList>
    </xsl:template>
</xsl:stylesheet>
