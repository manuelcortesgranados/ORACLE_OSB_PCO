package pe_osb_001;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import javax.xml.ws.BindingType;
import javax.xml.ws.soap.SOAPBinding;

@WebService
@BindingType(SOAPBinding.SOAP12HTTP_BINDING)
public class Calculadora {
    public Calculadora() {
        super();
    }

    @WebMethod
    public int suma(@WebParam(name = "arg0") int operando1, @WebParam(name = "arg1") int operando2){
        return operando1+operando2;
    }
}
