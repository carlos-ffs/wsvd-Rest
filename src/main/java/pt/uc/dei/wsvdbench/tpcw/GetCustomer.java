package pt.uc.dei.wsvdbench.tpcw;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import pt.uc.dei.wsvdbench.tpcw.object.Customer;
import pt.uc.dei.wsvdbench.tpcw.versions.GetCustomer_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetCustomer_VxA;


@Path("GetCustomer")
public class GetCustomer {


    @GET
    @Path("getCustomer_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCustomer_Vx0(@QueryParam("UNAME") String UNAME) {


        return Response.status(Response.Status.OK)
                .entity(new GetCustomer_Vx0().getCustomer(UNAME).getCustomerInJson())
                .build();
    }

    @GET
    @Path("getCustomer_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCustomer_VxA(@QueryParam("UNAME") String UNAME) {

        return Response.status(Response.Status.OK)
                .entity(new GetCustomer_VxA().getCustomer(UNAME).getCustomerInJson())
                .build();
    }
}
