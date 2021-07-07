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
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdbench.tpcw.object.ShortBook;
import pt.uc.dei.wsvdbench.tpcw.versions.GetBestSellers_VxA;
import pt.uc.dei.wsvdbench.tpcw.versions.GetNewProducts_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.GetNewProducts_VxA;

@Path("GetNewProducts")
public class GetNewProducts {

    @GET
    @Path("getNewProducts_Vx0")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(
            summary = "Obtain all most recent books where subject is (i_subject in database) equal to String subject (input)",
            responses = {
                    @ApiResponse(
                            responseCode = "200",
                            description = "List of most recent books (short information about the books) in json with subject equal to the String subject (input)",
                            content = @Content(
                                    mediaType = "application/json",
                                    array = @ArraySchema(schema = @Schema(implementation = ShortBook.class))
                            )
                    ),
                    @ApiResponse(responseCode = "404", description = "No books found for subject equals to input String subject"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response getNewProducts_Vx0(@QueryParam("subject") String subject) {


        List<ShortBook> books = new GetNewProducts_Vx0().getNewProducts(subject);

        Type listType = new TypeToken<List<ShortBook>>() {}.getType();
        List<ShortBook> target = new LinkedList<ShortBook>();

        for(ShortBook b : books)
            target.add(b);


        Gson gson = new Gson();
        String json = gson.toJson(target, listType);

        if(target.size() == 0){
            return Response.status(Response.Status.NOT_FOUND)
                    .entity(json)
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(json)
                    .build();
        }
    }


    @GET
    @Path("getNewProducts_VxA")
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(
            summary = "Obtain all most recent books where subject is (i_subject in database) equal to String subject (input)",
            responses = {
                    @ApiResponse(
                            responseCode = "200",
                            description = "List of most recent books (short information about the books) in json with subject equal to the String subject (input)",
                            content = @Content(
                                    mediaType = "application/json",
                                    array = @ArraySchema(schema = @Schema(implementation = ShortBook.class))
                            )
                    ),
                    @ApiResponse(responseCode = "404", description = "No books found for subject equals to input String subject"),
                    @ApiResponse(responseCode = "500", description = "Something really bad must have happened in our server")
            }
    )
    public Response getNewProducts_VxA(@QueryParam("subject") String subject) {

        List<ShortBook> books = new GetNewProducts_VxA().getNewProducts(subject);

        Type listType = new TypeToken<List<ShortBook>>() {}.getType();
        List<ShortBook> target = new LinkedList<ShortBook>();

        for(ShortBook b : books)
            target.add(b);


        Gson gson = new Gson();
        String json = gson.toJson(target, listType);

        if(target.size() == 0){
            return Response.status(Response.Status.NOT_FOUND)
                    .entity(json)
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(json)
                    .build();
        }
    }
}
