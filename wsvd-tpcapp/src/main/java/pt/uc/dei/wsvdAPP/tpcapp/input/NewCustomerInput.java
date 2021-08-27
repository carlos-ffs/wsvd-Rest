package pt.uc.dei.wsvdAPP.tpcapp.input;


import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class NewCustomerInput {

    // needs to be public to generate OpenAPI
    @NotNull
    @Min(0)
    public Long threadId;


    public String billingAddr1;
    public String billingAddr2;
    public String billingCity;
    public String billingCountry;
    public String billingState;
    public String billingZip;
    public String businessInfo;
    public String businessName;
    public String contactEmail;
    public String contactFName;
    public String contactLName;
    public String contactPhone;
    public String creditInfo;
    public String password;

    @Size(max = 2)
    public String paymentMethod;

    @NotNull
    @Min(0)
    public Long poId;


    public String getBillingAddr1() {
        return billingAddr1;
    }

    public void setBillingAddr1(String billingAddr1) {
        this.billingAddr1 = billingAddr1;
    }


    public String getBillingAddr2() {
        return billingAddr2;
    }

    public void setBillingAddr2(String billingAddr2) {
        this.billingAddr2 = billingAddr2;
    }


    public String getBillingCity() {
        return billingCity;
    }

    public void setBillingCity(String billingCity) {
        this.billingCity = billingCity;
    }


    public String getBillingCountry() {
        return billingCountry;
    }

    public void setBillingCountry(String billingCountry) {
        this.billingCountry = billingCountry;
    }

    public String getBillingState() {
        return billingState;
    }

    public void setBillingState(String billingState) {
        this.billingState = billingState;
    }


    public String getBillingZip() {
        return billingZip;
    }

    public void setBillingZip(String billingZip) {
        this.billingZip = billingZip;
    }


    public String getBusinessInfo() {
        return businessInfo;
    }

    public void setBusinessInfo(String businessInfo) {
        this.businessInfo = businessInfo;
    }


    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }


    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }


    public String getContactFName() {
        return contactFName;
    }

    public void setContactFName(String contactFName) {
        this.contactFName = contactFName;
    }


    public String getContactLName() {
        return contactLName;
    }

    public void setContactLName(String contactLName) {
        this.contactLName = contactLName;
    }


    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }


    public String getCreditInfo() {
        return creditInfo;
    }

    public void setCreditInfo(String creditInfo) {
        this.creditInfo = creditInfo;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }


    public Long getPoId() {
        return poId;
    }

    public void setPoId(Long poId) {
        this.poId = poId;
    }


    public Long getThreadId() {
        return threadId;
    }

    public void setThreadId(Long threadId) {
        this.threadId = threadId;
    }
}
