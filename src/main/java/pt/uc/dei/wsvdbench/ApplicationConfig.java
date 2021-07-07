package pt.uc.dei.wsvdbench;
import io.swagger.jaxrs.config.BeanConfig;
import pt.uc.dei.wsvdbench.util.Logging;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;


@ApplicationPath("/rest")
public class ApplicationConfig extends Application{
    // intentionally empty

    public ApplicationConfig() {

        BeanConfig beanConfig = new BeanConfig();
        beanConfig.setVersion("1.0");
        beanConfig.setTitle("My api");
        beanConfig.setSchemes(new String[]{"http"});
        beanConfig.setHost("localhost:8080");
        beanConfig.setBasePath("/rest");
        beanConfig.setResourcePackage("pt.uc.dei.wsvdbench");
        beanConfig.setScan(true);
        //beanConfig.scanAndRead();
    }

    @Override
    public Set<Class<?>> getClasses() {
        // set your resources here
        Set<Class<?>> resources = new HashSet();

        //resources.add(FirstResource.class);
        //resources.add(SecondResource.class);
        //...

        resources.add(pt.uc.dei.wsvdbench.ApplicationConfig.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.AdminUpdate.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.CreateNewCustomer.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.CreateShoppingCart.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.DoAuthorSearch.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.DoSubjectSearch.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.GetBestSellers.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.GetCustomer.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.GetMostRecentOrder.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.GetNewProducts.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.GetPassword.class);
        resources.add(pt.uc.dei.wsvdbench.tpcw.GetUsername.class);

        resources.add(io.swagger.jaxrs.listing.ApiListingResource.class);
        resources.add(io.swagger.jaxrs.listing.SwaggerSerializers.class);


        return resources;
    }

}
