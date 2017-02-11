(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_INH_SMO_PRCINS_ENVIA_PORT_OUT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_INH_SMO_PRCINS_ENVIA_PORT_OUT.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_SMO/PRCINS_ENVIA_PORT_OUT/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/insertarEnviarPort_Req/";

declare function xf:insertarEnviarPort_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            {
                for $PUERTOIN in $input_Parameters1/PUERTOIN
                return
                    <ns0:V_PUERTOIN>{ data($PUERTOIN) }</ns0:V_PUERTOIN>
            }
            {
                for $TECNOLOGIA in $input_Parameters1/TECNOLOGIA
                return
                    <ns0:V_TECNOLOGIA>{ data($TECNOLOGIA) }</ns0:V_TECNOLOGIA>
            }
            {
                for $ORIGEN in $input_Parameters1/ORIGEN
                return
                    <ns0:V_ORIGEN>{ data($ORIGEN) }</ns0:V_ORIGEN>
            }
            {
                for $DESTINO in $input_Parameters1/DESTINO
                return
                    <ns0:V_DESTINO>{ data($DESTINO) }</ns0:V_DESTINO>
            }
            {
                for $MSG in $input_Parameters1/MSG
                return
                    <ns0:V_MSG>{ data($MSG) }</ns0:V_MSG>
            }
            {
                for $HORAEXP in $input_Parameters1/HORAEXP
                return
                    <ns0:V_HORAEXP>{ data($HORAEXP) }</ns0:V_HORAEXP>
            }
            {
                for $MINUTOEXP in $input_Parameters1/MINUTOEXP
                return
                    let $__nullable := ( data($MINUTOEXP) )
                    return
                        if (fn:boolean($__nullable))
                        then
                            <ns0:V_MINUTOEXP>{ $__nullable }</ns0:V_MINUTOEXP>
                        else
                            ()
            }
            {
                for $ANUALENTREGA in $input_Parameters1/ANUALENTREGA
                return
                    <ns0:V_ANUALENTREGA>{ data($ANUALENTREGA) }</ns0:V_ANUALENTREGA>
            }
            {
                for $MES_ENTREGA in $input_Parameters1/MES_ENTREGA
                return
                    <ns0:V_MES_ENTREGA>{ data($MES_ENTREGA) }</ns0:V_MES_ENTREGA>
            }
            {
                for $DIA_ENTREGA in $input_Parameters1/DIA_ENTREGA
                return
                    <ns0:V_DIA_ENTREGA>{ data($DIA_ENTREGA) }</ns0:V_DIA_ENTREGA>
            }
            {
                for $HORA_ENTREGA in $input_Parameters1/HORA_ENTREGA
                return
                    <ns0:V_HORA_ENTREGA>{ data($HORA_ENTREGA) }</ns0:V_HORA_ENTREGA>
            }
            {
                for $MINUTO_ENTREGA in $input_Parameters1/MINUTO_ENTREGA
                return
                    <ns0:V_MINUTO_ENTREGA>{ data($MINUTO_ENTREGA) }</ns0:V_MINUTO_ENTREGA>
            }
            {
                for $PUERTO_OUT in $input_Parameters1/PUERTO_OUT
                return
                    <ns0:V_PUERTO_OUT>{ data($PUERTO_OUT) }</ns0:V_PUERTO_OUT>
            }
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertarEnviarPort_Req($input_Parameters1)