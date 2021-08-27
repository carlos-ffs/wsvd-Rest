package pt.uc.dei.wsvdAPP.tpcapp.output;
import com.google.gson.Gson;

import java.util.List;

public class ProductDetailOutput {

    // needs to be public to generate OpenAPI
    public List<ProductDetailPojo> detailedProductsList;

    public ProductDetailOutput() {
        super();
    }
    public List<ProductDetailPojo> getDetailedProductsList() {
        return detailedProductsList;
    }
    public void setDetailedProductsList(List<ProductDetailPojo> detailedProductsList) {
        this.detailedProductsList = detailedProductsList;
    }

    public String getProductDetailOutputInJson(){
        return new Gson().toJson(this);
    }
}
