(:: pragma bea:global-element-return element="ns0:operacionMultiplicacionResponse" location="../../../OSB_PCO_000/Recursos/Firmas_XSD/Matematicas01/FirmaOperando01.xsd" ::)

declare namespace ns0 = "http://www.firmaMatematicas01.org/FirmaOperando01";
declare namespace xf = "http://tempuri.org/OSB_PCO_003/XQuery/Matematicas01/XQuery_RespMultiplicacion/";

declare function xf:XQuery_RespMultiplicacion($p_respMultiplicacion as xs:double)
    as element(ns0:operacionMultiplicacionResponse) {
        <ns0:operacionMultiplicacionResponse>
            <ns0:respuesta>{ $p_respMultiplicacion }</ns0:respuesta>
        </ns0:operacionMultiplicacionResponse>
};

declare variable $p_respMultiplicacion as xs:double external;

xf:XQuery_RespMultiplicacion($p_respMultiplicacion)