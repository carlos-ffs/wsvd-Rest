package pt.uc.dei.wsvdbench.tpcw;

import java.lang.reflect.Type;
import java.util.List;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdbench.tpcw.object.Cart;
import pt.uc.dei.wsvdbench.tpcw.object.CartAux;
import pt.uc.dei.wsvdbench.tpcw.object.Customer;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateShoppingCart_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateShoppingCart_VxA;



@Path("CreateShoppingCart")
public class CreateShoppingCart {


    @POST
    @Path("createShoppingCart_Vx0")
    @Consumes(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create a new shopping cart",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Shopping cart was created",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = CartAux.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed")}
    )
    public Response createShoppingCart_Vx0(
            @RequestBody(
                description = "Shopping cart object in json",
                required = true,
                content =
                    @Content(schema = @Schema(implementation = CartAux.class))) String json) {

        try{
            JsonObject jsons = new Gson().fromJson(json, JsonObject.class);
            Integer I_ID = jsons.get("I_ID").getAsInt();

            Type listType = new TypeToken<List<String>>() {}.getType();
            JsonElement je = jsons.get("ids");
            List<String> ids = new Gson().fromJson(je, listType);

            JsonElement je2 = jsons.get("quantities");
            List<String> quantities = new Gson().fromJson(je2, listType);

            Integer SHOPPING_ID = jsons.get("SHOPPING_ID").getAsInt();


            //Cart c = new Gson().fromJson(json,Cart.class);
            Cart c = new CreateShoppingCart_Vx0().createShoppingCart(I_ID, ids, quantities, SHOPPING_ID);
            if(c != null){
                return Response.status(Response.Status.OK)
                        .entity(c.getCartInJson())
                        .build();
            }
            else{
                JsonObject newJson = new JsonObject();
                newJson.addProperty("result","No shopping cart was created - BAD REQUEST");
                return Response.status(Response.Status.BAD_REQUEST)
                        .entity(newJson.toString())
                        .build();
            }

        }
        catch (Exception e){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","No shopping cart was created - BAD REQUEST");
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(newJson.toString())
                    .build();
        }
    }

    @POST
    @Path("createShoppingCart_VxA")
    @Consumes(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create a new shopping cart",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Shopping cart was created",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = CartAux.class))),
                    @ApiResponse(responseCode = "400", description = "Request malformed")}
    )
    public Response createShoppingCart_VxA(
            @RequestBody(
                description = "Shopping cart object in json",
                    required = true,
                content =
                    @Content(schema = @Schema(implementation = CartAux.class))) String json) {
        try{
            JsonObject jsons = new Gson().fromJson(json, JsonObject.class);
            Integer I_ID = jsons.get("I_ID").getAsInt();

            Type listType = new TypeToken<List<String>>() {}.getType();
            JsonElement je = jsons.get("ids");
            List<String> ids = new Gson().fromJson(je, listType);

            JsonElement je2 = jsons.get("quantities");
            List<String> quantities = new Gson().fromJson(je2, listType);

            Integer SHOPPING_ID = jsons.get("SHOPPING_ID").getAsInt();


            //Cart c = new Gson().fromJson(json,Cart.class);
            Cart c = new CreateShoppingCart_VxA().createShoppingCart(I_ID, ids, quantities, SHOPPING_ID);
            if(c != null){
                return Response.status(Response.Status.OK)
                        .entity(c.getCartInJson())
                        .build();
            }
            else{
                JsonObject newJson = new JsonObject();
                newJson.addProperty("result","No shopping cart was created - BAD REQUEST");
                return Response.status(Response.Status.BAD_REQUEST)
                        .entity(newJson.toString())
                        .build();
            }

        }
        catch (Exception e){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","No shopping cart was created - BAD REQUEST");
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(newJson.toString())
                    .build();
        }
    }
}
