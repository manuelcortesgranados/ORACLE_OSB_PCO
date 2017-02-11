(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_FAFTIPO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARFAFTIPO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarFAFTipo/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_FAFTIPO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarFAFList_Res/";

declare function xf:consultarFAFList_Res($outputParameters1 as element(ns0:OutputParameters), $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>{              	                          
				  <FAFTIPO>{  
				           for $FAFTipo_Row in $outputParameters1/*:P_FAFTIPO/*:FAFTipo_Row
	                  			return                                     
				                   <FAF_TIPO>{ concat(data($FAFTipo_Row/*:FAFID),';',data($FAFTipo_Row/*:FAF_TIPO),';',data($FAFTipo_Row/*:OFFERID)) }</FAF_TIPO>			                                       
				 }</FAFTIPO>                              
          }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarFAFList_Res($outputParameters1, $descripcion)