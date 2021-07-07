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

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdbench.tpcw.versions.GetCustomer_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetPassword_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetPassword_VxA;

@Path("GetPassword")
public class GetPassword {


    @GET
    @Path("getPassword_Vx0")
    @Operation(summary = "Get customer's password where customer's c_uname (customer name in database) equals to C_UNAME (input) ",
            responses = {
                    @ApiResponse(responseCode = "200", description =  "The customer's password string"),
                    @ApiResponse(responseCode = "404", description = "Customer with name equals to C_UNAME not found"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response getPassword_Vx0(@QueryParam("C_UNAME") String C_UNAME) {
        String password = new  GetPassword_Vx0().getPassword(C_UNAME);
        if(password == null){
            String response = "No customer with c_uname equals to C_UNAME (input)";
            return Response.status(Response.Status.OK)
                    .entity(response)
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(password)
                    .build();
        }


    }

    @GET
    @Path("getPassword_VxA")
    @Operation(summary = "Get customer's password where customer's c_uname (customer name in database) equals to C_UNAME (input) ",
            responses = {
                    @ApiResponse(responseCode = "200", description =  "The customer's password string"),
                    @ApiResponse(responseCode = "404", description = "Customer with name equals to C_UNAME not found"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response getPassword_VxA(@QueryParam("C_UNAME") String C_UNAME) {
        String password = new  GetPassword_VxA().getPassword(C_UNAME);
        if(password == null){
            String response = "No customer with c_uname equals to C_UNAME (input)";
            return Response.status(Response.Status.OK)
                    .entity(response)
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(password)
                    .build();
        }
    }
}
