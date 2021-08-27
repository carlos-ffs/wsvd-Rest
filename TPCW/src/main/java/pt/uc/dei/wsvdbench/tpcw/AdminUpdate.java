package pt.uc.dei.wsvdbench.tpcw;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import pt.uc.dei.wsvdbench.tpcw.versions.AdminUpdate_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.AdminUpdate_VxA;

@Path("AdminUpdate")
public class AdminUpdate {


    @GET
    @Path("test")
    public String adminUpdate_Vx0(@QueryParam("word")  String word) {

        if(word == null)
            return "";
        else
            return word;
    }


    @POST
    @Path("adminUpdate_Vx0")
    public Response adminUpdate_Vx0(@QueryParam("i_id")  int i_id,
                                @QueryParam("cost") double cost,
                                @QueryParam("image") String image,
                                @QueryParam("thumbnail") String thumbnail) {
        new AdminUpdate_Vx0().adminUpdate(i_id, cost, image, thumbnail);

        String str = "Update received - Admin with id:" + i_id;
        return Response.status(Status.OK).entity(str).build();
    }

    @POST
    @Path("adminUpdate_VxA")
    public Response adminUpdate_VxA(@QueryParam("i_id") int i_id,
                                @QueryParam("cost") double cost,
                                @QueryParam("image") String image,
                                @QueryParam("thumbnail") String thumbnail) {
        new AdminUpdate_VxA().adminUpdate(i_id, cost, image, thumbnail);

        String str = "Update received - Admin with id:" + i_id;
        return Response.status(Status.OK).entity(str).build();
    }
}
