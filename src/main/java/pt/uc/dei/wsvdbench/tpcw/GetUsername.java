package pt.uc.dei.wsvdbench.tpcw;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

import pt.uc.dei.wsvdbench.tpcw.versions.GetPassword_VxA;
import pt.uc.dei.wsvdbench.tpcw.versions.GetUsername_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetUsername_VxA;


@Path("GetUsername")
public class GetUsername {

    @GET
    @Path("getUserName_Vx0")
    public Response getUserName_Vx0(@QueryParam("C_ID") int C_ID) {

        return Response.status(Response.Status.OK)
                .entity(new GetUsername_Vx0().getUserName(C_ID))
                .build();
    }

    @GET
    @Path("getUserName_VxA")
    public Response getUserName_VxA(@QueryParam("C_ID") int C_ID) {

        return Response.status(Response.Status.OK)
                .entity(new GetUsername_VxA().getUserName(C_ID))
                .build();
    }
}
