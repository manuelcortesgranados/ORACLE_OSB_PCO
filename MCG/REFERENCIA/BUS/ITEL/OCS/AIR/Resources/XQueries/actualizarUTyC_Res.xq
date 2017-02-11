(:: pragma bea:schema-type-parameter parameter="$methodResponse1" type="ns1:methodResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZAR_UTyC.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ActualizarUTyCOCS/";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/actualizarUTyC_Res/";

declare function xf:actualizarUTyC_Res($codigo as xs:string,
    $descripcion as xs:string,
    $methodResponse1 as element())
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ACTUALIZAR_UTyC>                    
                    <originTransactionID> { data($methodResponse1/params/param/value/struct/member[name = "originTransactionID"]/value/string) }	</originTransactionID>	
                    <responseCode>{ data($methodResponse1/params/param/value/struct/member[name = "responseCode"]/value) }	</responseCode>                     
                </ACTUALIZAR_UTyC>
            </MENSAJE> 
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $methodResponse1 as element() external;

xf:actualizarUTyC_Res($codigo,
    $descripcion,
    $methodResponse1)
