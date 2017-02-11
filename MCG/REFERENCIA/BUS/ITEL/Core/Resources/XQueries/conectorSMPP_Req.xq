(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONECTOR_SMPP.xsd" ::)
(:: pragma bea:global-element-return element="ns1:enviarSMS" location="../Schemas/conectorSMPP.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/conectorSMPP/";
declare namespace ns1 = "http://ws.conectorSMPP.claro.com.co/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/conectorSMPP_Req/";

declare function xf:conectorSMPP_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:enviarSMS) {
        <ns1:enviarSMS>
            <origen>{ data($input_Parameters1/ORIGEN) }</origen>
            <destino>{ data($input_Parameters1/DESTINO) }</destino>
            <mensaje>{ data($input_Parameters1/MENSAJE) }</mensaje>
        </ns1:enviarSMS>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:conectorSMPP_Req($input_Parameters1)
