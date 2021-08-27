package pt.uc.dei.wsvdAPP.tpcapp.output;

public class NewProduct {

    // needs to be public to generate OpenAPI
    public Long itemId;
    public String itemTitle;
    public String authorFName;
    public String authorLName;


    public String getAuthorFName() {
        return authorFName;
    }
    public void setAuthorFName(String authorFName) { this.authorFName = authorFName; }
    public String getAuthorLName() { return authorLName; }
    public void setAuthorLName(String authorLName) { this.authorLName = authorLName; }
    public Long getItemId() { return itemId; }
    public void setItemId(Long itemId) { this.itemId = itemId; }
    public String getItemTitle() { return itemTitle; }
    public void setItemTitle(String itemTitle) { this.itemTitle = itemTitle; }
}
