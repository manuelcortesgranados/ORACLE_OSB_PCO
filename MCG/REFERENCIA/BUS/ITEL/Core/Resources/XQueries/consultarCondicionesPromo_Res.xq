(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARCONDICIONESPROMO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCONDICIONESPROMO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/consultarCondicionesPromo/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarCondicionesPromo";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCondicionesPromo_Res/";

declare function xf:consultarCondicionesPromo_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ data($outputParameters1/ns0:P_RESULTADO) }</CODIGO>
            <MENSAJE>
                <P_RESULTADO>{ data($outputParameters1/ns0:P_RESULTADO) }</P_RESULTADO>
                <P_DESCRIPCION>{ data($outputParameters1/ns0:P_DESCRIPCION) }</P_DESCRIPCION>
                <P_PREMIOS>{                      
	                    for $i in $outputParameters1/ns0:P_PREMIOS/ns0:P_PREMIOS_Row
	                    	return
	                             <P_PREMIO>
                           			<PIN>{data($i//*:PIN)}</PIN>
                           			<PIN_ID>{data($i//*:PIN_ID)}</PIN_ID>
                           			<NOTIFICACION>{data($i//*:NOTIFICACION)}</NOTIFICACION>
                        		</P_PREMIO>   
	             }</P_PREMIOS>
            </MENSAJE>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:consultarCondicionesPromo_Res($outputParameters1)