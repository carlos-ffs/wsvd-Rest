package pt.uc.dei.wsvdAPP.tpcapp.input;


import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

public class NewProductsInput {

    // needs to be public to generate OpenAPI
    @Min(0)
    public Long cutOffDuration;
    public String subjectString;

    @Min(0)
    public Long itemLimit;


    public Long getCutOffDuration() {
        return cutOffDuration;
    }

    public void setCutOffDuration(Long cutOffDuration) {
        this.cutOffDuration = cutOffDuration;
    }


    public Long getItemLimit() {
        return itemLimit;
    }

    public void setItemLimit(Long itemLimit) {
        this.itemLimit = itemLimit;
    }


    public String getSubjectString() {
        return subjectString;
    }

    public void setSubjectString(String subjectString) {
        this.subjectString = subjectString;
    }
}
