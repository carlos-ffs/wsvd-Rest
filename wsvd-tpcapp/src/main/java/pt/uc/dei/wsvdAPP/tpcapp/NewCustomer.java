package pt.uc.dei.wsvdAPP.tpcapp;

import com.google.gson.Gson;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdAPP.tpcapp.input.NewCustomerInput;
import pt.uc.dei.wsvdAPP.tpcapp.output.NewCustomerOutput;
import pt.uc.dei.wsvdAPP.tpcapp.versions.*;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("NewCustomer")
public class NewCustomer {

    @POST
    @Path("newCustomer_Vx0")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create new customer and returns ID",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Customer was created",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = NewCustomerOutput.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newCustomer_Vx0( @RequestBody(description = "Product Detail input in json",
            required = true,
            content = @Content(mediaType = "application/json", schema = @Schema(implementation = NewCustomerInput.class))) String input) throws Exception {

        NewCustomerInput ncInput;

        try{
            ncInput = new Gson().fromJson(input,NewCustomerInput.class);
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

        NewCustomerOutput ncOutput ;
        try{
            ncOutput =  new NewCustomer_Vx0().process(ncInput);
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

        /* i think ncOutput will never be null*/
        return Response.status(Response.Status.OK)
                .entity(ncOutput.getNewCustomerOutputInJson())
                .build();

    }




    @POST
    @Path("newCustomer_Vx101")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create new customer and returns ID",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Customer was created",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = NewCustomerOutput.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newCustomer_Vx101(
            @RequestBody(description = "Product Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json",schema = @Schema(implementation = NewCustomerInput.class))) String input) throws Exception {

        NewCustomerInput ncInput;

        try{
            ncInput = new Gson().fromJson(input,NewCustomerInput.class);
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

        NewCustomerOutput ncOutput ;
        try{
            ncOutput =  new NewCustomer_Vx101().process(ncInput);
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

        /* i think ncOutput will never be null*/
        return Response.status(Response.Status.OK)
                .entity(ncOutput.getNewCustomerOutputInJson())
                .build();
    }


    @POST
    @Path("newCustomer_Vx138")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create new customer and returns ID",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Customer was created",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = NewCustomerOutput.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newCustomer_Vx138(
            @RequestBody(description = "Product Detail input in json",
            required = true,
            content = @Content(mediaType = "application/json",schema = @Schema(implementation = NewCustomerInput.class))) String input) throws Exception {

        NewCustomerInput ncInput;

        try{
            ncInput = new Gson().fromJson(input,NewCustomerInput.class);
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

        NewCustomerOutput ncOutput ;
        try{
            ncOutput =  new NewCustomer_Vx138().process(ncInput);
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

        /* i think ncOutput will never be null*/
        return Response.status(Response.Status.OK)
                .entity(ncOutput.getNewCustomerOutputInJson())
                .build();
    }



    @POST
    @Path("newCustomer_Vx158")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create new customer and returns ID",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Customer was created",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = NewCustomerOutput.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newCustomer_Vx158( @RequestBody(description = "Product Detail input in json",
            required = true,
            content = @Content(mediaType = "application/json",schema = @Schema(implementation = NewCustomerInput.class))) String input) throws Exception {

        NewCustomerInput ncInput;

        try{
            ncInput = new Gson().fromJson(input,NewCustomerInput.class);
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

        NewCustomerOutput ncOutput ;
        try{
            ncOutput =  new NewCustomer_Vx158().process(ncInput);
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

        /* i think ncOutput will never be null*/
        return Response.status(Response.Status.OK)
                .entity(ncOutput.getNewCustomerOutputInJson())
                .build();

    }



    @POST
    @Path("newCustomer_Vx197")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create new customer and returns ID",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Customer was created",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = NewCustomerOutput.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newCustomer_Vx197(
            @RequestBody(description = "Product Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json",schema = @Schema(implementation = NewCustomerInput.class))) String input) throws Exception {

        NewCustomerInput ncInput;

        try{
            ncInput = new Gson().fromJson(input,NewCustomerInput.class);
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

        NewCustomerOutput ncOutput ;
        try{
            ncOutput =  new NewCustomer_Vx197().process(ncInput);
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

        /* i think ncOutput will never be null*/
        return Response.status(Response.Status.OK)
                .entity(ncOutput.getNewCustomerOutputInJson())
                .build();

    }


    @POST
    @Path("newCustomer_VxA")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create new customer and returns ID",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Customer was created",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = NewCustomerOutput.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newCustomer_VxA(
            @RequestBody(description = "Product Detail input in json",
                    required = true,
                    content = @Content(mediaType = "application/json",schema = @Schema(implementation = NewCustomerInput.class))) String input) throws Exception {

        NewCustomerInput ncInput;

        try{
            ncInput = new Gson().fromJson(input,NewCustomerInput.class);
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

        NewCustomerOutput ncOutput ;
        try{
            ncOutput =  new NewCustomer_VxA().process(ncInput);
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

        /* i think ncOutput will never be null*/
        return Response.status(Response.Status.OK)
                .entity(ncOutput.getNewCustomerOutputInJson())
                .build();
    }
}
