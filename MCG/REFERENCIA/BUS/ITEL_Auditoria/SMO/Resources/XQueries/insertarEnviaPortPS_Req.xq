(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_INH_SMO_PRCINS_ENVIA_PORT_OUT.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/SMO/Resources/XQueries/insertarEnviaPortPS_Req/";

declare function xf:insertarEnviaPortPS_Req($puertoIn as xs:decimal,
    $tecnologia as xs:decimal,
    $origen as xs:string,
    $destino as xs:string,
    $msg as xs:string,
    $horaExp as xs:decimal,
    $minutoExp as xs:decimal,
    $anualEntrega as xs:decimal,
    $mesEntrega as xs:decimal,
    $diaEntrega as xs:decimal,
    $horaEntrega as xs:decimal,
    $minutoEntrega as xs:decimal,
    $puertoOut as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PUERTOIN>{ $puertoIn }</PUERTOIN>
            <TECNOLOGIA>{ $tecnologia }</TECNOLOGIA>
            <ORIGEN>{ $origen }</ORIGEN>
            <DESTINO>{ $destino }</DESTINO>
            <MSG>{ $msg }</MSG>
            <HORAEXP>{ $horaExp }</HORAEXP>
            <MINUTOEXP>{ $minutoExp }</MINUTOEXP>
            <ANUALENTREGA>{ $anualEntrega }</ANUALENTREGA>
            <MES_ENTREGA>{ $mesEntrega }</MES_ENTREGA>
            <DIA_ENTREGA>{ $diaEntrega }</DIA_ENTREGA>
            <HORA_ENTREGA>{ $horaEntrega }</HORA_ENTREGA>
            <MINUTO_ENTREGA>{ $minutoEntrega }</MINUTO_ENTREGA>
            <PUERTO_OUT>{ $puertoOut }</PUERTO_OUT>
        </ns0:Input_Parameters>
};

declare variable $puertoIn as xs:decimal external;
declare variable $tecnologia as xs:decimal external;
declare variable $origen as xs:string external;
declare variable $destino as xs:string external;
declare variable $msg as xs:string external;
declare variable $horaExp as xs:decimal external;
declare variable $minutoExp as xs:decimal external;
declare variable $anualEntrega as xs:decimal external;
declare variable $mesEntrega as xs:decimal external;
declare variable $diaEntrega as xs:decimal external;
declare variable $horaEntrega as xs:decimal external;
declare variable $minutoEntrega as xs:decimal external;
declare variable $puertoOut as xs:decimal external;

xf:insertarEnviaPortPS_Req($puertoIn,
    $tecnologia,
    $origen,
    $destino,
    $msg,
    $horaExp,
    $minutoExp,
    $anualEntrega,
    $mesEntrega,
    $diaEntrega,
    $horaEntrega,
    $minutoEntrega,
    $puertoOut)