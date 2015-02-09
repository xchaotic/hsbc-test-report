<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fpml="http://www.fpml.org/2007/FpML-4-4"
    xmlns="http://www.fpml.org/2007/FpML-4-4"
    exclude-result-prefixes="xs math xd"
    version="2.0">
    
    <xd:doc>
        <xd:desc>
            <xd:p>Author: Lech Rzedzicki</xd:p>
            <xd:p>Purpose: A stylesheet to generate a simple HTML from a simple FpML 4.4 FX trade.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="node()|@*"/>
        
    
    <xsl:template match="/"> 
    
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>A simple positions report</title>
            </head>
            <body>
                <table>
                    <caption>FX Positions report</caption>
                    
                    <thead>
                        <tr>
                            <th>Payer</th>
                            <th>Receiver</th>
                            <th>amount</th>
                            <th>rate</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- LR20141207: Because we are 'filling in' a predefined form, the pull model of XSLT processing is more appropriate. -->
                        <xsl:for-each select="//fpml:trade">
                            <tr>
                                <td><xsl:value-of select=".//fpml:exchangedCurrency1/fpml:payerPartyReference/@href"/></td>
                                <td><xsl:value-of select=".//fpml:exchangedCurrency1/fpml:receiverPartyReference/@href"/></td>
                                <td><xsl:value-of select=".//fpml:exchangedCurrency1/fpml:paymentAmount/fpml:amount"/>
                                    <xsl:text> </xsl:text><xsl:value-of select=".//fpml:exchangedCurrency1/fpml:paymentAmount/fpml:currency"/></td>
                                <td><xsl:value-of select=".//fpml:rate"/></td>
                            </tr>
                        </xsl:for-each>
                        
                        
                    </tbody>
                </table>
            </body>
        </html>
    
    </xsl:template>
    
    
</xsl:stylesheet>