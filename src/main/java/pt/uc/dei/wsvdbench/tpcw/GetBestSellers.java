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
import pt.uc.dei.wsvdbench.tpcw.object.Book;
import pt.uc.dei.wsvdbench.tpcw.object.ShortBook;
import pt.uc.dei.wsvdbench.tpcw.versions.DoTitleSearch_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetBestSellers_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetBestSellers_VxA;


@Path("GetBestSellers")
public class GetBestSellers {


    @GET
    @Path("getBestSellers_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getBestSellers_Vx0(@QueryParam("subject") String subject) {

        List<ShortBook> books = new GetBestSellers_Vx0().getBestSellers(subject);

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
    @Path("getBestSellers_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getBestSellers_VxA(@QueryParam("subject") String subject) {

        List<ShortBook> books = new GetBestSellers_VxA().getBestSellers(subject);

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
