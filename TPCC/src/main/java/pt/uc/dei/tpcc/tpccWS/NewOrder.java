package pt.uc.dei.tpcc.tpccWS;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.tpcc.tpccWS.object.NewOrderTransactionAux;
import pt.uc.dei.tpcc.tpccWS.object.ShortOrder;
import pt.uc.dei.tpcc.tpccWS.versions.NewOrder_Vx0;
import pt.uc.dei.tpcc.tpccWS.versions.NewOrder_Vx056;
import pt.uc.dei.tpcc.tpccWS.versions.NewOrder_Vx081;
import pt.uc.dei.tpcc.tpccWS.versions.NewOrder_Vx103;
import pt.uc.dei.tpcc.tpccWS.versions.NewOrder_Vx119;
import pt.uc.dei.tpcc.tpccWS.versions.NewOrder_Vx144;
import pt.uc.dei.tpcc.tpccWS.versions.NewOrder_VxA;
import pt.uc.dei.tpcc.util.ErrorConstructor;

@Path("NewOrder")
public class NewOrder {

    @POST
    @Path("newOrderTransaction_Vx0")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Creates new order transaction",
            responses = {
                    @ApiResponse(description = "New order transaction created",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = ShortOrder.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newOrderTransaction_Vx0(
            @RequestBody(description = "Product Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = NewOrderTransactionAux.class))) String input) {
        return processAll( "newOrderTransaction_Vx0", input);
    }


    @POST
    @Path("newOrderTransaction_VxA")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Creates new order transaction",
            responses = {
                    @ApiResponse(description = "New order transaction created",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = ShortOrder.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newOrderTransaction_VxA(
            @RequestBody(description = "Product Detail input in json",
            required = true,
            content =
            @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = NewOrderTransactionAux.class))) String input){
        return processAll( "newOrderTransaction_VxA", input);
    }


    @POST
    @Path("newOrderTransaction_Vx056")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Creates new order transaction",
            responses = {
                    @ApiResponse(description = "New order transaction created",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = ShortOrder.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newOrderTransaction_Vx056(
            @RequestBody(description = "Product Detail input in json",
            required = true,
            content =
            @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = NewOrderTransactionAux.class))) String input) {
        return processAll( "newOrderTransaction_Vx056", input);
    }


    @POST
    @Path("newOrderTransaction_Vx081")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Creates new order transaction",
            responses = {
                    @ApiResponse(description = "New order transaction created",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = ShortOrder.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newOrderTransaction_Vx081(
            @RequestBody(description = "Product Detail input in json",
            required = true,
            content =
            @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = NewOrderTransactionAux.class))) String input) {
        return processAll( "newOrderTransaction_Vx081", input);
    }


    @POST
    @Path("newOrderTransaction_Vx103")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Creates new order transaction",
            responses = {
                    @ApiResponse(description = "New order transaction created",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = ShortOrder.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newOrderTransaction_Vx103(
            @RequestBody(description = "Product Detail input in json",
            required = true,
            content =
            @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = NewOrderTransactionAux.class))) String input) {
        return processAll( "newOrderTransaction_Vx103", input);
    }


    @POST
    @Path("newOrderTransaction_Vx119")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Creates new order transaction",
            responses = {
                    @ApiResponse(description = "New order transaction created",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = ShortOrder.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newOrderTransaction_Vx119(
            @RequestBody(description = "Product Detail input in json",
            required = true,
            content =
            @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = NewOrderTransactionAux.class))) String input) {
        return processAll( "newOrderTransaction_Vx119", input);
    }


    @POST
    @Path("newOrderTransaction_Vx144")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Creates new order transaction",
            responses = {
                    @ApiResponse(description = "New order transaction created",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = ShortOrder.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newOrderTransaction_Vx144( @RequestBody(description = "Product Detail input in json",
            required = true,
            content =
            @Content(
                    mediaType = "application/json",
                    schema = @Schema(implementation = NewOrderTransactionAux.class))) String input) {
        return processAll( "newOrderTransaction_Vx144", input);
    }

    private Response processAll(String serviceName, String input){
        NewOrderTransactionAux ntaux;
        try{
            ntaux = new Gson().fromJson(input,NewOrderTransactionAux.class);
        }
        catch (Exception e){
            String error = new ErrorConstructor(150, e , "Json in request body malformed, error: ").getError();
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(error)
                    .build();
        }

        ShortOrder shortOrder = null;
        try{
            if(serviceName.equals("newOrderTransaction_Vx0"))
                shortOrder = new NewOrder_Vx0().newOrderTransaction(
                        ntaux.w_id, ntaux.d_id, ntaux.c_id, ntaux.o_ol_cnt, ntaux.o_all_local
                        , ntaux.itemIDs.longList, ntaux.supplierWarehouseIDs.longList, ntaux.orderQuantities.longList);
            else if(serviceName.equals("newOrderTransaction_VxA"))
                shortOrder = new NewOrder_VxA().newOrderTransaction(
                        ntaux.w_id, ntaux.d_id, ntaux.c_id, ntaux.o_ol_cnt, ntaux.o_all_local
                        , ntaux.itemIDs.longList, ntaux.supplierWarehouseIDs.longList, ntaux.orderQuantities.longList);
            else if(serviceName.equals("newOrderTransaction_Vx056"))
                shortOrder = new NewOrder_Vx056().newOrderTransaction(
                        ntaux.w_id, ntaux.d_id, ntaux.c_id, ntaux.o_ol_cnt, ntaux.o_all_local
                        , ntaux.itemIDs.longList, ntaux.supplierWarehouseIDs.longList, ntaux.orderQuantities.longList);
            else if(serviceName.equals("newOrderTransaction_Vx081"))
                shortOrder = new NewOrder_Vx081().newOrderTransaction(
                        ntaux.w_id, ntaux.d_id, ntaux.c_id, ntaux.o_ol_cnt, ntaux.o_all_local
                        , ntaux.itemIDs.longList, ntaux.supplierWarehouseIDs.longList, ntaux.orderQuantities.longList);
            else if(serviceName.equals("newOrderTransaction_Vx103"))
                shortOrder = new NewOrder_Vx103().newOrderTransaction(
                        ntaux.w_id, ntaux.d_id, ntaux.c_id, ntaux.o_ol_cnt, ntaux.o_all_local
                        , ntaux.itemIDs.longList, ntaux.supplierWarehouseIDs.longList, ntaux.orderQuantities.longList);
            else if(serviceName.equals("newOrderTransaction_Vx119"))
                shortOrder = new NewOrder_Vx119().newOrderTransaction(
                        ntaux.w_id, ntaux.d_id, ntaux.c_id, ntaux.o_ol_cnt, ntaux.o_all_local
                        , ntaux.itemIDs.longList, ntaux.supplierWarehouseIDs.longList, ntaux.orderQuantities.longList);
            else if(serviceName.equals("newOrderTransaction_Vx144"))
                shortOrder = new NewOrder_Vx144().newOrderTransaction(
                    ntaux.w_id, ntaux.d_id, ntaux.c_id, ntaux.o_ol_cnt, ntaux.o_all_local
                    , ntaux.itemIDs.longList, ntaux.supplierWarehouseIDs.longList, ntaux.orderQuantities.longList);
        }
        catch (Exception e){
            String error = new ErrorConstructor(150, e , "ERROR: " ).getError();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity(error)
                    .build();
        }

        if(shortOrder == null){
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity("No response available for the current request, *new Order* object could not be built, something internally went bad.")
                    .build();
        }
        else{
            try{
                String json = shortOrder.getShortOrderInJson();
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
