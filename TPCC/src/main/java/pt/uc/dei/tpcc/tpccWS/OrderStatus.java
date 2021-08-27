package pt.uc.dei.tpcc.tpccWS;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.tpcc.tpccWS.object.Order;
import pt.uc.dei.tpcc.tpccWS.versions.*;
import pt.uc.dei.tpcc.util.ErrorConstructor;


@Path("OrderStatus")
public class OrderStatus {

    @GET
    @Path("orderStatusTransaction_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get order status transaction information",
            responses = {
                    @ApiResponse(description = "Order status transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response orderStatusTransaction_Vx0(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("c_id") String c_id,
            @Parameter(required=true) @QueryParam("c_last") String c_last,
            @Parameter(required=true) @QueryParam("c_by_name") boolean c_by_name) {
        return processAll("orderStatusTransaction_Vx0", w_id , d_id,  c_id, c_last,  c_by_name);
    }

    @GET
    @Path("orderStatusTransaction_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get order status transaction information",
            responses = {
                    @ApiResponse(description = "Order status transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response orderStatusTransaction_VxA(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("c_id") String c_id,
            @Parameter(required=true) @QueryParam("c_last") String c_last,
            @Parameter(required=true) @QueryParam("c_by_name") boolean c_by_name) {
        return processAll("orderStatusTransaction_VxA", w_id , d_id,  c_id, c_last,  c_by_name);
    }


    @GET
    @Path("orderStatusTransaction_Vx046")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get order status transaction information",
            responses = {
                    @ApiResponse(description = "Order status transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response orderStatusTransaction_Vx046(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("c_id") String c_id,
            @Parameter(required=true) @QueryParam("c_last") String c_last,
            @Parameter(required=true) @QueryParam("c_by_name") boolean c_by_name) {
        return processAll("orderStatusTransaction_Vx046", w_id , d_id,  c_id, c_last,  c_by_name);
    }

    @GET
    @Path("orderStatusTransaction_Vx066")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get order status transaction information",
            responses = {
                    @ApiResponse(description = "Order status transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response orderStatusTransaction_Vx066(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("c_id") String c_id,
            @Parameter(required=true) @QueryParam("c_last") String c_last,
            @Parameter(required=true) @QueryParam("c_by_name") boolean c_by_name) {
        return processAll("orderStatusTransaction_Vx066", w_id , d_id,  c_id, c_last,  c_by_name);
    }


    @GET
    @Path("orderStatusTransaction_Vx096")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get order status transaction information",
            responses = {
                    @ApiResponse(description = "Order status transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response orderStatusTransaction_Vx096(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("c_id") String c_id,
            @Parameter(required=true) @QueryParam("c_last") String c_last,
            @Parameter(required=true) @QueryParam("c_by_name") boolean c_by_name)  {
        return processAll("orderStatusTransaction_Vx096", w_id , d_id,  c_id, c_last,  c_by_name);
    }


    @GET
    @Path("orderStatusTransaction_Vx122")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get order status transaction information",
            responses = {
                    @ApiResponse(description = "Order status transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response orderStatusTransaction_Vx122(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("c_id") String c_id,
            @Parameter(required=true) @QueryParam("c_last") String c_last,
            @Parameter(required=true) @QueryParam("c_by_name") boolean c_by_name) {
        return processAll("orderStatusTransaction_Vx122", w_id , d_id,  c_id, c_last,  c_by_name);
    }

    @GET
    @Path("orderStatusTransaction_Vx143")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get order status transaction information",
            responses = {
                    @ApiResponse(description = "Order status transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Order.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response orderStatusTransaction_Vx143(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("c_id") String c_id,
            @Parameter(required=true) @QueryParam("c_last") String c_last,
            @Parameter(required=true) @QueryParam("c_by_name") boolean c_by_name) {
        return processAll("orderStatusTransaction_Vx143", w_id , d_id,  c_id, c_last,  c_by_name);
    }

    private Response processAll(String serviceName, String w_id , String d_id,  String c_id, String c_last, boolean c_by_name){
        Order order = null;
        try{
            if(serviceName.equals("orderStatusTransaction_Vx0"))
                order = new OrderStatus_Vx0().orderStatusTransaction(w_id, d_id, c_id, c_last, c_by_name);
            else if(serviceName.equals("orderStatusTransaction_VxA"))
                order = new OrderStatus_VxA().orderStatusTransaction(w_id, d_id, c_id, c_last, c_by_name);
            else if(serviceName.equals("orderStatusTransaction_Vx046"))
                order = new OrderStatus_Vx046().orderStatusTransaction(w_id, d_id, c_id, c_last, c_by_name);
            else if(serviceName.equals("orderStatusTransaction_Vx066"))
                order = new OrderStatus_Vx066().orderStatusTransaction(w_id, d_id, c_id, c_last, c_by_name);
            else if(serviceName.equals("orderStatusTransaction_Vx096"))
                order = new OrderStatus_Vx096().orderStatusTransaction(w_id, d_id, c_id, c_last, c_by_name);
            else if(serviceName.equals("orderStatusTransaction_Vx122"))
                order = new OrderStatus_Vx122().orderStatusTransaction(w_id, d_id, c_id, c_last, c_by_name);
            else if(serviceName.equals("orderStatusTransaction_Vx143"))
                order = new OrderStatus_Vx143().orderStatusTransaction(w_id, d_id, c_id, c_last, c_by_name);
            else
                order = null;
        }
        catch (Exception e){

            String error = new ErrorConstructor(150, e, "Something went bad in the server, error: ").getError();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity(error)
                    .build();
        }

        if(order == null){
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity("No response available for the current request, " +
                            "*Order* object could not be built, something internally went bad.")
                    .build();
        }
        else{
            try{
                String json = order.getOrderInJson();
                return Response.status(Response.Status.OK)
                        .entity(json)
                        .build();
            }
            catch (Exception e){
                String error = new ErrorConstructor(150, e,
                        "When converting object to json something went wrong, error:").getError();
                return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                        .entity(error)
                        .build();
            }
        }
    }
}
