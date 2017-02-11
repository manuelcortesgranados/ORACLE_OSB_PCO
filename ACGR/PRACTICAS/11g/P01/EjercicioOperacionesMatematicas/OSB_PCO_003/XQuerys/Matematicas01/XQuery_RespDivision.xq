(:: pragma bea:global-element-return element="ns0:operacionDivisionResponse" location="../../../OSB_PCO_000/Recursos/Firmas_XSD/Matematicas01/FirmaOperando01.xsd" ::)

declare namespace ns0 = "http://www.firmaMatematicas01.org/FirmaOperando01";
declare namespace xf = "http://tempuri.org/OSB_PCO_003/XQuery/Matematicas01/XQuery_RespDivision/";

declare function xf:XQuery_RespDivision($p_respDivision as xs:double)
    as element(ns0:operacionDivisionResponse) {
        <ns0:operacionDivisionResponse>
            <ns0:respuesta>{ $p_respDivision }</ns0:respuesta>
        </ns0:operacionDivisionResponse>
};

declare variable $p_respDivision as xs:double external;

xf:XQuery_RespDivision($p_respDivision)