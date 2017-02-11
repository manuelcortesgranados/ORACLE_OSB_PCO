(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)
(:: pragma bea:global-element-return element="ns2:Input_Parameters" location="../../../Trama401/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA401.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama401/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglasProvision_Req_CalcularProvTrama401Local/";

declare function xf:consultarReglasProvision_Req_CalcularProvTrama401Local($input_Parameters as element(ns0:Input_Parameters))
    as element(ns2:Input_Parameters) {
        <ns2:Input_Parameters>
            <TRAMA>{ data($input_Parameters/TRAMA) }</TRAMA>
            <METODO>{ data($input_Parameters/METODO) }</METODO>
            <MINDESTINO>{ data($input_Parameters/MIN_DESTINO) }</MINDESTINO>
            <MINORIGEN>{ data($input_Parameters/MIN_ORIGEN) }</MINORIGEN>
            <PARAMETROSTRAMA>{ $input_Parameters/PARAMETROSTRAMA/@* , $input_Parameters/PARAMETROSTRAMA/node() }</PARAMETROSTRAMA>
            <PARAMETROSNEGOCIO>{ $input_Parameters/PARAMETROSNEGOCIO/@* , $input_Parameters/PARAMETROSNEGOCIO/node() }</PARAMETROSNEGOCIO>
            <SUSCRIPTORDESTINO>{ $input_Parameters/SUSCRIPTORDESTINO/@*,$input_Parameters/SUSCRIPTORDESTINO/node() }</SUSCRIPTORDESTINO>
            <SUSCRIPTORORIGEN>{ $input_Parameters/SUSCRIPTORORIGEN/@*,$input_Parameters/SUSCRIPTORORIGEN/node() }</SUSCRIPTORORIGEN>
            <INDESTINO>{ data($input_Parameters/IN_DESTINO) }</INDESTINO>
            <INORIGEN>{ data($input_Parameters/IN_ORIGEN) }</INORIGEN>
            <TIEMPO>{ data($input_Parameters/TIEMPO) }</TIEMPO>
        </ns2:Input_Parameters>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:consultarReglasProvision_Req_CalcularProvTrama401Local($input_Parameters)