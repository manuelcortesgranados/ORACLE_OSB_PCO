(:: pragma bea:global-element-return element="ns0:CadenaEntradaSalidaResponse" location="../../OSB_PCO_000/Recursos/Firmas_XSD/FirmaCadenaEntradaSalida.xsd" ::)

declare namespace ns0 = "http://www.example.org/FirmaCadenaEntradaSalida";
declare namespace xf = "http://tempuri.org/OSB_PCO_001/XQuery/xqueryCadenaSalida/";

declare function xf:xqueryCadenaSalida($cadenaSalida as xs:string)
    as element(ns0:CadenaEntradaSalidaResponse) {
        <ns0:CadenaEntradaSalidaResponse>
            <ns0:cadenaSalida>{ $cadenaSalida }</ns0:cadenaSalida>
        </ns0:CadenaEntradaSalidaResponse>
};

declare variable $cadenaSalida as xs:string external;

xf:xqueryCadenaSalida($cadenaSalida)
