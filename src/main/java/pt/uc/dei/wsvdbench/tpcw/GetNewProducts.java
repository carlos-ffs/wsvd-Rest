package pt.uc.dei.wsvdbench.tpcw;

import java.lang.reflect.Type;
import java.util.LinkedList;
import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import pt.uc.dei.wsvdbench.tpcw.object.ShortBook;
import pt.uc.dei.wsvdbench.tpcw.versions.GetBestSellers_VxA;
import pt.uc.dei.wsvdbench.tpcw.versions.GetNewProducts_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetNewProducts_VxA;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - W Benchmark Services
 *
 *
 *
 * @author nmsa@dei.uc.pt
 */
@Path("GetNewProducts")
public class GetNewProducts {

    @GET
    @Path("getNewProducts_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getNewProducts_Vx0(@QueryParam("subject") String subject) {


        List<ShortBook> books = new GetNewProducts_Vx0().getNewProducts(subject);

        Type listType = new TypeToken<List<ShortBook>>() {}.getType();
        List<ShortBook> target = new LinkedList<ShortBook>();

        for(ShortBook b : books)
            target.add(b);


        Gson gson = new Gson();
        String json = gson.toJson(target, listType);

        return Response.status(Response.Status.OK)
                .entity(json)
                .build();
    }


    @GET
    @Path("getNewProducts_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getNewProducts_VxA(@QueryParam("subject") String subject) {

        List<ShortBook> books = new GetNewProducts_VxA().getNewProducts(subject);

        Type listType = new TypeToken<List<ShortBook>>() {}.getType();
        List<ShortBook> target = new LinkedList<ShortBook>();

        for(ShortBook b : books)
            target.add(b);


        Gson gson = new Gson();
        String json = gson.toJson(target, listType);

        return Response.status(Response.Status.OK)
                .entity(json)
                .build();
    }
}
