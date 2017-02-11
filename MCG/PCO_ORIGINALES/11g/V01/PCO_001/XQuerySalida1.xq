(:: pragma bea:global-element-parameter parameter="$pCO_001_Request1" element="ns0:PCO_001_Request" location="PCO_001_Firma.xsd" ::)
(:: pragma bea:global-element-return element="ns0:PCO_001_Response" location="PCO_001_Firma.xsd" ::)

declare namespace ns0 = "http://www.example.org/PCO_001_Firma";
declare namespace xf = "http://tempuri.org/OSB_Project_PCO_001/XQuerySalida1/";

declare function xf:XQuerySalida1($pCO_001_Request1 as element(ns0:PCO_001_Request))
    as element(ns0:PCO_001_Response) {
        <ns0:PCO_001_Response>
            <ns0:cadenaSalida>{ concat(data($pCO_001_Request1/ns0:cadenaEntrada),data('manolito')) }</ns0:cadenaSalida>
        </ns0:PCO_001_Response>
};

declare variable $pCO_001_Request1 as element(ns0:PCO_001_Request) external;

xf:XQuerySalida1($pCO_001_Request1)
