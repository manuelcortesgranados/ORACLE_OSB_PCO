(:: pragma bea:global-element-parameter parameter="$commandResponseData1" element="nsn:CommandResponseData" location="../WSDLs/ejecutarOperacionesUN_WS.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CARGAR_WSUN.xsd" ::)

declare namespace nsn = "http://nsn.com/ossbss/charge.once/wsdl/entity/Tis/xsd/1";
declare namespace ns1 = "http://www.comcel.com.co/CargarWSUN/";
declare namespace xf = "http://tempuri.org/ITEL/UN/Resources/XQueries/cargarWSUN_Res/";
(:Variable global usada para guardar los parametros de respuesta:)
declare variable $operation := "Charge";
declare variable $baseTextForError := "ERROR: ";

(:Metodo para recuperar los parametros de respuesta:)
declare function xf:cargarWSUN_Res($descripcion as xs:string,
    $tiempoI as xs:time,
    $commandResponseData1 as element(nsn:CommandResponseData))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <MENSAJE>
                <Charge 
                mensaje= "{
                 			data(xf:buildResultMessage(xf:getResponseParameter($commandResponseData1,"Result","")))  
                }" 
                exito = "{
			                if (contains(upper-case(xf:getResponseParameter($commandResponseData1,"Result","")), "OK")) then
			                "true" else ""
                }" >
                 
                <messageCode > 	
                   {
                            data(xf:getResponseParameter($commandResponseData1,"MessageId",""))
                    }
                   </messageCode>
                  <resultText>
                  {
                  			data(xf:getResponseParameter($commandResponseData1,"Result",""))
                  }
                  </resultText>
				
                  {
                  			for $balance in xf:getResponseParameter($commandResponseData1,"ChargedBalances", "List") 
                  			return <resultingBalance>{ data( $balance ) } </resultingBalance>                 
                  }
                  <DESCRIPCION>
		            {
		            	if( contains(upper-case(xf:getResponseParameter($commandResponseData1,"Result","")), "OK")) then
		            	concat($descripcion, fn:current-time() - $tiempoI)
		            	else xf:buildResultMessage(xf:getResponseParameter($commandResponseData1,"Result",""))
		            }
		          </DESCRIPCION>
                </Charge>
            </MENSAJE>
            
        </ns1:WS_Result>
};

(:Filtra los parametros deseados:)
declare function xf:getResponseParameter($commandResponseData1 as element(nsn:CommandResponseData), $parameter as xs:string, $structType as xs:string){
if ( contains($structType,"List") ) then
	let $list := $commandResponseData1/nsn:CommandResult[1]/nsn:OperationResult[1]/nsn:Operation[@name = $operation]/nsn:ParameterList/nsn:ListParameter[@name = $parameter]//*
	return if ($list != "" ) then $list else "" 
else if ( contains($structType,"Struct") ) then
    let $struct := $commandResponseData1/nsn:CommandResult[1]/nsn:OperationResult[1]/nsn:Operation[@name = $operation]/nsn:ParameterList/nsn:StructParameter[@name = $parameter]//*
	return if ($struct != "" ) then $struct else ""
else
	let $data := $commandResponseData1/nsn:CommandResult[1]/nsn:OperationResult[1]/nsn:Operation[@name = $operation]/nsn:ParameterList/*[@name = $parameter]
	return if ($data != "" ) then $data else ""
(: TODO: Devuelve vacio si no existe el parametro, definir el manejo de error en este caso:)
};

(:Filtra el mensaje recibido por UN:)
declare function xf:buildResultMessage($result) as xs:string{
   if( contains(upper-case($result),"OK") ) then "Sucessful operation" else
	if( contains($result, "500")) then concat($baseTextForError,"Unsopported event class") else
	  if ( contains($result,"501") ) then concat($baseTextForError,"Customer locked") else
	   if ( contains($result,"502") ) then concat($baseTextForError,"Invalid lifecycle") else
	     if ( contains($result,"503") ) then concat($baseTextForError,"Event not found") else
	      if ( contains($result,"504") ) then concat($baseTextForError,"Insufficient balance") else
	       if ( contains($result,"505") ) then concat($baseTextForError,"Technical error")
	        else concat($baseTextForError,"Unexpected error code") 
};



declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;
declare variable $commandResponseData1 as element(nsn:CommandResponseData) external;

xf:cargarWSUN_Res($descripcion,
    $tiempoI,
    $commandResponseData1)