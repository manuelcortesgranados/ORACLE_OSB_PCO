(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_LIBERARMSISDN_ECMS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/LiberarMsisdn_ECMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/liberarMsisdnECMS_Res/";

declare function xf:liberarMsisdnECMS_Res($string1 as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>{ $string1 }</MENSAJE>
            <DESCRIPCION>Operacion ejecutada correctamente</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $string1 as xs:string external;

xf:liberarMsisdnECMS_Res($string1)