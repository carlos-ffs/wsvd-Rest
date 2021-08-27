package pt.uc.dei.tpcc.tpccWS;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.tpcc.tpccWS.versions.*;
import pt.uc.dei.tpcc.util.ErrorConstructor;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;


@Path("Payment")
public class StockLevel {

    @GET
    @Path("stockLevelTransaction_Vx0")
    @Operation(summary = "Get Stock Level transaction information",
            responses = {
                    @ApiResponse(description = "Stock Level transaction response in json",responseCode = "200",
                            content = @Content(schema = @Schema(implementation = Long.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response stockLevelTransaction_Vx0(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("threshold") long threshold) {
        return processAll("stockLevelTransaction_Vx0",  w_id,  d_id,  threshold);
    }

    @GET
    @Path("stockLevelTransaction_Vx033")
    @Operation(summary = "Get Stock Level transaction information",
            responses = {
                    @ApiResponse(description = "Stock Level transaction response in json",responseCode = "200",
                            content = @Content(schema = @Schema(implementation = Long.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response stockLevelTransaction_Vx033(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("threshold") long threshold){
        return processAll("stockLevelTransaction_Vx033",  w_id,  d_id,  threshold);
    }

    @GET
    @Path("stockLevelTransaction_Vx057")
    @Operation(summary = "Get Stock Level transaction information",
            responses = {
                    @ApiResponse(description = "Stock Level transaction response in json",responseCode = "200",
                            content = @Content(schema = @Schema(implementation = Long.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response stockLevelTransaction_Vx057(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("threshold") long threshold){
        return processAll("stockLevelTransaction_Vx057",  w_id,  d_id,  threshold);
    }

    @GET
    @Path("stockLevelTransaction_VxA")
    @Operation(summary = "Get Stock Level transaction information",
            responses = {
                    @ApiResponse(description = "Stock Level transaction response in json",responseCode = "200",
                            content = @Content(schema = @Schema(implementation = Long.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response stockLevelTransaction_VxA(
            @Parameter(required=true) @QueryParam("w_id") String w_id,
            @Parameter(required=true) @QueryParam("d_id") String d_id,
            @Parameter(required=true) @QueryParam("threshold") long threshold) {
        return processAll("stockLevelTransaction_VxA",  w_id,  d_id,  threshold);
    }


    private Response processAll(String serviceName, String w_id, String d_id, long threshold){
        long stockLevel = -1;
        try{
            if(serviceName.equals("stockLevelTransaction_Vx0"))
                stockLevel = new StockLevel_Vx0().stockLevelTransaction(w_id, d_id, threshold);
            else if(serviceName.equals("stockLevelTransaction_Vx033"))
                stockLevel = new StockLevel_Vx033().stockLevelTransaction(w_id, d_id, threshold);
            else if(serviceName.equals("stockLevelTransaction_Vx057"))
                stockLevel = new StockLevel_Vx057().stockLevelTransaction(w_id, d_id, threshold);
            else if(serviceName.equals("stockLevelTransaction_VxA"))
                stockLevel = new StockLevel_VxA().stockLevelTransaction(w_id, d_id, threshold);
            else
                stockLevel = -1;
        }
        catch (Exception e){

            String error = new ErrorConstructor(150, e, "Something went bad in the server, error:").getError();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity(error)
                    .build();
        }

        if(stockLevel == -1){
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity("No response available for the current request, " +
                            "couldn't get *Long* variable, something internally went bad.")
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(stockLevel)
                    .build();
        }
    }
}
