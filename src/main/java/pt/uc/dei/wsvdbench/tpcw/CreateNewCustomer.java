package pt.uc.dei.wsvdbench.tpcw;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;
import javax.xml.ws.RequestWrapper;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import org.glassfish.jersey.process.internal.RequestScoped;
import pt.uc.dei.wsvdbench.tpcw.object.Customer;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx078;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx103;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx113;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx132;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_VxA;


@Path("CreateNewCustomer")
public class CreateNewCustomer {

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx0")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createNewCustomer_Vx0(String cust){

        Customer c = new Gson().fromJson(cust,Customer.class);
        return Response.status(Response.Status.OK)
                .entity(new CreateNewCustomer_Vx0().createNewCustomer(c).getCustomerInJson())
                .build();
    }

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_VxA")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createNewCustomer_VxA(String cust){

        Customer c = new Gson().fromJson(cust,Customer.class);
        return Response.status(Response.Status.OK)
                .entity(new CreateNewCustomer_VxA().createNewCustomer(c).getCustomerInJson())
                .build();
    }



    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx078")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createNewCustomer_Vx078(String cust) {

        Customer c = new Gson().fromJson(cust,Customer.class);
        return Response.status(Response.Status.OK)
                .entity(new CreateNewCustomer_Vx078().createNewCustomer(c).getCustomerInJson())
                .build();
    }

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx103")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createNewCustomer_Vx103(String cust) {

        Customer c = new Gson().fromJson(cust,Customer.class);
        return Response.status(Response.Status.OK)
                .entity(new CreateNewCustomer_Vx103().createNewCustomer(c).getCustomerInJson())
                .build();
    }

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx113")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createNewCustomer_Vx113(String cust) {

        Customer c = new Gson().fromJson(cust,Customer.class);
        return Response.status(Response.Status.OK)
                .entity(new CreateNewCustomer_Vx113().createNewCustomer(c).getCustomerInJson())
                .build();
    }

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx132")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createNewCustomer_Vx132(String cust) {

        Customer c = new Gson().fromJson(cust,Customer.class);
        return Response.status(Response.Status.OK)
                .entity(new CreateNewCustomer_Vx132().createNewCustomer(c).getCustomerInJson())
                .build();
    }
}
