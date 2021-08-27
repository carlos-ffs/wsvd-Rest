package pt.uc.dei.wsvdAPP.tpcapp;

import com.google.gson.Gson;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdAPP.tpcapp.input.ProductDetailInput;
import pt.uc.dei.wsvdAPP.tpcapp.output.ProductDetailOutput;
import pt.uc.dei.wsvdAPP.tpcapp.versions.ProductDetail_Vx0;
import pt.uc.dei.wsvdAPP.tpcapp.versions.ProductDetail_VxA;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


@Path("ProductDetail")
public class ProductDetail {

    @POST
    @Path("productDetail_Vx0")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets a list with the detailed Products, these products have ids equals to the ones in the request json",
            responses = {
                    @ApiResponse(description = "List of detailed Products",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = ProductDetailOutput.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
                    }
    )
    public Response productDetail_Vx0(
            @RequestBody(description = "Product Detail input in json",
                    required = true,
                    content = @Content(schema = @Schema(implementation = ProductDetailInput.class))) String input) throws Exception {

        ProductDetailInput pdinput;

        try{
            pdinput = new Gson().fromJson(input,ProductDetailInput.class);
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

        ProductDetailOutput pdoutput;
        try{
            pdoutput = new ProductDetail_Vx0().process(pdinput);
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
                .entity(pdoutput.getProductDetailOutputInJson())
                .build();



    }

    @POST
    @Path("productDetail_VxA")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets a list with the detailed Products, these products have ids equals to the ones in the request json",
            responses = {
                    @ApiResponse(description = "List of detailed Products",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = ProductDetailOutput.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response productDetail_VxA(@RequestBody(description = "Product Detail input in json",
            required = true,
            content = @Content(schema = @Schema(implementation = ProductDetailInput.class))) String input) throws Exception {

        ProductDetailInput pdinput;

        try{
            pdinput = new Gson().fromJson(input,ProductDetailInput.class);
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

        ProductDetailOutput pdoutput;
        try{
            pdoutput = new ProductDetail_VxA().process(pdinput);
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
                .entity(pdoutput.getProductDetailOutputInJson())
                .build();


    }
}
