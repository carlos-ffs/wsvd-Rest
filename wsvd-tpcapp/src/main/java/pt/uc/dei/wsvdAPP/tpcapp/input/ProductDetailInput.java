package pt.uc.dei.wsvdAPP.tpcapp.input;

import java.util.List;


public class ProductDetailInput {


    // needs to be public to generate OpenAPI
    public List<Long> itemIds;

    public List<Long> getItemIds() {
        return itemIds;
    }
    public void setItemIds(List<Long> itemIds) {
        this.itemIds = itemIds;
    }
}
