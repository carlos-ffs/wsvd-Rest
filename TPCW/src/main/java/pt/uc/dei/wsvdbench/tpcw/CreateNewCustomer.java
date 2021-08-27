package pt.uc.dei.wsvdbench.tpcw;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;
import javax.xml.ws.RequestWrapper;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
//import org.glassfish.jersey.process.internal.RequestScoped;
import com.google.gson.JsonObject;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import pt.uc.dei.wsvdbench.tpcw.object.Customer;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx0;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx078;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx103;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx113;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_Vx132;
import pt.uc.dei.wsvdbench.tpcw.versions.CreateNewCustomer_VxA;


@Path("CreateNewCustomer")
public class CreateNewCustomer {

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx0")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create a new customer, c_id could be any number",
            responses = {
                    @ApiResponse(description = "The customer",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Customer.class))),
                    @ApiResponse(responseCode = "200", description = "Customer was created"),
                    @ApiResponse(responseCode = "400", description = "Request malformed")}
            )
    public Response createNewCustomer_Vx0(
            @RequestBody(description = "Customer object in json",
                    required = true,
                    content =
                    @Content(schema = @Schema(implementation = Customer.class)))
                    String cust){

        Customer c = new Gson().fromJson(cust,Customer.class);

        if(c != null)
            c = new CreateNewCustomer_Vx0().createNewCustomer(c);

        if(c == null){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","No customer was created");
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(newJson.toString())
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(c.getCustomerInJson())
                    .build();
        }


    }

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_VxA")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create a new customer, c_id could be any number",
            responses = {
                    @ApiResponse(description = "The customer",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Customer.class))),
                    @ApiResponse(responseCode = "200", description = "Customer was created"),
                    @ApiResponse(responseCode = "400", description = "Request malformed")}
    )
    public Response createNewCustomer_VxA(
            @RequestBody(description = "Customer object in json",
                    required = true,
            content =
            @Content(schema = @Schema(implementation = Customer.class)))
                                                      String cust){

        Customer c = new Gson().fromJson(cust,Customer.class);

        if(c != null)
            c = new CreateNewCustomer_VxA().createNewCustomer(c);

        if(c == null){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","No customer was created");
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(newJson.toString())
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(c.getCustomerInJson())
                    .build();
        }
    }



    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx078")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create a new customer, c_id could be any number",
            responses = {
                    @ApiResponse(description = "The customer",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Customer.class))),
                    @ApiResponse(responseCode = "200", description = "Customer was created"),
                    @ApiResponse(responseCode = "400", description = "Request malformed")}
    )
    public Response createNewCustomer_Vx078(
            @RequestBody(description = "Customer object in json",
                    required = true,
            content =
            @Content(schema = @Schema(implementation = Customer.class)))
                                                        String cust) {

        Customer c = new Gson().fromJson(cust,Customer.class);

        if(c != null)
            c = new CreateNewCustomer_Vx078().createNewCustomer(c);

        if(c == null){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","No customer was created");
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(newJson.toString())
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(c.getCustomerInJson())
                    .build();
        }
    }

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx103")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create a new customer, c_id could be any number",
            responses = {
                    @ApiResponse(description = "The customer",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Customer.class))),
                    @ApiResponse(responseCode = "200", description = "Customer was created"),
                    @ApiResponse(responseCode = "400", description = "Request malformed")}
    )
    public Response createNewCustomer_Vx103(
            @RequestBody(description = "Customer object in json",
                    required = true,
            content =
            @Content(schema = @Schema(implementation = Customer.class)))
                                                        String cust) {

        Customer c = new Gson().fromJson(cust,Customer.class);

        if(c != null)
            c = new CreateNewCustomer_Vx103().createNewCustomer(c);

        if(c == null){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","No customer was created");
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(newJson.toString())
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(c.getCustomerInJson())
                    .build();
        }
    }

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx113")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create a new customer, c_id could be any number",
            responses = {
                    @ApiResponse(description = "The customer",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Customer.class))),
                    @ApiResponse(responseCode = "200", description = "Customer was created"),
                    @ApiResponse(responseCode = "400", description = "Request malformed")}
    )
    public Response createNewCustomer_Vx113(
            @RequestBody(description = "Customer object in json",
                    required = true,
            content =
            @Content(schema = @Schema(implementation = Customer.class)))
                                                        String cust) {

        Customer c = new Gson().fromJson(cust,Customer.class);

        if(c != null)
            c = new CreateNewCustomer_Vx113().createNewCustomer(c);

        if(c == null){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","No customer was created");
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(newJson.toString())
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(c.getCustomerInJson())
                    .build();
        }
    }

    /**
     *
     * @param cust
     * @return
     */
    @POST
    @Path("createNewCustomer_Vx132")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @Operation(summary = "Create a new customer, c_id could be any number",
            responses = {
                    @ApiResponse(description = "The customer",
                            content = @Content(mediaType = "application/json",
                                    schema = @Schema(implementation = Customer.class))),
                    @ApiResponse(responseCode = "200", description = "Customer was created"),
                    @ApiResponse(responseCode = "400", description = "Request malformed")}
    )
    public Response createNewCustomer_Vx132(
            @RequestBody(description = "Customer object in json",
                    required = true,
                    content =
                    @Content(schema = @Schema(implementation = Customer.class)))
                    String cust) {

        Customer c = new Gson().fromJson(cust,Customer.class);

        if(c != null)
            c = new CreateNewCustomer_Vx132().createNewCustomer(c);

        if(c == null){
            JsonObject newJson = new JsonObject();
            newJson.addProperty("result","No customer was created");
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(newJson.toString())
                    .build();
        }
        else{
            return Response.status(Response.Status.OK)
                    .entity(c.getCustomerInJson())
                    .build();
        }
    }
}
