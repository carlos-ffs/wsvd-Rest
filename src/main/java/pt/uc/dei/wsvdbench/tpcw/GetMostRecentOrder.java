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

import pt.uc.dei.wsvdbench.tpcw.object.Order;
import pt.uc.dei.wsvdbench.tpcw.versions.GetCustomer_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetMostRecentOrder_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetMostRecentOrder_VxA;

@Path("GetMostRecentOrder")
public class GetMostRecentOrder {


    @GET
    @Path("getMostRecentOrder_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getMostRecentOrder_Vx0(@QueryParam("c_uname") String c_uname) {

        Order ord =  new GetMostRecentOrder_Vx0().getMostRecentOrder(c_uname);

        if(ord == null){
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("No recent order found")
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(ord.getOrderInJson())
                    .build();
        }



    }

    @GET
    @Path("getMostRecentOrder_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getMostRecentOrder_VxA(@QueryParam("c_uname") String c_uname) {

        Order ord =  new GetMostRecentOrder_VxA().getMostRecentOrder(c_uname);

        if(ord == null){
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("No recent order found")
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(ord.getOrderInJson())
                    .build();
        }
    }
}
