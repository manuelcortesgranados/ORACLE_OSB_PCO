xquery version "1.0" encoding "Cp1252";

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/protocoloValido/";

declare function xf:protocoloValido($trama as xs:string)
	as xs:integer {
		let $campos := fn:tokenize($trama, '!')
		let $numeroCampos := fn:count($campos)
		return
			if ($numeroCampos = 6 and $campos[$numeroCampos] = "*") then
				if ($campos[1] != "" and $campos[2] != "" and string(number($campos[3])) != 'NaN' and not(matches($campos[3],"[.+-]"))  and $campos[4] != "") then
					1
				else
					0
			else
				0
};

declare variable $trama as xs:string external;

xf:protocoloValido($trama)