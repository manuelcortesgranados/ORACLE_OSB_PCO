xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$informe" element="informe" location="../Schemas/informe.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../Schemas/PS_GET_EXTERNALDEMOGRAPHICINFORMATION.xsd" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Computec/Resources/XQueries/getExternalDemographicInformation_Res/";
declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/getExternalDemographicInformation";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";

declare function xf:getExternalDemographicInformation_Res($informe as element(informe))
    as element(ns4:WS_Result) {
        <ns4:WS_Result>
            <code>1</code>
        	<message>
        	  <customer>
        	  {
        	    for $nombres in $informe/naturalNacional/@nombres
        	    return
        	    
        	  	  <firstName>{data($nombres)}</firstName>
        	  }
        	  {
        	    for $nombre in $informe/naturalExtranjera/@nombre 
        	    return
        	    <firstName>{data($nombre)}</firstName>
        	  }
        	  
        	  {
        	    for $nombre in $informe/juridicaNacional/@nombre
        	    return
        	    
        	  	  <firstName>{data($nombre)}</firstName>
        	  }
        	  {
        	    for $nombre in $informe/juridicaExtranjera/@nombre
        	    return
        	    
        	  	  <firstName>{data($nombre)}</firstName>
        	  }
        	  {
        	    for $primerApellido in $informe/naturalNacional/@primerApellido
        	    return
        	    
        	  	  <lastName>{data($primerApellido)}</lastName>
        	  }
        	  {
        	    for $segundoApellido in $informe/naturalNacional/@segundoApellido
        	    return
        	      <secondLastName>{data($segundoApellido)}</secondLastName>	
        	  }
        	  
        	  {
        	    for $minAge in $informe/naturalNacional/edad/@min
        	    return
        	      <rangeAge>{xf:getAgeRange(data($minAge))}</rangeAge>	
        	  }
        	  
        	  (: 
        	    for $fechaExpedicion in $informe/naturalNacional/identificacion/@fechaExpedicion
        	    return
        	    <document>
        	    	<documentStatus>{data($fechaExpedicion)}</documentStatus>
        	    </document>
        	          	    :)
        	  </customer>
        	</message>
        	<description>Operacion Ejecutada</description>
        </ns4:WS_Result>
};


declare function xf:getAgeRange($minAge as xs:string)
    as xs:string {
    	let $range :=
		    if($minAge = '18') then
		    	'1'
		    else if($minAge = '22') then
		    	'2'
		    else if($minAge = '29') then
		    	'3'
		    else if($minAge = '36') then
		    	'4'
		    else if($minAge = '46') then
		    	'5'
		    else if($minAge = '56') then
		    	'6'				
		    else '7'
		return $range    
	    	
};

declare variable $informe as element(informe) external;

xf:getExternalDemographicInformation_Res($informe)
