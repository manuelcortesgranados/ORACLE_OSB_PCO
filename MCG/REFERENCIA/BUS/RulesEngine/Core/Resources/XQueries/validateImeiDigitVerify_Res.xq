(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_VALIDATEIMEIDIGITVERIFY.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_VALIDATEIMEIDIGITVERIFY.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/validateImeiDigitVerify";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/validateImeiDigitVerify_Res/";

declare function xf:validateImeiDigitVerify_Res($validateMessage as xs:string,
    $input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                <product>
                    {
                        for $id in $input_Parameters1/product/id
                        return
                            <id>{ data($id) }</id>
                    }
                    {
                        for $code in $input_Parameters1/product/code
                        return
                            <code>{ data($code) }</code>
                    }
                    {
                        for $description in $input_Parameters1/product/description
                        return
                            <description>{ data($description) }</description>
                    }
                    {
                        for $number in $input_Parameters1/product/number
                        return
                            <number>{ data($number) }</number>
                    }
                    {
                        for $usage in $input_Parameters1/product/usage
                        return
                            <usage>{ $usage/@* , $usage/node() }</usage>
                    }
                    {
                        for $status in $input_Parameters1/product/status
                        return
                            <status>
                                {
                                    for $id in $status/id
                                    return
                                        <id>{ data($id) }</id>
                                }
                                {
                                    for $code in $status/code
                                    return
                                        <code>{ data($code) }</code>
                                }
                                {
	                				for $description in  $input_Parameters1/product/status/description
	                                		return
	                                				if ($validateMessage="DIGITO DE VERIFICACION VALIDO")
														then <description>{"true"}</description>
															else <description>{"false"}</description>
                   				}
                                {
                                    for $status0 in $status/status
                                    return
                                        <status>{ $status0/@* , $status0/node() }</status>
                                }
                                {
                                    for $daysStatus in $status/daysStatus
                                    return
                                        <daysStatus>{ data($daysStatus) }</daysStatus>
                                }
                            </status>
                    }
                    {
                        for $platformStatus in $input_Parameters1/product/platformStatus
                        return
                            <platformStatus>{ $platformStatus/@* , $platformStatus/node() }</platformStatus>
                    }
                    {
                        for $type in $input_Parameters1/product/type
                        return
                            <type>{ $type/@* , $type/node() }</type>
                    }
                    <validationMessage>{ $validateMessage }</validationMessage>
                    {
                        for $classification in $input_Parameters1/product/classification
                        return
                            <classification>{ $classification/@* , $classification/node() }</classification>
                    }
                    {
                        for $stockInventory in $input_Parameters1/product/stockInventory
                        return
                            <stockInventory>{ $stockInventory/@* , $stockInventory/node() }</stockInventory>
                    }
                    {
                        for $supplier in $input_Parameters1/product/supplier
                        return
                            <supplier>{ $supplier/@* , $supplier/node() }</supplier>
                    }
                    {
                        for $productDiffInfo in $input_Parameters1/product/productDiffInfo
                        return
                            <productDiffInfo>{ $productDiffInfo/@* , $productDiffInfo/node() }</productDiffInfo>
                    }
                </product>
            </message>
            <description>Operacion ejecutada</description>
        </ns3:WS_Result>
};

declare variable $validateMessage as xs:string external;
declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:validateImeiDigitVerify_Res($validateMessage,
    $input_Parameters1)
