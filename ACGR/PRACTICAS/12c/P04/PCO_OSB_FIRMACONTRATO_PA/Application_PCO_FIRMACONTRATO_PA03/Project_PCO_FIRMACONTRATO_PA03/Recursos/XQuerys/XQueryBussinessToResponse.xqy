xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.firLoc.org";
(:: import schema at "../XMLFirmas/FirmaLocaciones.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BSReferenceLocaciones";
(:: import schema at "../../Resources/BSReferenceLocaciones_sp.xsd" ::)

declare variable $parametroSalidaLocaciones as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:funcionTransformadora2($parametroSalidaLocaciones as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:locacionesResponse) ::) 
{
    <ns2:locacionesResponse>
    {
      for $locaciones in $parametroSalidaLocaciones/ns1:P_CURSOR_RETORNO/ns1:Row
      return
        <ns2:locaciones>
            <ns2:idLocacion>{data($locaciones/ns1:Column[@name="LOCATION_ID"])}</ns2:idLocacion>
            <ns2:direccionLocacion>{data($locaciones/ns1:Column[@name="STREET_ADDRESS"])}</ns2:direccionLocacion>
            <ns2:codigoPostal>{data($locaciones/ns1:Column[@name="POSTAL_CODE"])}</ns2:codigoPostal>
            <ns2:ciudadLocacion>{data($locaciones/ns1:Column[@name="CITY"])}</ns2:ciudadLocacion>
            <ns2:provinciaEstado>{data($locaciones/ns1:Column[@name="STATE_PROVINCE"])}</ns2:provinciaEstado>
            <ns2:idPais>{data($locaciones/ns1:Column[@name="COUNTRY_ID"])}</ns2:idPais>
        </ns2:locaciones>
      }
    </ns2:locacionesResponse>
};

local:funcionTransformadora2($parametroSalidaLocaciones)
