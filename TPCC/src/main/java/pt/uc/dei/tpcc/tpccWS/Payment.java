package pt.uc.dei.tpcc.tpccWS;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.tpcc.tpccWS.object.*;
import pt.uc.dei.tpcc.tpccWS.versions.*;
import pt.uc.dei.tpcc.util.ErrorConstructor;


@Path("Payment")
public class Payment {

    @GET
    @Path("paymentTransaction_Vx0")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx0(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx0");
    }


    @GET
    @Path("paymentTransaction_VxA")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_VxA(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_VxA");
    }


    @GET
    @Path("paymentTransaction_Vx043")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx043(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx043");
    }

    @GET
    @Path("paymentTransaction_Vx057")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx057(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx057");
    }

    @GET
    @Path("paymentTransaction_Vx078")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx078(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx078");
    }

    @GET
    @Path("paymentTransaction_Vx091")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx091(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx091");
    }

    @GET
    @Path("paymentTransaction_Vx115")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx115(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx115");
    }

    @GET
    @Path("paymentTransaction_Vx136")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx136(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx136");
    }

    @GET
    @Path("paymentTransaction_Vx177")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx177(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx177");
    }

    @GET
    @Path("paymentTransaction_Vx212")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx212(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input){
        return processAll(input,"paymentTransaction_Vx212");
    }

    @GET
    @Path("paymentTransaction_Vx241")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx241(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input){
        return processAll(input,"paymentTransaction_Vx241");
    }

    @GET
    @Path("paymentTransaction_Vx257")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx257(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx257");
    }

    @GET
    @Path("paymentTransaction_Vx290")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get Payment transaction information",
            responses = {
                    @ApiResponse(description = "Payment transaction response in json",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = PaymentResult.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response paymentTransaction_Vx290(
            @RequestBody(description = "Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = PaymentAux.class))) String input) {
        return processAll(input,"paymentTransaction_Vx290");
    }


    private Response processAll(String input, String serviceName){


        PaymentAux praux;
        try{
            praux = new Gson().fromJson(input,PaymentAux.class);
        }
        catch (Exception e){
            String error = new ErrorConstructor(150, e , "Json in request body malformed, error: ").getError();
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(error)
                    .build();
        }

        PaymentResult paymentResult = null;
        try{

            if(serviceName.equals("paymentTransaction_Vx0"))
                paymentResult =  new Payment_Vx0().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_VxA"))
                paymentResult =  new Payment_VxA().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx043"))
                paymentResult =  new Payment_Vx043().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx057"))
                paymentResult =  new Payment_Vx057().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx078"))
                paymentResult =  new Payment_Vx078().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx091"))
                paymentResult =  new Payment_Vx091().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx115"))
                paymentResult =  new Payment_Vx115().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx136"))
                paymentResult =  new Payment_Vx136().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx177"))
                paymentResult =  new Payment_Vx177().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx212"))
                paymentResult =  new Payment_Vx212().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx241"))
                paymentResult =  new Payment_Vx241().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx257"))
                paymentResult =  new Payment_Vx257().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else if(serviceName.equals("paymentTransaction_Vx290"))
                paymentResult =  new Payment_Vx290().paymentTransaction(praux.w_id, praux.c_w_id, praux.h_amount
                        , praux.d_id, praux.c_d_id, praux.c_id, praux.c_last, praux.c_by_name);
            else
                paymentResult = null;
        }
        catch (Exception e){
            String error = new ErrorConstructor(150, e , "ERROR: " ).getError();
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity(error)
                    .build();
        }

        if(paymentResult == null){
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity("No response available for the current request, *PaymentResult* object could not be built, something internally went bad.")
                    .build();
        }
        else{
            try{
                String json = paymentResult.getPaymentResultInJson();
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
