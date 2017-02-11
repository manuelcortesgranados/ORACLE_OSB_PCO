(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_MODIFICACION_ELEGIDOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/InsertarModificacionElegidos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_InsertarModificacionElegidos/";

declare function xf:ejecutador_Req_InsertarModificacionElegidos($min as xs:string,
    $elegidosModificados as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <MES>{ month-from-dateTime(current-dateTime())}</MES>
            <ANIO>{ year-from-dateTime(current-dateTime())}</ANIO>
            <ELEGIDOS_MODIFICADOS>{ $elegidosModificados }</ELEGIDOS_MODIFICADOS>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $elegidosModificados as xs:string external;

xf:ejecutador_Req_InsertarModificacionElegidos($min,
    $elegidosModificados)