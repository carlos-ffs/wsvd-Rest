package pt.uc.dei.wsvdAPP.tpcapp.output;


import com.google.gson.Gson;

public class ChangePaymentMethodOutput {

    // needs to be public to generate OpenAPI
    public String currPaymentMethod;

    public ChangePaymentMethodOutput() {
        super();
    }
    public String getCurrPaymentMethod() {
        return currPaymentMethod;
    }
    public void setCurrPaymentMethod(String currPaymentMethod) {
        this.currPaymentMethod = currPaymentMethod;
    }

    public String getChangePaymentMethodOutputInJson(){
        return new Gson().toJson(this);
    }
}
