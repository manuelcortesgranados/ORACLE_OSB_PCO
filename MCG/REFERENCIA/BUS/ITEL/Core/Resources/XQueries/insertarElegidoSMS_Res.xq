(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_INSERTAR_ELEGIDOSMS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_INSERTAR_ELEGIDOSMS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_ELEGIDO_SMS/";
declare namespace ns0 = "http://www.comcel.com.co/InsertarElegidoSMS";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarElegidoSMS_Res/";

declare function xf:insertarElegidoSMS_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>
                <EXITO>{ data($outputParameters1/ns1:P_EXITO) }</EXITO>
            </MENSAJE>
            <DESCRIPCION />
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:insertarElegidoSMS_Res($outputParameters1)