 xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.firmaRegiones.org";
(:: import schema at "../XMLSchemas/FirmaRegiones.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_JCA_ConsultaRegiones";
(:: import schema at "../../Resources/BS_JCA_ConsultaRegiones_sp.xsd" ::)

declare variable $requestRegion as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:funcionTransformadora($requestRegion as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:regionesResponse) ::) {
    <ns2:regionesResponse>
    {
    for $region in $requestRegion/ns1:P_CURSOR_RETORNO/ns1:Row
    return
    
        <ns2:region>
            <ns2:codigoRegion>{data($region/ns1:Column/@name="REGION_ID")}</ns2:codigoRegion>
            <ns2:nombreRegion></ns2:nombreRegion>
        </ns2:region>
    }
    </ns2:regionesResponse>
};

local:funcionTransformadora($requestRegion)
