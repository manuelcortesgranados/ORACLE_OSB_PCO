(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERT_RTC_REQUESTERROR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERT_RTC_REQUESTERROR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/Insertrtcrequesterror";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERT_RTCREQUEST_ERROR/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertRTCRequestError_Req/";

declare function xf:insertRTCRequestError_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_FECHA>{ data($input_Parameters1/FECHA) }</ns0:P_FECHA>
            <ns0:P_RTCRESP>{ data($input_Parameters1/RTCRESP) }</ns0:P_RTCRESP>
            <ns0:P_ESTADO>{ data($input_Parameters1/ESTADO) }</ns0:P_ESTADO>
            <ns0:P_REINTENTOS>{ data($input_Parameters1/REINTENTOS) }</ns0:P_REINTENTOS>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertRTCRequestError_Req($input_Parameters1)