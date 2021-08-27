package pt.uc.dei.wsvdAPP.tpcapp;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdAPP.tpcapp.input.NewProductsInput;
import pt.uc.dei.wsvdAPP.tpcapp.output.NewProductsOutput;
import pt.uc.dei.wsvdAPP.tpcapp.versions.NewProducts_Vx0;
import pt.uc.dei.wsvdAPP.tpcapp.versions.NewProducts_VxA;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


@Path("NewProducts")
public class NewProducts {


    @GET
    @Path("newProducts_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets a list with the new Products",
            responses = {
                    @ApiResponse(description = "List of new Products",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = NewProductsOutput.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newProducts_Vx0(
            @Parameter(required=true) @QueryParam("cutOffDuration")   Long    cutOffDuration  ,
            @Parameter(required=true) @QueryParam("subjectString")    String  subjectString   ,
            @Parameter(required=true) @QueryParam("itemLimit")        Long    itemLimit       ) throws Exception {

        NewProductsInput input = new NewProductsInput();
        input.setCutOffDuration(cutOffDuration);
        input.setSubjectString(subjectString);
        input.setItemLimit(itemLimit);


        NewProductsOutput npdoutput ;
        try{
            npdoutput =  new NewProducts_Vx0().process(input);
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
                .entity(npdoutput.getNewProductsOutputInJson())
                .build();
    }

    @GET
    @Path("newProducts_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Gets a list with the new Products",
            responses = {
                    @ApiResponse(description = "List of new Products",responseCode = "200",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = NewProductsOutput.class))),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response newProducts_VxA(
            @Parameter(required=true) @QueryParam("cutOffDuration")   Long    cutOffDuration  ,
            @Parameter(required=true) @QueryParam("subjectString")    String  subjectString   ,
            @Parameter(required=true) @QueryParam("itemLimit")        Long    itemLimit       ) throws Exception {


        NewProductsInput input = new NewProductsInput();
        input.setCutOffDuration(cutOffDuration);
        input.setSubjectString(subjectString);
        input.setItemLimit(itemLimit);


        NewProductsOutput npdoutput ;
        try{
            npdoutput =  new NewProducts_VxA().process(input);
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
                .entity(npdoutput.getNewProductsOutputInJson())
                .build();
    }
}
