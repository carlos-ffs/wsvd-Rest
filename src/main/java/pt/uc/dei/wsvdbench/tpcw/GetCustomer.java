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

import com.google.gson.JsonObject;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdbench.tpcw.object.Customer;
import pt.uc.dei.wsvdbench.tpcw.versions.GetCustomer_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetCustomer_VxA;


@Path("GetCustomer")
public class GetCustomer {


    @GET
    @Path("getCustomer_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get customer by UNAME",
            responses = {
                    @ApiResponse(description = "The customer",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Customer.class))),
                    @ApiResponse(responseCode = "404", description = "Customer not found")})
    public Response getCustomer_Vx0(@QueryParam("UNAME") String UNAME) {

        Customer c = new GetCustomer_Vx0().getCustomer(UNAME);
        if(c == null){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","Not found");

            return Response.status(Response.Status.NOT_FOUND)
                    .entity(newJson.toString())
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(new GetCustomer_Vx0().getCustomer(UNAME).getCustomerInJson())
                    .build();
        }

    }

    @GET
    @Path("getCustomer_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Get customer by UNAME",
            responses = {
                    @ApiResponse(description = "The customer",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Customer.class))),
                    @ApiResponse(responseCode = "404", description = "Customer not found")})
    public Response getCustomer_VxA(@QueryParam("UNAME") String UNAME) {

        Customer c = new GetCustomer_VxA().getCustomer(UNAME);
        if(c == null){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","Not found");

            return Response.status(Response.Status.NOT_FOUND)
                    .entity(newJson.toString())
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(new GetCustomer_Vx0().getCustomer(UNAME).getCustomerInJson())
                    .build();
        }
    }
}
