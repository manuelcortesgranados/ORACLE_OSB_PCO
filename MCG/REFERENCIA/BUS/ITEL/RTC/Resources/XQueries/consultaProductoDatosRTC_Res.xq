(:: pragma bea:global-element-parameter parameter="$getProductsResponse1" element="ns1:getProductsResponse" location="../Schemas/BS_CONSULTA_PAQUETE_DATOS_RTC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_CONSULTAR_PAQUETE_DATOS_RTC.xsd" ::)

declare namespace ns1 = "http://axis.brms.hp.com";
declare namespace ns0 = "http://www.comcel.com.co/ITEL/consultarPaqueteDatosRTC/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/consultarProductoDatosRTC_Res/";

declare function xf:consultarPaqueteDatosRTC_Res($getProductsResponse1 as element(ns1:getProductsResponse))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                {
                    for $return in $getProductsResponse1/*:return
                    return
                        <PAQUETE>
                            {
                                for $productId in $return/*:productId
                                return
                                    <NOMBRE>{ data($productId) }</NOMBRE>
                            }
                            {
                                for $productName in $return/*:productName
                                return
                                    <CONSUMO>{ data($productName) }</CONSUMO>
                            }
                            
                            {
                                for $productType in $return/*:productType
                                return
                                    <TIPO>{ data($productType) }</TIPO>
                            }
                        </PAQUETE>
                }
            </MENSAJE>
            <DESCRIPCION>Operacion Ejecutada</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $getProductsResponse1 as element(ns1:getProductsResponse) external;

xf:consultarPaqueteDatosRTC_Res($getProductsResponse1)
