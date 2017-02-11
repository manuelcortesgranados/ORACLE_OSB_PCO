(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Trama501/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA501.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama501/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularProvTrama501/";

declare function xf:servicioProvision_Req_calcularProvTrama501($trama as xs:string,
    $metodo as xs:string,
    $min as xs:string,
    $codigoIN as xs:string,
    $tiempo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ $trama }</TRAMA>
            <METODO>{ $metodo }</METODO>
            <MIN>{ $min }</MIN>
            <CODIGOIN>{ $codigoIN }</CODIGOIN>
            <TIEMPO>{ $tiempo }</TIEMPO>
        </ns0:Input_Parameters>
};

declare variable $trama as xs:string external;
declare variable $metodo as xs:string external;
declare variable $min as xs:string external;
declare variable $codigoIN as xs:string external;
declare variable $tiempo as xs:string external;

xf:servicioProvision_Req_calcularProvTrama501($trama,
    $metodo,
    $min,
    $codigoIN,
    $tiempo)