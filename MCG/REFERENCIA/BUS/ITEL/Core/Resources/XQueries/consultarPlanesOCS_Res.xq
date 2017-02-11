(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_PLANESOCS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPLANESOCS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_PLANESOCS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarPlanesOCS";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPlanesOCS_Res/";

declare function xf:consultarPlanesOCS_Res($outputParameters1 as element(ns1:OutputParameters), $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                {
                    let $rowset := $outputParameters1/*:P_PLANESOCS/*:P_PLANESOCS_Row/*:P_TMSCLASS
                    return
                        <PLANES>
                        <TMSCLASS>{data(distinct-values($rowset))}</TMSCLASS>
                        <LISTA>
	                    {for $P_PLANESOCS_Row in $outputParameters1/*:P_PLANESOCS/*:P_PLANESOCS_Row
	                    return
	                            <TMLIST>{ data($P_PLANESOCS_Row/ns1:P_TMLIST) }</TMLIST>
	                     }
	                     </LISTA>
                     </PLANES>   
                }
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarPlanesOCS_Res($outputParameters1, $descripcion)