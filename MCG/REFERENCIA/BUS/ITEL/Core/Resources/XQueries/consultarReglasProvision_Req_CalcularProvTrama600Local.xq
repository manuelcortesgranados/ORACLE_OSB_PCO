(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama600/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA600.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama600/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglasProvision_Req_CalcularProvTrama600Local/";

declare function xf:consultarReglasProvision_Req_CalcularProvTrama600Local($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <TRAMA>{ data($input_Parameters1/TRAMA) }</TRAMA>
            <METODO>{ data($input_Parameters1/METODO) }</METODO>
            <MINORIGEN>{ data($input_Parameters1/MIN_ORIGEN) }</MINORIGEN>
            <MINDESTINO>{ data($input_Parameters1/MIN_DESTINO) }</MINDESTINO>            
            <PARAMETROSTRAMA>{ $input_Parameters1/PARAMETROSTRAMA/@* , $input_Parameters1/PARAMETROSTRAMA/node() }</PARAMETROSTRAMA>
            <PARAMETROSNEGOCIO>{ $input_Parameters1/PARAMETROSNEGOCIO/@* , $input_Parameters1/PARAMETROSNEGOCIO/node() }</PARAMETROSNEGOCIO>
            <SUSCRIPTOR>{ $input_Parameters1/SUSCRIPTORORIGEN/@*,$input_Parameters1/SUSCRIPTORORIGEN/node() }</SUSCRIPTOR>
            <SUSCRIPTOR_OCS>{ $input_Parameters1/SUSCRIPTOR_OCS/@*,$input_Parameters1/SUSCRIPTOR_OCS/node() }</SUSCRIPTOR_OCS>
            <CODIGOINDORIGEN>{ data($input_Parameters1/IN_ORIGEN) }</CODIGOINDORIGEN>
            <CODIGOINDESTINO>{ data($input_Parameters1/IN_DESTINO) }</CODIGOINDESTINO>
            <TIEMPO>{ data($input_Parameters1/TIEMPO) }</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglasProvision_Req_CalcularProvTrama600Local($input_Parameters1)