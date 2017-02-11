(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA500.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama500/";
declare namespace xf = "http://tempuri.org/ITEL/Trama500/Resources/XQueries/validarTrama500_Error/";

declare function xf:validarTrama500_Error($error as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>912</CODIGO>
            <MENSAJE>
                <HOSTID />
                <CONSECUTIVO />
                <FECHARECARGA />
            </MENSAJE>
            <DESCRIPCION>{ $error }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $error as xs:string external;

xf:validarTrama500_Error($error)