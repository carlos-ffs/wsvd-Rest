package pt.uc.dei.wsvdbench.tpcw;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdbench.tpcw.object.Customer;
import pt.uc.dei.wsvdbench.tpcw.versions.GetPassword_VxA;
import pt.uc.dei.wsvdbench.tpcw.versions.GetUsername_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetUsername_VxA;


@Path("GetUsername")
public class GetUsername {

    @GET
    @Path("getUserName_Vx0")
    @Operation(summary = "Get customer's username where customer's C_ID (input) equals to c_id in database",
            responses = {
                    @ApiResponse(responseCode = "200", description =  "The customer's username string"),
                    @ApiResponse(responseCode = "404", description = "Customer with id equals to C_ID not found"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response getUserName_Vx0(@Parameter(required=true) @QueryParam("C_ID") int C_ID) {

        String username = new GetUsername_Vx0().getUserName(C_ID);

        if(username == null){
            String response = "No customer with id equals to C_ID (input)";
            return Response.status(Response.Status.NOT_FOUND)
                    .entity(response)
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(username)
                    .build();
        }

    }

    @GET
    @Path("getUserName_VxA")
    @Operation(summary = "Get customer's username where customer's C_ID (input) equals to c_id in database",
            responses = {
                    @ApiResponse(responseCode = "200", description =  "The customer's username string"),
                    @ApiResponse(responseCode = "404", description = "Customer with id equals to C_ID not found"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response getUserName_VxA(@Parameter(required=true) @QueryParam("C_ID") int C_ID) {
        String username = new GetUsername_VxA().getUserName(C_ID);
        if(username == null){
            String response = "No customer with id equals to C_ID (input)";
            return Response.status(Response.Status.NOT_FOUND)
                    .entity(response)
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(username)
                    .build();
        }
    }
}
