(:: pragma bea:schema-type-parameter parameter="$consultarSuscriptorResponse1" type="ns1:methodResponse" location="../../../AIR/Resources/Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/consultarSuscriptorOCS_res/";

declare function xf:consultarSuscriptorOCS_res($consultarSuscriptorResponse1 as element(),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
            	<CONSULTAR_SUSCRIPTOR  	exito="true" 
            							mensaje="" 
            							cluster="AIR">
					<oper:suscriptor  	xmlns:oper="http://www.comcel.com.co/OCS/OperacionCorbaOCS">
						<tns:DirectoryNumber  	xmlns:tns="http://www.comcel.com.co/OCS/OperacionCorbaOCS">{ substring(data($consultarSuscriptorResponse1/params/param/value/struct/member[name = "masterAccountNumber"]/value),3) }</tns:DirectoryNumber>
						<tns:PublicRatePlanCode  	xmlns:tns="http://www.comcel.com.co/OCS/OperacionCorbaOCS">{ data($consultarSuscriptorResponse1/params/param/value/struct/member[name = "serviceClassCurrent"]/value/i4) }</tns:PublicRatePlanCode>
						<tns:ContractStatus  	xmlns:tns="http://www.comcel.com.co/OCS/OperacionCorbaOCS">{ if (data($consultarSuscriptorResponse1/params/param/value/struct/member[name = "temporaryBlockedFlag"]/value) = '1') then '3' else '0' }</tns:ContractStatus>
						<tns:RefillBarredUntil  	xmlns:tns="http://www.comcel.com.co/OCS/OperacionCorbaOCS">{ data($consultarSuscriptorResponse1/params/param/value/struct/member[name = "refillUnbarDateTime"]/value) }</tns:RefillBarredUntil>
						<tns:Prepaid_LC_State  	xmlns:tns="http://www.comcel.com.co/OCS/OperacionCorbaOCS">{ if (data($consultarSuscriptorResponse1/params/param/value/struct/member[name = "accountFlags"]/value/struct/member[name = "activationStatusFlag"]/value) = '0') then '3' else '1' }</tns:Prepaid_LC_State>
						<tns:AccountGroupID  	xmlns:tns="http://www.comcel.com.co/OCS/OperacionCorbaOCS">{ data($consultarSuscriptorResponse1/params/param/value/struct/member[name = "accountGroupID"]/value/i4) }</tns:AccountGroupID>
						<tns:ActivationDate  	xmlns:tns="http://www.comcel.com.co/OCS/OperacionCorbaOCS">{ data($consultarSuscriptorResponse1/params/param/value/struct/member[name = "activationDate"]/value/dateTime.iso8601) }</tns:ActivationDate>
					</oper:suscriptor>
				</CONSULTAR_SUSCRIPTOR>                
             <DESCRIPCION>{ $descripcion }</DESCRIPCION>  
            </MENSAJE>
        </ns0:WS_Result>
};

declare variable $consultarSuscriptorResponse1 as element() external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarSuscriptorOCS_res($consultarSuscriptorResponse1,
    $codigo,
    $descripcion)