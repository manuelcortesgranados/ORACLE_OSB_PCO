(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_consultarReglasProvision/";

declare function xf:ejecutador_Req_consultarReglasProvision($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <TRAMA>{ data($input_Parameters1/TRAMA) }</TRAMA>
            <METODO>{ data($input_Parameters1/METODO) }</METODO>
            <MIN_DESTINO>{ data($input_Parameters1/MIN_DESTINO) }</MIN_DESTINO>
            <MIN_ORIGEN>{ data($input_Parameters1/MIN_ORIGEN) }</MIN_ORIGEN>
            <IN_DESTINO>{ data($input_Parameters1/IN_DESTINO) }</IN_DESTINO>
            <IN_ORIGEN>{ data($input_Parameters1/IN_ORIGEN) }</IN_ORIGEN>
            <PARAMETROSTRAMA>
                {
                    for $PARAMETRO in $input_Parameters1/PARAMETROS_TRAMA/PARAMETRO
                    return
                        <PARAMETRO>{ $PARAMETRO/@* , $PARAMETRO/node() }</PARAMETRO>
                }
            </PARAMETROSTRAMA>
            <PARAMETROSNEGOCIO>
                {
                    for $PARAMETRO in $input_Parameters1/PARAMETROS_NEGOCIO/PARAMETRO
                    return
                        <PARAMETRO>{ $PARAMETRO/@* , $PARAMETRO/node() }</PARAMETRO>
                }
            </PARAMETROSNEGOCIO>
            <SUSCRIPTORDESTINO>{ $input_Parameters1/SUSCRIPTOR_DESTINO/@* , $input_Parameters1/SUSCRIPTOR_DESTINO/node() }</SUSCRIPTORDESTINO>
            <SUSCRIPTORORIGEN>{ $input_Parameters1/SUSCRIPTOR_ORIGEN/@* , $input_Parameters1/SUSCRIPTOR_ORIGEN/node() }</SUSCRIPTORORIGEN>
            <SUSCRIPTOR_OCS>{ $input_Parameters1/SUSCRIPTOR_OCS/@* , $input_Parameters1/SUSCRIPTOR_OCS/node() }</SUSCRIPTOR_OCS>
            <TIEMPO>{ data($input_Parameters1/TIEMPO_INICIO) }</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:ejecutador_Req_consultarReglasProvision($input_Parameters1)