package pt.uc.dei.wsvdAPP.tpcapp;

import com.google.gson.Gson;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdAPP.tpcapp.input.ChangePaymentMethodInput;
import pt.uc.dei.wsvdAPP.tpcapp.output.ChangePaymentMethodOutput;
import pt.uc.dei.wsvdAPP.tpcapp.versions.ChangePaymentMethod_Vx0;
import pt.uc.dei.wsvdAPP.tpcapp.versions.ChangePaymentMethod_VxA;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("ChangePaymentMethod")
public class ChangePaymentMethod {


    @POST
    @Path("changePaymentMethod_Vx0")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Change Payment Method and returns current payment method",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Payment Method changed"),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server"),
            }
    )
    public Response changePaymentMethod_Vx0(
            @RequestBody(description = "Product Detail input in json",
                    required = true,
                    content = @Content(schema = @Schema(implementation = ChangePaymentMethodInput.class))) String input) throws Exception {


        ChangePaymentMethodInput cpInput;

        try{
            cpInput = new Gson().fromJson(input,ChangePaymentMethodInput.class);
        }
        catch (Exception e){
            String exp = e.toString();

            if(exp.length() >= 150)
                exp = "Json in request body malformed, error:" + exp.substring(0,150) + "...";
            else
                exp = "Json in request body malformed, error:" + exp + "...";


            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(exp)
                    .build();
        }

        /*if(ncInput == null){
            String response = "Json in request body malformed, error:";
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(response)
                    .build();
        }*/

        ChangePaymentMethodOutput cpOutput;
        try{
            cpOutput =  new ChangePaymentMethod_Vx0().process(cpInput);
        }
        catch (Exception e){
            String exp = e.toString();

            if(exp.length() >= 150)
                exp = exp.substring(0,150) + "...";

            exp = "ERROR: " + exp;
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity(exp)
                    .build();
        }

        /* i think cpOutput will never be null*/
        return Response.status(Response.Status.OK)
                .entity(cpOutput.getChangePaymentMethodOutputInJson())
                .build();
    }


    @POST
    @Path("changePaymentMethod_VxA")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Change Payment Method and returns current payment method",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Payment Method changed"),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server"),
            }
    )
    public Response changePaymentMethod_VxA(
            @RequestBody(description = "Product Detail input in json",
                    required = true,
                    content = @Content(schema = @Schema(implementation = ChangePaymentMethodInput.class))) String input) throws Exception {


        ChangePaymentMethodInput cpInput;

        try{
            cpInput = new Gson().fromJson(input,ChangePaymentMethodInput.class);
        }
        catch (Exception e){
            String exp = e.toString();

            if(exp.length() >= 150)
                exp = "Json in request body malformed, error:" + exp.substring(0,150) + "...";
            else
                exp = "Json in request body malformed, error:" + exp + "...";


            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(exp)
                    .build();
        }

        /*if(ncInput == null){
            String response = "Json in request body malformed, error:";
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(response)
                    .build();
        }*/

        ChangePaymentMethodOutput cpOutput;
        try{
            cpOutput =  new ChangePaymentMethod_VxA().process(cpInput);
        }
        catch (Exception e){
            String exp = e.toString();

            if(exp.length() >= 150)
                exp = exp.substring(0,150) + "...";

            exp = "ERROR: " + exp;
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity(exp)
                    .build();
        }

        /* i think cpOutput will never be null*/
        return Response.status(Response.Status.OK)
                .entity(cpOutput.getChangePaymentMethodOutputInJson())
                .build();
    }
}
