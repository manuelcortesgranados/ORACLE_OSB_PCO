xquery version "1.0" encoding "Cp1252";
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/RulesEngineDummies/Core/Resources/XQueries/CustomizationFileGenerator/";

declare function xf:CustomizationFileGenerator()
as element(*) {
	let $businessServices:= ('ITEL/Trama414/Business Services/calcularProvisionTrama414_BS')
	let $endPoints := ( 'ITEL/Trama414Provision/DS_CalcularProvision'
	                    )
	let $host := 'SOAG'
	let $port := '8003'
	let $numServers := 24                   
	return 
    <cus:Customizations xmlns:cus="http://www.bea.com/wli/config/customizations" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xt="http://www.bea.com/wli/config/xmltypes">
      <cus:customization xsi:type="cus:EnvValueCustomizationType">
         { for $bs at $index in $businessServices 
           return
              (
	              for $numServer in 1 to $numServers
	              let $uri := concat('t3://',$host,$numServer, ':', $port , '/')
	              return
		              <cus:envValueAssignments>
		               	 <xt:envValueType>Service URI</xt:envValueType>
		               	 <xt:location>{($numServer)-1}</xt:location>
				       	 <xt:owner>
				       	 	<xt:type>BusinessService</xt:type>
				       	 	<xt:path>{$bs}</xt:path>
				       	 </xt:owner>
				       	 <xt:value xsi:type="xs:string" xmlns:xs="http://www.w3.org/2001/XMLSchema">{concat($uri, $endPoints[$index])}</xt:value>
		    		   </cus:envValueAssignments>
		    	   ,
		    		<cus:envValueAssignments>
			      		<xt:envValueType>Service URI Table</xt:envValueType>
		   		   		<xt:location xsi:nil="true"/>
		      			<xt:owner>
		        			<xt:type>BusinessService</xt:type>
		        			<xt:path>{$bs}</xt:path>
		      			</xt:owner>
		      			<xt:value>
		      			  {
		      			    for $numServer in 1 to $numServers
				            let $uri := concat('t3://',$host,$numServer, ':', $port , '/')
				            return
					        <tran:tableElement xmlns:tran="http://www.bea.com/wli/sb/transports">
					          <tran:URI>{concat($uri, $endPoints[$index])}</tran:URI>
					          <tran:weight>{if($numServer=1) then 1 else 0}</tran:weight>
					        </tran:tableElement>
					        
					      }
				         </xt:value>
				         
				    </cus:envValueAssignments>
			   )
			     
         }
         
         
      </cus:customization>
      
   </cus:Customizations>
};


xf:CustomizationFileGenerator()