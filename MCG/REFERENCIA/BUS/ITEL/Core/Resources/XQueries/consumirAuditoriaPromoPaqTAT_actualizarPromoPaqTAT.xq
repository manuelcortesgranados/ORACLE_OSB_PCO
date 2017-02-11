(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIAPROMOPAQUETESTAT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_ACTUALIZAR_PROMOPAQUETESTAT.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_ACTUALIZAR_PROMOPAQTAT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaPromoPaqTAT_actualizarPromoPaqTAT/";

declare function xf:consumirAuditoriaPromoPaqTAT_actualizarPromoPaqTAT($input_Parameters1 as element(ns1:Input_Parameters),
    $codigoRta as xs:string, $descripcionRta as xs:string, $estadoPromo as xs:string  )
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/EVEMIN) }</ns0:P_MIN>
            <ns0:P_FECHABONO>{ data($input_Parameters1/EVEFECHARECARGA) }</ns0:P_FECHABONO>
            <ns0:P_CODRTA>{ $codigoRta }</ns0:P_CODRTA>
            <ns0:P_DESCRIPRTA>{ fn:tokenize(data($descripcionRta),"!")[4] }</ns0:P_DESCRIPRTA>
            <ns0:P_ESTADO>{ $estadoPromo }</ns0:P_ESTADO>
            <ns0:P_PAQUETE_ID>{ data($input_Parameters1/EVECODIGOPAQUETE) }</ns0:P_PAQUETE_ID>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;
declare variable $codigoRta as xs:string external;
declare variable $descripcionRta as xs:string external;
declare variable $estadoPromo as xs:string external;


xf:consumirAuditoriaPromoPaqTAT_actualizarPromoPaqTAT($input_Parameters1,
    $codigoRta, $descripcionRta, $estadoPromo)
