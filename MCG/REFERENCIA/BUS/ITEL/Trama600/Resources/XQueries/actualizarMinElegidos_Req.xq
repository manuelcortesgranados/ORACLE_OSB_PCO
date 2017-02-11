(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZARMINELEGIDOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ActualizarMinElegidos/";
declare namespace xf = "http://tempuri.org/ITEL/Trama600/Resources/XQueries/actualizarMinElegidos_Req/";

declare function xf:actualizarMinElegidos_Req($min as xs:string,
    $nuevoMin as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <NUEVO_MIN>{ $nuevoMin }</NUEVO_MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $nuevoMin as xs:string external;

xf:actualizarMinElegidos_Req($min,
    $nuevoMin)