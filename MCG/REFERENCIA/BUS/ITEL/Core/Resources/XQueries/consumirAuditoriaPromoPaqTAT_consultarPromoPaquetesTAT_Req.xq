(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIAPROMOPAQUETESTAT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_PROMOPAQUETESTAT.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_PROMOPAQTAT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaPromoPaqTAT_consultarPromoPaquetesTAT_Req/";

declare function xf:consumirAuditoriaPromoPaqTAT_consultarPromoPaquetesTAT_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/EVEMIN) }</ns0:P_MIN>
            <ns0:P_ESTADO>0</ns0:P_ESTADO>
            <ns0:P_PAQUETE_ID>{ data($input_Parameters1/EVECODIGOPAQUETE) }</ns0:P_PAQUETE_ID>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consumirAuditoriaPromoPaqTAT_consultarPromoPaquetesTAT_Req($input_Parameters1)
