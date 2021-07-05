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
import pt.uc.dei.wsvdbench.tpcw.versions.DoSubjectSearch_VxA;
import pt.uc.dei.wsvdbench.tpcw.versions.DoTitleSearch_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.DoTitleSearch_VxA;


@Path("DoTitleSearch")
public class DoTitleSearch {

    @GET
    @Path("doTitleSearch_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    public Response doTitleSearch_Vx0(@QueryParam("search_key") String search_key) {

        List<Book> books = new DoTitleSearch_Vx0().doTitleSearch(search_key);

        Type listType = new TypeToken<List<Book>>() {}.getType();
        List<Book> target = new LinkedList<Book>();

        for(Book b : books)
            target.add(b);


        Gson gson = new Gson();
        String json = gson.toJson(target, listType);

        return Response.status(Response.Status.OK)
                .entity(json)
                .build();
    }


    @GET
    @Path("doTitleSearch_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    public Response doTitleSearch_VxA(@QueryParam("search_key") String search_key) {

        List<Book> books = new DoTitleSearch_VxA().doTitleSearch(search_key);

        Type listType = new TypeToken<List<Book>>() {}.getType();
        List<Book> target = new LinkedList<Book>();

        for(Book b : books)
            target.add(b);


        Gson gson = new Gson();
        String json = gson.toJson(target, listType);

        return Response.status(Response.Status.OK)
                .entity(json)
                .build();
    }

}
