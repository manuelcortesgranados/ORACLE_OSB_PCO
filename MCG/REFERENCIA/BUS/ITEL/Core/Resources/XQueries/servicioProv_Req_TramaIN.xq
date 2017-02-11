xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$parametrosTrama" type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProv_Req_TramaIN/";

declare function xf:servicioProv_Req_TramaIN($parametrosTrama as element(*))
    as xs:string {
         if (data($parametrosTrama/METODO) = '100')then
            concat("provision","!","provision","!","100","!",data($parametrosTrama/MIN),"!",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='TMCODE']/VALOR/text()),";",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='SPCODE']/VALOR/text()),";","0","!*")
         else if (data($parametrosTrama/METODO) = '501') then
                 concat("provision","!","provision","!","501","!",data($parametrosTrama/MIN),"!!*") 
               else  if (data($parametrosTrama/METODO) = '400') then
                     concat("provision","!","provision","!","400","!",data($parametrosTrama/MIN),"!",
                     data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='COMENTARIO']/VALOR/text()),";",
                     data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='HOSTID']/VALOR/text()),";",
                     data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='CONSECUTIVO']/VALOR/text()),";",
                     data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='MONTO']/VALOR/text()),";",
                     data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='BONIFICAR']/VALOR/text()),";",
                     data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='VIGENCIA']/VALOR/text()),
                     "!*")
         			else if (data($parametrosTrama/METODO) = '201') then
                 		concat("provision","!","provision","!","201","!",data($parametrosTrama/MIN),"!!*")                 	
                	else if (data($parametrosTrama/METODO) = '301') then
                 		concat("provision","!","provision","!","301","!",data($parametrosTrama/MIN),"!",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='HOSTID']/VALOR/text()),";0!*") 
                	else if (data($parametrosTrama/METODO) = '302') then
                 		concat("provision","!","provision","!","302","!",data($parametrosTrama/MIN),"!",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='HOSTID']/VALOR/text()),";0!*") 
					else if (data($parametrosTrama/METODO) = '303') then
                 		concat("provision","!","provision","!","303","!",data($parametrosTrama/MIN),"!!*")
                 	else if (data($parametrosTrama/METODO) = '304') then
                 		concat("provision","!","provision","!","304","!",data($parametrosTrama/MIN),"!0;0;",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='HOSTID']/VALOR/text()),"!*") 
                 	else if (data($parametrosTrama/METODO) = '306') then
                 		concat("provision","!","provision","!","306","!",data($parametrosTrama/MIN),"!",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR/text()),"!*")                  		                  		 
                 	else if (data($parametrosTrama/METODO) = '600') then
                 		concat("provision","!","provision","!","600","!",data($parametrosTrama/MIN),"!",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='MINDESTINO']/VALOR/text()),"!*")
                	else if (data($parametrosTrama/METODO) = '601') then
                 		concat("provision","!","provision","!","601","!",data($parametrosTrama/MIN),"!0;",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='TMCODE']/VALOR/text()),";",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='SPCODE']/VALOR/text()),"!*")
                 	else if (data($parametrosTrama/METODO) = '602') then
                 		concat("provision","!","provision","!","602","!",data($parametrosTrama/MIN),"!",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='FLAG_FRAUDE']/VALOR/text()),";",data($parametrosTrama/PARAMETROSPROVISION/PARAMETRO[NOMBRE='FLAG_BLOQUEO']/VALOR/text()),"!*")                  		                  		                  		                  		                  		 
                   	else
                      	("")
};

declare variable $parametrosTrama as element(*) external;

xf:servicioProv_Req_TramaIN($parametrosTrama)