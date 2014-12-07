<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
    xmlns:fpml="http://www.fpml.org/2007/FpML-4-4"
    queryBinding="xslt2">
    <ns uri="http://www.fpml.org/2007/FpML-4-4" prefix="fpml"/>
    
    <pattern id="FX_rules">
        <rule id="isFX" context="//fpml:trade" role="warning">
            <report test="count(//fpml:fxSingleLeg) lt 1">This is not an FX transaction type</report>
        </rule>
        <rule id="rateExists" context="//fpml:fxSingleLeg">
            
            <report test="count(fpml:exchangeRate/fpml:rate) lt 1">
                The exchange rate is missing.
            </report>
                
            
        </rule>
    </pattern>
</schema>