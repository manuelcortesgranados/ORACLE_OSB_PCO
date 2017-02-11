(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Trama402/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA402.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama402/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglasProvision_Req_CalcularProvTrama402Local/";

declare function xf:consultarReglasProvision_Req_CalcularProvTrama402Local($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ data($input_Parameters/TRAMA) }</TRAMA>
            <METODO>{ data($input_Parameters/METODO) }</METODO>
            <MINORIGEN>{ data($input_Parameters/MIN_ORIGEN) }</MINORIGEN>
            <MINDESTINO>{ data($input_Parameters/MIN_DESTINO) }</MINDESTINO>
            <PARAMETROSTRAMA>{ $input_Parameters/PARAMETROSTRAMA/@* , $input_Parameters/PARAMETROSTRAMA/node() }</PARAMETROSTRAMA>
            <PARAMETROSNEGOCIO>{ $input_Parameters/PARAMETROSNEGOCIO/@* , $input_Parameters/PARAMETROSNEGOCIO/node() }</PARAMETROSNEGOCIO>
            <SUSCRIPTORORIGEN>{ $input_Parameters/SUSCRIPTORORIGEN/@*,$input_Parameters/SUSCRIPTORORIGEN/node() }</SUSCRIPTORORIGEN>
            <SUSCRIPTORDESTINO>{ $input_Parameters/SUSCRIPTORDESTINO/@*,$input_Parameters/SUSCRIPTORDESTINO/node() }</SUSCRIPTORDESTINO>
            <CODIGOINORIGEN>{ data($input_Parameters/IN_ORIGEN) }</CODIGOINORIGEN>
            <CODIGOINDESTINO>{ data($input_Parameters/IN_DESTINO) }</CODIGOINDESTINO>
            <TIEMPO>{ data($input_Parameters/TIEMPO) }</TIEMPO>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:consultarReglasProvision_Req_CalcularProvTrama402Local($input_Parameters)