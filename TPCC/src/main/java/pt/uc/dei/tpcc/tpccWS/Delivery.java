package pt.uc.dei.tpcc.tpccWS;

import javax.jws.WebMethod;
import javax.jws.WebParam;
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
import pt.uc.dei.tpcc.tpccWS.object.DeliveryResult;
import pt.uc.dei.tpcc.tpccWS.versions.*;
import pt.uc.dei.tpcc.util.ErrorConstructor;


@Path("Delivery")
public class Delivery {

    @GET
    @Path("deliveryTransaction_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets Delivery Result",
            responses = {
                    @ApiResponse(description = "Delivery Result",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = DeliveryResult.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response deliveryTransaction_Vx0(
            @Parameter(required=true) @QueryParam("w_id")         String w_id,
            @Parameter(required=true) @QueryParam("o_carrier_id") String o_carrier_id) {
        return processAll("deliveryTransaction_Vx0", w_id, o_carrier_id);
    }

    @GET
    @Path("deliveryTransaction_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets Delivery Result",
            responses = {
                    @ApiResponse(description = "Delivery Result",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = DeliveryResult.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response deliveryTransaction_VxA(
            @Parameter(required=true) @QueryParam("w_id")         String w_id,
            @Parameter(required=true) @QueryParam("o_carrier_id") String o_carrier_id) {
        return processAll("deliveryTransaction_VxA", w_id, o_carrier_id);
    }

    @GET
    @Path("deliveryTransaction_Vx051")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets Delivery Result",
            responses = {
                    @ApiResponse(description = "Delivery Result",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = DeliveryResult.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response deliveryTransaction_Vx051(
            @Parameter(required=true) @QueryParam("w_id")         String w_id,
            @Parameter(required=true) @QueryParam("o_carrier_id") String o_carrier_id){
        return processAll("deliveryTransaction_Vx051", w_id, o_carrier_id);
    }

    @GET
    @Path("deliveryTransaction_Vx075")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets Delivery Result",
            responses = {
                    @ApiResponse(description = "Delivery Result",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = DeliveryResult.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response deliveryTransaction_Vx075(
            @Parameter(required=true) @QueryParam("w_id")         String w_id,
            @Parameter(required=true) @QueryParam("o_carrier_id") String o_carrier_id) {
        return processAll("deliveryTransaction_Vx075", w_id, o_carrier_id);
    }

    @GET
    @Path("deliveryTransaction_Vx099")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets Delivery Result",
            responses = {
                    @ApiResponse(description = "Delivery Result",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = DeliveryResult.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response deliveryTransaction_Vx099(
            @Parameter(required=true) @QueryParam("w_id")         String w_id,
            @Parameter(required=true) @QueryParam("o_carrier_id") String o_carrier_id){
        return processAll("deliveryTransaction_Vx099", w_id, o_carrier_id);
    }

    @GET
    @Path("deliveryTransaction_Vx123")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets Delivery Result",
            responses = {
                    @ApiResponse(description = "Delivery Result",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = DeliveryResult.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response deliveryTransaction_Vx123(
            @Parameter(required=true) @QueryParam("w_id")         String w_id,
            @Parameter(required=true) @QueryParam("o_carrier_id") String o_carrier_id) {
        return processAll("deliveryTransaction_Vx123", w_id, o_carrier_id);
    }

    @GET
    @Path("deliveryTransaction_Vx138")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets Delivery Result",
            responses = {
                    @ApiResponse(description = "Delivery Result",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = DeliveryResult.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response deliveryTransaction_Vx138(
            @Parameter(required=true) @QueryParam("w_id")         String w_id,
            @Parameter(required=true) @QueryParam("o_carrier_id") String o_carrier_id) {
        return processAll("deliveryTransaction_Vx138", w_id, o_carrier_id);
    }

    @GET
    @Path("deliveryTransaction_Vx154")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets Delivery Result",
            responses = {
                    @ApiResponse(description = "Delivery Result",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = DeliveryResult.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response deliveryTransaction_Vx154(
            @Parameter(required=true) @QueryParam("w_id")         String w_id,
            @Parameter(required=true) @QueryParam("o_carrier_id") String o_carrier_id) {
        return processAll("deliveryTransaction_Vx154", w_id, o_carrier_id);
    }

    @GET
    @Path("deliveryTransaction_Vx176")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets Delivery Result",
            responses = {
                    @ApiResponse(description = "Delivery Result",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = DeliveryResult.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response deliveryTransaction_Vx176(
            @Parameter(required=true) @QueryParam("w_id")         String w_id,
            @Parameter(required=true) @QueryParam("o_carrier_id") String o_carrier_id) {
        return processAll("deliveryTransaction_Vx176", w_id, o_carrier_id);
    }

    private Response processAll(String serviceName, String w_id, String o_carrier_id){
        DeliveryResult dr = null;
        try{
            if(serviceName.equals("deliveryTransaction_Vx0"))
                dr = new Delivery_Vx0().deliveryTransaction(w_id, o_carrier_id);
            else if(serviceName.equals("deliveryTransaction_VxA"))
                dr = new Delivery_VxA().deliveryTransaction(w_id, o_carrier_id);
            else if(serviceName.equals("deliveryTransaction_Vx051"))
                dr = new Delivery_Vx051().deliveryTransaction(w_id, o_carrier_id);
            else if(serviceName.equals("deliveryTransaction_Vx075"))
                dr = new Delivery_Vx075().deliveryTransaction(w_id, o_carrier_id);
            else if(serviceName.equals("deliveryTransaction_Vx099"))
                dr = new Delivery_Vx099().deliveryTransaction(w_id, o_carrier_id);
            else if(serviceName.equals("deliveryTransaction_Vx123"))
                dr = new Delivery_Vx123().deliveryTransaction(w_id, o_carrier_id);
            else if(serviceName.equals("deliveryTransaction_Vx138"))
                dr = new Delivery_Vx138().deliveryTransaction(w_id, o_carrier_id);
            else if(serviceName.equals("deliveryTransaction_Vx154"))
                dr = new Delivery_Vx154().deliveryTransaction(w_id, o_carrier_id);
            else if(serviceName.equals("deliveryTransaction_Vx176"))
                dr = new Delivery_Vx176().deliveryTransaction(w_id, o_carrier_id);
            else
                dr = null;
        }
        catch (Exception e){

            String error = new ErrorConstructor(150, e, "Something went bad in the server, error:").getError();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity(error)
                    .build();
        }

        if(dr == null){
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity("No response available for the current request, " +
                            "*Delivery Result* object could not be built, something internally went bad.")
                    .build();
        }
        else{
            try{
                String json = dr.getDeliveryResultInJson();
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
