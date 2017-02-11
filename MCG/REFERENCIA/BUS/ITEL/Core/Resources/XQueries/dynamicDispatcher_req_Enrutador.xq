(:: pragma bea:local-element-parameter parameter="$parametros1" type="ns0:Input_Parameters/servicio/parametros" location="../Schemas/PS_ITEL_DYNAMICDISPATCHER.xsd" ::)
(:: pragma  type="anyType" ::)

declare namespace ns0 = "http://www.comcel.com.co/DynamicDispatcher/";
declare namespace xf = "http://tempuri.org/ITEL/Core/XQuerys/dynamicDispatcherToEnrutador/";

declare function xf:dynamicDispatcherToEnrutador($servicio as xs:string,
    $parametros1 as element())
    as element(*) {
    
      <enr:Input_Parameters xmlns:enr="http://www.comcel.com.co/EnrutadorDinamico/">
    	<Servicio>{$servicio}</Servicio>
    	<Parametros>{
    	(: No se repita el mismo:)
 		  if(contains($servicio,'dynamicDispatcher_PS')) then
            (            )
         else
  		     if(contains($servicio,'_PS') and not(contains($servicio,'Local_PS'))) then
  		     (
   			(:Casos que cumplen con el estandar _PS & <ins:InputParameters xmlns:ins=http://www.comcel.com.co/Xxxxx/>:)
 			 let $name_service:=substring-after($servicio,'Proxies/')
  			 let $name_service2:=replace($name_service,'_PS','')
  			 (:Nombre del servicio 1 en UpperCase:)
 			 let $name_service3:=concat(upper-case(substring($name_service2,1,1)),substring($name_service2,2,string-length($name_service2)))
 			 let $name_space:=concat("http://www.comcel.com.co/",$name_service3,'/')
    		 return
    			 element{expanded-QName($name_space, 'Input_Parameters') }{
    				 for $p in $parametros1/parametro
     					return
         				 element{ $p/nombre/text()}
          						{ $p/valor/node()}
    
   				}
   					 
   			)
   			else
  		     if(contains($servicio,'Local_PS')) then
  		     (
   			(:Casos que cumplen con el estandar Local_PS & <ins:Input_Parameters xmlns:ins=http://www.comcel.com.co/Xxxxx/>:)
 			 let $name_service:=substring-after($servicio,'Proxies/')
  			 let $name_service2:=replace($name_service,'Local_PS','')
  			 (:Nombre del servicio 1 en UpperCase:)
 			 let $name_service3:=concat(upper-case(substring($name_service2,1,1)),substring($name_service2,2,string-length($name_service2)))
 			 let $name_space:=concat("http://www.comcel.com.co/",$name_service3,'/')
    		 return
    			 element{expanded-QName($name_space, 'Input_Parameters') }{
    				 for $p in $parametros1/parametro
     					return
         				 element{ $p/nombre/text()}
          						{ $p/valor/node()}
    
   				}
   					 
   			)
   		 else
   		    (      )			 
 		 }</Parametros>
  	  </enr:Input_Parameters>
    
};

declare variable $servicio as xs:string external;
declare variable $parametros1 as element() external;
xf:dynamicDispatcherToEnrutador($servicio,
    $parametros1)