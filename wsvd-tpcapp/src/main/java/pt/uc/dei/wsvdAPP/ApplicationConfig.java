package pt.uc.dei.wsvdAPP;

import io.swagger.jaxrs.config.BeanConfig;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;


@ApplicationPath("/tpcapp")
public class ApplicationConfig extends Application{
    // intentionally empty

    public ApplicationConfig() {

        BeanConfig beanConfig = new BeanConfig();
        beanConfig.setVersion("1.0");
        beanConfig.setTitle("My api app");
        beanConfig.setSchemes(new String[]{"http"});
        beanConfig.setHost("localhost:8080");
        beanConfig.setBasePath("/tpcapp");
        beanConfig.setResourcePackage("pt.uc.dei.wsvdAPP");
        beanConfig.setScan(true);
        //beanConfig.scanAndRead();
    }

    @Override
    public Set<Class<?>> getClasses() {


        Set<Class<?>> resources = new HashSet();

        resources.add(pt.uc.dei.wsvdAPP.ApplicationConfig.class);
        resources.add(pt.uc.dei.wsvdAPP.tpcapp.ChangePaymentMethod.class);
        resources.add(pt.uc.dei.wsvdAPP.tpcapp.NewCustomer.class);
        resources.add(pt.uc.dei.wsvdAPP.tpcapp.NewProducts.class);
        resources.add(pt.uc.dei.wsvdAPP.tpcapp.ProductDetail.class);

        resources.add(io.swagger.jaxrs.listing.ApiListingResource.class);
        resources.add(io.swagger.jaxrs.listing.SwaggerSerializers.class);
        return resources;
    }

}
