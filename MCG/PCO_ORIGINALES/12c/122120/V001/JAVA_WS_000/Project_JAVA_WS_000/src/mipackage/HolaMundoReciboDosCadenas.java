package mipackage;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService
public class HolaMundoReciboDosCadenas {
    public HolaMundoReciboDosCadenas() {
        super();
    }

    @WebMethod
    public String holaMundo(@WebParam(name = "nombre") String nombre, @WebParam(name = "apellido") String apellido){
        return nombre+"-"+apellido;
    }
}
