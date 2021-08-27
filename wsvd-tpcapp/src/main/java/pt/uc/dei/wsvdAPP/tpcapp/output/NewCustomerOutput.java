package pt.uc.dei.wsvdAPP.tpcapp.output;

import com.google.gson.Gson;

public class NewCustomerOutput {

    // needs to be public to generate OpenAPI
    public Long customerId;

    public NewCustomerOutput() {
        super();
    }
    public Long getCustomerId() {
        return customerId;
    }
    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
    public String getNewCustomerOutputInJson(){
        return new Gson().toJson(this);
    }
}
