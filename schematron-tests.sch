<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
    xmlns:fpml="http://www.fpml.org/2007/FpML-4-4"
    queryBinding="xslt2">
    <ns uri="http://www.fpml.org/2007/FpML-4-4" prefix="fpml"/>
    
    <pattern id="FX-rules">
        <title>FX rules</title>
        
        <rule id="is-FX" context="//fpml:trade" role="warning">
            
            <report test="count(//fpml:fxSingleLeg) lt 1">This is not an FX transaction type</report>
        </rule>
        <rule id="rateExists" context="//fpml:fxSingleLeg/fpml:exchangeRate/fpml:rate">
            
            <report test="count(.) lt 10">
                The exchange rate is less than 10. The bank is not making enough money!
                Look here to find the problem: <value-of select="."/>
         </report>
                
            
        </rule>
    </pattern>
    
    <pattern id="conflict-1">
        <rule role="warning" context="/">
            <report test="count(//fpml:trade) &lt; 1">No trades found!</report>
        </rule>
    </pattern>
    <pattern id="conflict-2">
        <rule role="warning" context="/">
            <report test="count(//fpml:trade[1]) &lt; 1">No trades found!</report>
        </rule>
    </pattern>
    
    <pattern id="conflict-3">
        <rule role="warning" context="/">
            <assert test="//fpml:trade">Warning 3a</assert>
           
        </rule>
        <rule role="warning" context="/">
            <assert test="//fpml:trade">Warning 3b</assert>
            
        </rule>
    </pattern>
    
    <pattern id="conflict4">
        <rule role="warning" context="/">
            <assert test="//fpml:trade">Warning 4a</assert>
            
        </rule>
        <rule role="warning" context="/">
            <assert test="//fpml:trade">Warning 4b</assert>
            
        </rule>
        <rule role="error" context="/">
            <assert test="//fpml:trade">Warning 4c</assert>
        </rule>
    </pattern>
    
    <pattern id="header-rules">
        <rule role="header-messageid" context="/fpml:FpML/fpml:header[1]">
            <assert test="fpml:messageId">Message ID doesn't exists.</assert>
            <assert test="fpml:sentBy">sentBy doesn't exists.</assert>
            <assert test="fpml:sendTo">sendTo ID doesn't exists.</assert>
            <!--<assert test="fpml:nihil">nihil ID doesn't exists.</assert>-->
        </rule>
        
    </pattern>
    
    <pattern id="alt-header-rules">
        <rule role="header-messageid" context="/fpml:FpML/fpml:header[1]">
           
            <assert test="fpml:sendTo">sendTo ID doesn't exists.</assert>
          
            
        </rule>
        
        
        
    </pattern>
    
    <pattern id="alt2-header-rules" >
        <rule role="header-messageid"  context="/fpml:FpML/fpml:header[1]">
            <assert test="fpml:nihil" role="error">The content of <name/> is wrong. Nihil is missing.</assert>
            <assert test="fpml:nihil2" role="warning">The content of <name/> is wrong. Nihil is missing. Don't worry about this.</assert>
        </rule>
    </pattern>
    
</schema>