package pt.uc.dei.wsvdAPP.tpcapp.output;
import com.google.gson.Gson;

import java.util.List;

public class NewProductsOutput {

    // needs to be public to generate OpenAPI
    public List<NewProduct> newProductsList;

    public NewProductsOutput() {
        super();
    }
    public List<NewProduct> getNewProductsList() {
        return newProductsList;
    }
    public void setNewProductsList(List<NewProduct> newProductsList) {
        this.newProductsList = newProductsList;
    }

    public String getNewProductsOutputInJson(){
        return new Gson().toJson(this);
    }
}
