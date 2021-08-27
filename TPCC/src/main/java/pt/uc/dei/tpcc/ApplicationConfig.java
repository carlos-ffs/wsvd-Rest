package pt.uc.dei.tpcc;

import io.swagger.jaxrs.config.BeanConfig;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;


@ApplicationPath("/tpcc")
public class ApplicationConfig extends Application{
    // intentionally empty

    public ApplicationConfig() {

        BeanConfig beanConfig = new BeanConfig();
        beanConfig.setVersion("1.0");
        beanConfig.setTitle("My api app");
        beanConfig.setSchemes(new String[]{"http"});
        beanConfig.setHost("localhost:8080");
        beanConfig.setBasePath("/tpcc");
        beanConfig.setResourcePackage("pt.uc.dei.tpcc");
        beanConfig.setScan(true);
        //beanConfig.scanAndRead();
    }

    @Override
    public Set<Class<?>> getClasses() {


        Set<Class<?>> resources = new HashSet();

        resources.add(pt.uc.dei.tpcc.ApplicationConfig.class);
        resources.add(pt.uc.dei.tpcc.tpccWS.Delivery.class);
        resources.add(pt.uc.dei.tpcc.tpccWS.NewOrder.class);
        resources.add(pt.uc.dei.tpcc.tpccWS.OrderStatus.class);
        resources.add(pt.uc.dei.tpcc.tpccWS.Payment.class);
        resources.add(pt.uc.dei.tpcc.tpccWS.StockLevel.class);

        resources.add(io.swagger.jaxrs.listing.ApiListingResource.class);
        resources.add(io.swagger.jaxrs.listing.SwaggerSerializers.class);
        return resources;
    }

}
