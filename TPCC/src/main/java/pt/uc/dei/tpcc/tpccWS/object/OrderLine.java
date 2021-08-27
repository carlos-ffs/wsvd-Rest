package pt.uc.dei.tpcc.tpccWS.object;

import java.io.Serializable;
import java.util.Date;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author nmsa@dei.uc.pt
 */
@XmlType(name = "OrderLine", namespace = "http://tpcc.wsvdbench.dei.uc.pt/")
public class OrderLine implements Serializable {

    public long ol_supply_w_id;
    public long ol_i_id;
    public long ol_quantity;
    public double ol_amount;
    public Date ol_delivery_d;

    public OrderLine() {
    }

    public OrderLine(long ol_supply_w_id, long ol_i_id, long ol_quantity, double ol_amount, Date ol_delivery_d) {
        this.ol_supply_w_id = ol_supply_w_id;
        this.ol_i_id = ol_i_id;
        this.ol_quantity = ol_quantity;
        this.ol_amount = ol_amount;
        this.ol_delivery_d = ol_delivery_d;
    }

    /**
     * @return the ol_supply_w_id
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Long.class)
    public long getOl_supply_w_id() {
        return ol_supply_w_id;
    }

    /**
     * @param ol_supply_w_id the ol_supply_w_id to set
     */
    public void setOl_supply_w_id(long ol_supply_w_id) {
        this.ol_supply_w_id = ol_supply_w_id;
    }

    /**
     * @return the ol_i_id
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Long.class)
    public long getOl_i_id() {
        return ol_i_id;
    }

    /**
     * @param ol_i_id the ol_i_id to set
     */
    public void setOl_i_id(long ol_i_id) {
        this.ol_i_id = ol_i_id;
    }

    /**
     * @return the ol_quantity
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Long.class)
    public long getOl_quantity() {
        return ol_quantity;
    }

    /**
     * @param ol_quantity the ol_quantity to set
     */
    public void setOl_quantity(long ol_quantity) {
        this.ol_quantity = ol_quantity;
    }

    /**
     * @return the ol_amount
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Double.class)
    public double getOl_amount() {
        return ol_amount;
    }

    /**
     * @param ol_amount the ol_amount to set
     */
    public void setOl_amount(double ol_amount) {
        this.ol_amount = ol_amount;
    }

    /**
     * @return the ol_delivery_d
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Date.class)
    public Date getOl_delivery_d() {
        return ol_delivery_d;
    }

    /**
     * @param ol_delivery_d the ol_delivery_d to set
     */
    public void setOl_delivery_d(Date ol_delivery_d) {
        this.ol_delivery_d = ol_delivery_d;
    }

    @Override
    public String toString() {
//        return "[Supply_W - Item_ID - Qty - Amount - Delivery-Date]";
        return "[" + ol_supply_w_id + " - " + ol_i_id + " - " + ol_quantity + " - " + ol_amount + " - " + ol_delivery_d + "]";
    }
}
