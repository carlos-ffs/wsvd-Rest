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
import pt.uc.dei.wsvdbench.tpcw.object.Cart;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateShoppingCart_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateShoppingCart_VxA;



@Path("CreateShoppingCart")
public class CreateShoppingCart {


    @POST
    @Path("createShoppingCart_Vx0")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createShoppingCart_Vx0(String json) {
        JsonObject jsons = new Gson().fromJson(json, JsonObject.class);
        Integer I_ID = jsons.get("I_ID").getAsInt();

        Type listType = new TypeToken<List<String>>() {}.getType();
        JsonElement je = jsons.get("ids");
        List<String> ids = new Gson().fromJson(je, listType);

        JsonElement je2 = jsons.get("quantities");
        List<String> quantities = new Gson().fromJson(je2, listType);

        Integer SHOPPING_ID = jsons.get("SHOPPING_ID").getAsInt();

        //Cart c = new Gson().fromJson(json,Cart.class);
        return Response.status(Response.Status.OK)
                .entity(new CreateShoppingCart_Vx0().createShoppingCart(I_ID, ids, quantities, SHOPPING_ID).getCartInJson())
                .build();
    }

    @POST
    @Path("createShoppingCart_VxA")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createShoppingCart_VxA(String json) {
        JsonObject jsons = new Gson().fromJson(json, JsonObject.class);
        Integer I_ID = jsons.get("I_ID").getAsInt();

        Type listType = new TypeToken<List<String>>() {}.getType();
        JsonElement je = jsons.get("ids");
        List<String> ids = new Gson().fromJson(je, listType);

        JsonElement je2 = jsons.get("quantities");
        List<String> quantities = new Gson().fromJson(je2, listType);

        Integer SHOPPING_ID = jsons.get("SHOPPING_ID").getAsInt();

        //Cart c = new Gson().fromJson(json,Cart.class);
        return Response.status(Response.Status.OK)
                .entity(new CreateShoppingCart_VxA().createShoppingCart(I_ID, ids, quantities, SHOPPING_ID).getCartInJson())
                .build();
    }


}
