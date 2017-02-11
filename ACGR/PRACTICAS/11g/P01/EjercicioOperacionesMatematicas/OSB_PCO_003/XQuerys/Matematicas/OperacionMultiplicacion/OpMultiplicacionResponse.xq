(:: pragma bea:global-element-return element="ns0:operacionMultiplicacionResponse" location="../../../../OSB_PCO_000/Recursos/Firmas_XSD/Matematicas/FirmaOperandos.xsd" ::)

declare namespace ns0 = "http://www.firmaMatematicas.org/FirmaOperandos";
declare namespace xf = "http://tempuri.org/OSB_PCO_003/XQuery/OperacionMultiplicacion/OpMultiplicacionResponse/";

declare function xf:OpMultiplicacionResponse($p_respuesta as xs:double)
    as element(ns0:operacionMultiplicacionResponse) {
        <ns0:operacionMultiplicacionResponse>
            <ns0:respuesta>{ $p_respuesta }</ns0:respuesta>
        </ns0:operacionMultiplicacionResponse>
};

declare variable $p_respuesta as xs:double external;

xf:OpMultiplicacionResponse($p_respuesta)