package pt.uc.dei.tpcc.tpccWS.object;

import com.google.gson.Gson;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nmsa@dei.uc.pt
 */
public class Order implements Serializable {

    public long o_id;
    public String c_id;
    public Date entdate;
    public long o_carrier_id;
    public List<OrderLine> orderLines;

    public Order() {
    }

    public Order(long o_id, String c_id, Date entdate, long o_carrier_id, List<OrderLine> orderLines) {
        this.o_id = o_id;
        this.c_id = c_id;
        this.entdate = entdate;
        this.o_carrier_id = o_carrier_id;
        this.orderLines = orderLines;
    }

    /**
     * @return the o_id
     */
    public long getO_id() {
        return o_id;
    }

    /**
     * @param o_id the o_id to set
     */
    public void setO_id(long o_id) {
        this.o_id = o_id;
    }

    /**
     * @return the c_id
     */
    public String getC_id() {
        return c_id;
    }

    /**
     * @param c_id the c_id to set
     */
    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    /**
     * @return the entdate
     */
    public Date getEntdate() {
        return entdate;
    }

    /**
     * @param entdate the entdate to set
     */
    public void setEntdate(Date entdate) {
        this.entdate = entdate;
    }

    /**
     * @return the o_carrier_id
     */
    public long getO_carrier_id() {
        return o_carrier_id;
    }

    /**
     * @param o_carrier_id the o_carrier_id to set
     */
    public void setO_carrier_id(long o_carrier_id) {
        this.o_carrier_id = o_carrier_id;
    }

    /**
     * @return the orderLines
     */
    public List<OrderLine> getOrderLines() {
        return orderLines;
    }

    /**
     * @param orderLines the orderLines to set
     */
    public void setOrderLines(List<OrderLine> orderLines) {
        this.orderLines = orderLines;
    }

    public String getOrderInJson(){
        return new Gson().toJson(this);
    }
}
