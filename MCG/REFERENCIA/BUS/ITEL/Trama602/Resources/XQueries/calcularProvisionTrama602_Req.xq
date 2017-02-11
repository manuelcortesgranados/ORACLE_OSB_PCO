(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA602.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama602Provision_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama602/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama602Provision/Trama602Provision_DF_Trama602Provision";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama602/Resources/XQueries/calcularProvisionTrama602_Req/";

declare function xf:calcularProvisionTrama602_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name = "Trama602Provision_DF_Trama602Provision">
            <ns1:parameterList>
                <ns0:TRAMA_EJECUCION>
                    <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:BLOQUEA_OTRO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR) }</ns0:BLOQUEA_OTRO>
                        <ns0:BLOQUEA_FRAUDE>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR) }</ns0:BLOQUEA_FRAUDE>
                    </ns0:PARAMETROSNEGOCIO>
                    <ns0:SUSCRIPTOR>
                       <ns0:ISLOCKED>{ if ("TRUE" = data($input_Parameters1/SUSCRIPTOR/*:IsLocked)) then "true" else "false" }</ns0:ISLOCKED>
                       <ns0:ISFRAUDLOCKED>{ if ("TRUE" = data($input_Parameters1/SUSCRIPTOR/*:IsFraudLocked)) then "true" else "false" }</ns0:ISFRAUDLOCKED>
                    </ns0:SUSCRIPTOR>
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION/>
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:calcularProvisionTrama602_Req($input_Parameters1)