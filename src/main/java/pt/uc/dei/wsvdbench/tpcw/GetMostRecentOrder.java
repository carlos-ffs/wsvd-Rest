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

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdbench.tpcw.object.Customer;
import pt.uc.dei.wsvdbench.tpcw.object.Order;
import pt.uc.dei.wsvdbench.tpcw.versions.GetCustomer_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetMostRecentOrder_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetMostRecentOrder_VxA;

@Path("GetMostRecentOrder")
public class GetMostRecentOrder {


    @GET
    @Path("getMostRecentOrder_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get most recent order by customer name (c_uname in database) where customer name is equal to String c_uname (input)",
            responses = {
                    @ApiResponse(responseCode = "200",description = "The order object in json",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "404", description = "No recent order found"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response getMostRecentOrder_Vx0(@Parameter(required = true) @QueryParam("c_uname") String c_uname) {

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
    @Operation(summary = "Get most recent order by customer name (c_uname in database) where customer name is equal to String c_uname (input)",
            responses = {
                    @ApiResponse(responseCode = "200",description = "The order object in json",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "404", description = "No recent order found"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response getMostRecentOrder_VxA(@Parameter(required = true) @QueryParam("c_uname") String c_uname) {

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
