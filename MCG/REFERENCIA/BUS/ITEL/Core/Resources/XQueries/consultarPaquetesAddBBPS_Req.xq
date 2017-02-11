(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_PAQUETESADD_BB.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarPaquetesAddBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesAddBBPS_Req/";

declare function xf:consultarPaquetesAddBBPS_Req($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:consultarPaquetesAddBBPS_Req($min)
