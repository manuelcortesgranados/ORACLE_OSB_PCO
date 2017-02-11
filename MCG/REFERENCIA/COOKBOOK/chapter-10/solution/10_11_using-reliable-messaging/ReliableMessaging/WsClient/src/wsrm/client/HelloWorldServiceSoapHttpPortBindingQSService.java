package wsrm.client;

import java.io.File;

import java.net.MalformedURLException;
import java.net.URL;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;
// !DO NOT EDIT THIS FILE!
// This source file is generated by Oracle tools
// Contents may be subject to change
// For reporting problems, use the following
// Version = Oracle WebServices (11.1.1.0.0, build 101221.1153.15811)

@WebServiceClient(wsdlLocation="http://localhost:7001/using-reliable-msg-with-ws-transport/Provider?wsdl",
  targetNamespace="http://wsrm.osbbook", name="HelloWorldServiceSoapHttpPortBindingQSService")
public class HelloWorldServiceSoapHttpPortBindingQSService
  extends Service
{
  private static URL wsdlLocationURL;

  private static Logger logger;
  static
  {
    try
    {
      logger = Logger.getLogger("wsrm.client.HelloWorldServiceSoapHttpPortBindingQSService");
      URL baseUrl =
        HelloWorldServiceSoapHttpPortBindingQSService.class.getResource(".");
      if (baseUrl == null)
      {
        wsdlLocationURL =
            HelloWorldServiceSoapHttpPortBindingQSService.class
            .getResource("http://localhost:7001/using-reliable-msg-with-ws-transport/Provider?wsdl");
        if (wsdlLocationURL == null)
        {
          baseUrl = new File(".").toURL();
          wsdlLocationURL =
              new URL(baseUrl, "http://localhost:7001/using-reliable-msg-with-ws-transport/Provider?wsdl");
        }
      }
      else
      {
        if (!baseUrl.getPath().endsWith("/")) {
         baseUrl = new URL(baseUrl, baseUrl.getPath() + "/");
}
        wsdlLocationURL =
            new URL(baseUrl, "http://localhost:7001/using-reliable-msg-with-ws-transport/Provider?wsdl");
      }
    }
    catch (MalformedURLException e)
    {
      logger.log(Level.ALL,
          "Failed to create wsdlLocationURL using http://localhost:7001/using-reliable-msg-with-ws-transport/Provider?wsdl",
          e);
    }
  }

  public HelloWorldServiceSoapHttpPortBindingQSService()
  {
    super(wsdlLocationURL,
          new QName("http://wsrm.osbbook", "HelloWorldServiceSoapHttpPortBindingQSService"));
  }

  public HelloWorldServiceSoapHttpPortBindingQSService(URL wsdlLocation,
                                                       QName serviceName)
  {
    super(wsdlLocation, serviceName);
  }

  @WebEndpoint(name="HelloWorldServiceSoapHttpPortBindingQSPort")
  public wsrm.client.HelloWorldService getHelloWorldServiceSoapHttpPortBindingQSPort()
  {
    return (wsrm.client.HelloWorldService) super.getPort(new QName("http://wsrm.osbbook",
                                                                   "HelloWorldServiceSoapHttpPortBindingQSPort"),
                                                         wsrm.client.HelloWorldService.class);
  }

  @WebEndpoint(name="HelloWorldServiceSoapHttpPortBindingQSPort")
  public wsrm.client.HelloWorldService getHelloWorldServiceSoapHttpPortBindingQSPort(WebServiceFeature... features)
  {
    return (wsrm.client.HelloWorldService) super.getPort(new QName("http://wsrm.osbbook",
                                                                   "HelloWorldServiceSoapHttpPortBindingQSPort"),
                                                         wsrm.client.HelloWorldService.class,
                                                         features);
  }
}