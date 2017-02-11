(:: pragma  parameter="$anyType1" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_PROVISION_SPR_RTC.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/provisionSPR_RTC/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/provisionSPR_RTC_Res/";

declare function xf:provisionSPR_RTC_Res($anyType1 as element(*))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>
                <xmlResponse>{ $anyType1/@* , $anyType1/node() }</xmlResponse>
            </MENSAJE>
            <DESCRIPCION>Operacion ejecutada correctamente</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $anyType1 as element(*) external;

xf:provisionSPR_RTC_Res($anyType1)