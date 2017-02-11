xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace sol="http://www.miempresa.org";
(:: import schema at "xsd/miFirmaHolaMundo.xsd" ::)

declare variable $solicitud as element() (:: schema-element(sol:HolaMundoRequest) ::) external;

declare function local:miFuncionMapeo($solicitud as element() (:: schema-element(sol:HolaMundoRequest) ::)) as element() (:: schema-element(sol:HolaMundoResponse) ::) {
    <sol:HolaMundoResponse>
        <sol:cadenaSalida1>{fn:data(fn:concat($solicitud/sol:cadenaEntrada1,'manolito'))}</sol:cadenaSalida1>
    </sol:HolaMundoResponse>
};

local:miFuncionMapeo($solicitud)
