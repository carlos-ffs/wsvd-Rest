package pt.uc.dei.tpcc.tpccWS.object;


import io.swagger.v3.oas.annotations.Parameter;

import javax.jws.WebParam;
import javax.validation.constraints.NotNull;
import javax.ws.rs.QueryParam;

public class NewOrderTransactionAux {

    @Parameter(required = true)
    public String w_id;

    @Parameter(required = true)
    public String d_id;

    @Parameter(required = true)
    public String c_id;

    @Parameter(required = true)
    public int o_ol_cnt;

    @Parameter(required = true)
    public int o_all_local;

    @Parameter(required = true)
    public NewOrderLongList itemIDs;

    @Parameter(required = true)
    public NewOrderLongList supplierWarehouseIDs;

    @Parameter(required = true)
    public NewOrderLongList orderQuantities;

    public NewOrderTransactionAux(){}


    public String getW_id() { return w_id; }
    public void setW_id(String w_id) { this.w_id = w_id; }

    public String getD_id() { return d_id; }
    public void setD_id(String d_id) { this.d_id = d_id; }

    public String getC_id() { return c_id; }
    public void setC_id(String c_id) { this.c_id = c_id; }

    public int getO_ol_cnt() { return o_ol_cnt; }
    public void setO_ol_cnt(int o_ol_cnt) { this.o_ol_cnt = o_ol_cnt; }

    public int getO_all_local() { return o_all_local; }
    public void setO_all_local(int o_all_local) { this.o_all_local = o_all_local; }

    public NewOrderLongList getItemIDs() { return itemIDs; }
    public void setItemIDs(NewOrderLongList itemIDs) { this.itemIDs = itemIDs; }

    public NewOrderLongList getSupplierWarehouseIDs() { return supplierWarehouseIDs; }
    public void setSupplierWarehouseIDs(NewOrderLongList supplierWarehouseIDs) { this.supplierWarehouseIDs = supplierWarehouseIDs; }

    public NewOrderLongList getOrderQuantities() { return orderQuantities; }
    public void setOrderQuantities(NewOrderLongList orderQuantities) { this.orderQuantities = orderQuantities; }
}
