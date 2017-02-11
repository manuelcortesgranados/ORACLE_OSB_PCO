xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$commandResponseData1" element="nsn:CommandResponseData" location="../Schemas/PS_ITEL_OPERACION_UNIFIED_BASETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARDATOSSUSCRIPTORUN.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/UN/Resources/XQueries/consultarDatosSuscriptorWSUN_Res/";
declare namespace nsn = "http://nsn.com/ossbss/charge.once/wsdl/entity/Tis/xsd/1";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarDatosSuscriptorUN/";
(:Variable global usada para guardar los parametros de respuesta:)
declare variable $operation := "Read";
declare variable $baseTextForError := "ERROR: ";

declare function xf:consultarDatosSuscriptorWSUN_Res($descripcion as xs:string,
$tiempoI as xs:time,
$commandResponseData1 as element(nsn:CommandResponseData))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        <MENSAJE>
                <DatosSuscriptor 
				mensaje= "{
                 			data(xf:buildResultMessage(xf:getResponseParameter($commandResponseData1,"Result","")))  
                }" 
                exito = "{
			                if (contains(upper-case(xf:getResponseParameter($commandResponseData1,"Result","")), "OK")) then
			                "true" else "false"
                }" >
                
                <CUSTOMERID > 
                   {
                            data(xf:getResponseParameter($commandResponseData1,"CustomerId",""))
                    }
                </CUSTOMERID>
                <Cgpa > 
                   {
                            data(xf:getResponseParameter($commandResponseData1,"Cgpa",""))
                    }
                </Cgpa>
                <IsFirstCallPassed>
	                {
	                		data(xf:getResponseParameter($commandResponseData1,"IsFirstCallPassed",""))
	                }
                </IsFirstCallPassed>
                <IsLocked>
                	{
                			data(xf:getResponseParameter($commandResponseData1,"IsLocked",""))
                	}
                </IsLocked>
                <IsGPRSUsed>
                	{
                			data(xf:getResponseParameter($commandResponseData1,"IsGPRSUsed",""))
                	}
                </IsGPRSUsed>
                   {
                  			for $fnf in xf:getResponseParameter($commandResponseData1,"FnFList", "List") 
                  			return <FnF_Numbers>{ data( $fnf ) } </FnF_Numbers>
                  	}
                  	{
                  			let $onPeakData := xf:getResponseParameter($commandResponseData1,"OnPeakAccoundID","Struct")
                  			return
		                  	<OnPeakAccoundID>
		                  			<Balance>{ data( $onPeakData[@name = "Balance" ] ) }</Balance>
		                  			<ExpiryDate>{ data( $onPeakData[@name = "ExpiryDate" ] ) }</ExpiryDate>
		                   </OnPeakAccoundID>
                   }
                   {
                  			let $offPeakData := xf:getResponseParameter($commandResponseData1,"OffPeakAccoundID","Struct")
                  			return
		                  	<OnPeakAccoundID>
		                  			<Balance>{ data( $offPeakData[@name = "Balance" ] ) }</Balance>
		                  			<ExpiryDate>{ data( $offPeakData[@name = "ExpiryDate" ] ) }</ExpiryDate>
		                   </OnPeakAccoundID>
                   }
                </DatosSuscriptor>
            </MENSAJE>
            
            <DESCRIPCION>
		            {
		            	if( contains(upper-case(xf:getResponseParameter($commandResponseData1,"Result","")), "OK")) then
		            	concat($descripcion, fn:current-time() - $tiempoI)
		            	else xf:buildResultMessage(xf:getResponseParameter($commandResponseData1,"Result",""))
		            }
		    </DESCRIPCION>
		    
        </ns0:WS_Result>
};

(:Filtra los parametros deseados:)
declare function xf:getResponseParameter($commandResponseData1 as element(nsn:CommandResponseData), $parameter as xs:string, $structType as xs:string){
if ( contains($structType,"List") ) then
	let $list := $commandResponseData1/nsn:CommandResult/nsn:OperationResult/nsn:Operation[@name = $operation]/nsn:ParameterList/nsn:ListParameter[@name = $parameter]//*
	return if ($list != "" ) then $list else "" 
else if ( contains($structType,"Struct") ) then
    let $struct := $commandResponseData1/nsn:CommandResult/nsn:OperationResult/nsn:Operation[@name = $operation]/nsn:ParameterList/nsn:StructParameter[@name = $parameter]//*
	return if ($struct != "" ) then $struct else ""
else
	let $data := $commandResponseData1/nsn:CommandResult/nsn:OperationResult/nsn:Operation[@name = $operation]/nsn:ParameterList/*[@name = $parameter]
	return if ($data != "" ) then $data else ""
(: TODO: Devuelve vacio si no existe el parametro, definir el manejo de error en este caso:)
};

(:Filtra el mensaje recibido por UN:)
declare function xf:buildResultMessage($result) as xs:string{
   if( contains(upper-case($result),"OK") ) then "Sucessfull operation" else
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

xf:consultarDatosSuscriptorWSUN_Res($descripcion, $tiempoI,$commandResponseData1)