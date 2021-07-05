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

import pt.uc.dei.wsvdbench.tpcw.versions.GetCustomer_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetPassword_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetPassword_VxA;

@Path("GetPassword")
public class GetPassword {


    @GET
    @Path("getPassword_Vx0")
    public Response getPassword_Vx0(@QueryParam("C_UNAME") String C_UNAME) {

        return Response.status(Response.Status.OK)
                .entity(new  GetPassword_Vx0().getPassword(C_UNAME))
                .build();
    }

    @GET
    @Path("getPassword_VxA")
    public Response getPassword_VxA(@QueryParam("C_UNAME") String C_UNAME) {
        return Response.status(Response.Status.OK)
                .entity(new  GetPassword_VxA().getPassword(C_UNAME))
                .build();
    }
}
