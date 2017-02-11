xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.firReg.org";
(:: import schema at "../XMLFirmas/FirmaRegiones.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BSReferenceRegiones";
(:: import schema at "../../Resources/BSReferenceRegiones_sp.xsd" ::)

declare variable $parametroSalidaRegiones as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:funcionTransformadora2($parametroSalidaRegiones as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:regionesResponse) ::) 
{
    <ns2:regionesResponse>
    {
     for $regiones in $parametroSalidaRegiones/ns1:P_CURSOR_RETORNO/ns1:Row
     return
        <ns2:regiones>
            <ns2:idRegion>{data($regiones/ns1:Column[@name="REGION_ID"])}</ns2:idRegion>
            <ns2:nombreRegion>{data($regiones/ns1:Column[@name="REGION_NAME"])}</ns2:nombreRegion>
        </ns2:regiones>
      }  
    </ns2:regionesResponse>
};

local:funcionTransformadora2($parametroSalidaRegiones)
