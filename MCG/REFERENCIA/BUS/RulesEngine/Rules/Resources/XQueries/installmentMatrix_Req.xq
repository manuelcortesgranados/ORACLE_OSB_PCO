(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_INSTALLMENTMATRIX.xsd" ::)
(:: pragma bea:global-element-return element="ns6:callFunctionStateless" location="../Schemas/BR_INSTALLMENTMATRIX_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/installmentMatrix";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/InstallmentMatrixFact/";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns6 = "http://xmlns.oracle.com/InstallmentMatrix/InstallmentMatrix_DS_InstallmentMatrix";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/installmentMatrix_Req/";
declare namespace ns7 = "http://xmlns.oracle.com/bpel";

declare function xf:installmentMatrix_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns6:callFunctionStateless) {
        <ns6:callFunctionStateless name = "InstallmentMatrix_DS_InstallmentMatrix">
            <ns6:parameterList>
                <ns0:InstallmentMatrixFactRequest>
                    {
                        for $customer in $input_Parameters1/customer
                        return
                            <customer>{ $customer/@* , $customer/node() }</customer>
                    }
                    {
                        for $zone in $input_Parameters1/zone
                        return
                            <zone>{ $zone/@* , $zone/node() }</zone>
                    }
                </ns0:InstallmentMatrixFactRequest>
            </ns6:parameterList>
        </ns6:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:installmentMatrix_Req($input_Parameters1)
