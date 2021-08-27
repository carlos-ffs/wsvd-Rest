package pt.uc.dei.wsvdAPP.tpcapp.output;

import java.util.Date;

public class ProductDetailPojo {

    // needs to be public to generate OpenAPI
    public Long itemId;
    public String itemTitle;
    public String authorFName;
    public String authorLName;
    public Date itemPubDate;
    public String itemPublisher;
    public String itemSubject;
    public String itemDesc;
    public String itemCost;
    public String itemSrp;
    public String itemAvail;
    public String itemIsbn;
    public String itemPage;
    public String itemBacking;
    public String itemDimensions;
    public byte[] imageBytes;


    public String getAuthorFName() {
        return authorFName;
    }
    public void setAuthorFName(String authorFName) {
        this.authorFName = authorFName;
    }

    public String getAuthorLName() {
        return authorLName;
    }
    public void setAuthorLName(String authorLName) {
        this.authorLName = authorLName;
    }

    public String getItemAvail() {
        return itemAvail;
    }
    public void setItemAvail(String itemAvail) {
        this.itemAvail = itemAvail;
    }

    public String getItemBacking() {
        return itemBacking;
    }
    public void setItemBacking(String itemBacking) {
        this.itemBacking = itemBacking;
    }

    public String getItemCost() {
        return itemCost;
    }
    public void setItemCost(String itemCost) {
        this.itemCost = itemCost;
    }

    public String getItemDesc() {
        return itemDesc;
    }
    public void setItemDesc(String itemDesc) {
        this.itemDesc = itemDesc;
    }

    public String getItemDimensions() {
        return itemDimensions;
    }
    public void setItemDimensions(String itemDimensions) {
        this.itemDimensions = itemDimensions;
    }

    public Long getItemId() {
        return itemId;
    }
    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public String getItemIsbn() {
        return itemIsbn;
    }
    public void setItemIsbn(String itemIsbn) {
        this.itemIsbn = itemIsbn;
    }

    public String getItemPage() {
        return itemPage;
    }
    public void setItemPage(String itemPage) {
        this.itemPage = itemPage;
    }

    public Date getItemPubDate() {
        return itemPubDate;
    }
    public void setItemPubDate(Date itemPubDate) {
        this.itemPubDate = itemPubDate;
    }

    public String getItemPublisher() {
        return itemPublisher;
    }
    public void setItemPublisher(String itemPublisher) {
        this.itemPublisher = itemPublisher;
    }

    public String getItemSrp() {
        return itemSrp;
    }
    public void setItemSrp(String itemSrp) {
        this.itemSrp = itemSrp;
    }

    public String getItemSubject() {
        return itemSubject;
    }
    public void setItemSubject(String itemSubject) {
        this.itemSubject = itemSubject;
    }

    public String getItemTitle() {
        return itemTitle;
    }
    public void setItemTitle(String itemTitle) {
        this.itemTitle = itemTitle;
    }

    public byte[] getImageBytes() {
        return imageBytes;
    }
    public void setImageBytes(byte[] imageBytes) {
        this.imageBytes = imageBytes;
    }
}
