(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CreateSuscriberRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/CrearSuscriptorOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_SOI";
declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/crearSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI/";

declare function xf:crearSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:CreateSuscriberRequest) {
        <ns0:CreateSuscriberRequest prefix = "{ data($input_Parameters1/PREFIX) }"
                                    initialCharge = "{ data($input_Parameters1/INITIALCHARGE) }"
                                    customerID = "{ data($input_Parameters1/CUSTOMERID) }"
                                    role = "{ data($input_Parameters1/ROLE) }"
                                    partyType = "{ data($input_Parameters1/PARTYTYPE) }"
                                    addressSeq = "{ data($input_Parameters1/ADDRESSSEQ) }"
                                    addressRoles = "{ data($input_Parameters1/ADDRESSROLES) }"
                                    addressLastName = "{ data($input_Parameters1/ADDRESSLASTNAME) }"
                                    addressFirstName = "{ data($input_Parameters1/ADDRESSFIRSTNAME) }"
                                    addressCustomerType = "{ data($input_Parameters1/ADDRESSCUSTOMERTYPE) }"
                                    customerStatus = "{ data($input_Parameters1/CUSTOMERSTATUS) }"
                                    reasonCode = "{ data($input_Parameters1/REASONCODE) }"
                                    partyRoleID = "{ data($input_Parameters1/PARTYROLEID) }"/>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:crearSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1)