package pt.uc.dei.tpcc.tpccWS.object;

import com.google.gson.Gson;

import java.io.Serializable;
import java.util.Date;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author nmsa@dei.uc.pt
 */
@XmlType(name = "PaymentResult", namespace = "http://tpcc.wsvdbench.dei.uc.pt/")
public class PaymentResult implements Serializable {

    public String w_id;
    public String w_street_1;
    public String w_street_2;
    public String w_city;
    public String w_state;
    public String w_zip;
    public String d_id;
    public String d_street_1;
    public String d_street_2;
    public String d_city;
    public String d_state;
    public String d_zip;
    public String c_id;
    public String c_first;
    public String c_middle;
    public String c_last;
    public String c_street_1;
    public String c_street_2;
    public String c_city;
    public String c_state;
    public String c_zip;
    public Date c_since;
    public String c_credit;
    public double c_discount;
    public String c_phone;
    public double h_amount;
    public double c_credit_lim;
    public double c_balance;
    public String c_data;

    public PaymentResult() {
    }

    public PaymentResult(String w_id, String w_street_1, String w_street_2, String w_city, String w_state, String w_zip, String d_id, String d_street_1, String d_street_2, String d_city, String d_state, String d_zip, String c_id, String c_first, String c_middle, String c_last, String c_street_1, String c_street_2, String c_city, String c_state, String c_zip, Date c_since, String c_credit, double c_discount, String c_phone, double h_amount, double c_credit_lim, double c_balance, String c_data) {
        this.w_id = w_id;
        this.w_street_1 = w_street_1;
        this.w_street_2 = w_street_2;
        this.w_city = w_city;
        this.w_state = w_state;
        this.w_zip = w_zip;
        this.d_id = d_id;
        this.d_street_1 = d_street_1;
        this.d_street_2 = d_street_2;
        this.d_city = d_city;
        this.d_state = d_state;
        this.d_zip = d_zip;
        this.c_id = c_id;
        this.c_first = c_first;
        this.c_middle = c_middle;
        this.c_last = c_last;
        this.c_street_1 = c_street_1;
        this.c_street_2 = c_street_2;
        this.c_city = c_city;
        this.c_state = c_state;
        this.c_zip = c_zip;
        this.c_since = c_since;
        this.c_credit = c_credit;
        this.c_discount = c_discount;
        this.c_phone = c_phone;
        this.h_amount = h_amount;
        this.c_credit_lim = c_credit_lim;
        this.c_balance = c_balance;
        this.c_data = c_data;
    }

    /**
     * @return the w_id
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getW_id() {
        return w_id;
    }

    /**
     * @return the w_street_1
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getW_street_1() {
        return w_street_1;
    }

    /**
     * @return the w_street_2
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getW_street_2() {
        return w_street_2;
    }

    /**
     * @return the w_city
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getW_city() {
        return w_city;
    }

    /**
     * @return the w_state
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getW_state() {
        return w_state;
    }

    /**
     * @return the w_zip
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getW_zip() {
        return w_zip;
    }

    /**
     * @return the d_id
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getD_id() {
        return d_id;
    }

    /**
     * @return the d_street_1
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getD_street_1() {
        return d_street_1;
    }

    /**
     * @return the d_street_2
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getD_street_2() {
        return d_street_2;
    }

    /**
     * @return the d_city
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getD_city() {
        return d_city;
    }

    /**
     * @return the d_state
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getD_state() {
        return d_state;
    }

    /**
     * @return the d_zip
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getD_zip() {
        return d_zip;
    }

    /**
     * @return the c_id
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_id() {
        return c_id;
    }

    /**
     * @return the c_first
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_first() {
        return c_first;
    }

    /**
     * @return the c_middle
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_middle() {
        return c_middle;
    }

    /**
     * @return the c_last
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_last() {
        return c_last;
    }

    /**
     * @return the c_street_1
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_street_1() {
        return c_street_1;
    }

    /**
     * @return the c_street_2
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_street_2() {
        return c_street_2;
    }

    /**
     * @return the c_city
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_city() {
        return c_city;
    }

    /**
     * @return the c_state
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_state() {
        return c_state;
    }

    /**
     * @return the c_zip
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_zip() {
        return c_zip;
    }

    /**
     * @return the c_since
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Date.class)
    public Date getC_since() {
        return c_since;
    }

    /**
     * @return the c_credit
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_credit() {
        return c_credit;
    }

    /**
     * @return the c_discount
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Double.class)
    public double getC_discount() {
        return c_discount;
    }

    /**
     * @return the c_phone
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_phone() {
        return c_phone;
    }

    /**
     * @return the h_amount
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Double.class)
    public double getH_amount() {
        return h_amount;
    }

    /**
     * @return the c_credit_lim
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Double.class)
    public double getC_credit_lim() {
        return c_credit_lim;
    }

    /**
     * @return the c_balance
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = Double.class)
    public double getC_balance() {
        return c_balance;
    }

    /**
     * @return the c_data
     */
    @XmlElement(namespace = "http://tpcc.wsvdbench.dei.uc.pt/", type = String.class)
    public String getC_data() {
        return c_data;
    }

    /**
     * @param w_id the w_id to set
     */
    public void setW_id(String w_id) {
        this.w_id = w_id;
    }

    /**
     * @param w_street_1 the w_street_1 to set
     */
    public void setW_street_1(String w_street_1) {
        this.w_street_1 = w_street_1;
    }

    /**
     * @param w_street_2 the w_street_2 to set
     */
    public void setW_street_2(String w_street_2) {
        this.w_street_2 = w_street_2;
    }

    /**
     * @param w_city the w_city to set
     */
    public void setW_city(String w_city) {
        this.w_city = w_city;
    }

    /**
     * @param w_state the w_state to set
     */
    public void setW_state(String w_state) {
        this.w_state = w_state;
    }

    /**
     * @param w_zip the w_zip to set
     */
    public void setW_zip(String w_zip) {
        this.w_zip = w_zip;
    }

    /**
     * @param d_id the d_id to set
     */
    public void setD_id(String d_id) {
        this.d_id = d_id;
    }

    /**
     * @param d_street_1 the d_street_1 to set
     */
    public void setD_street_1(String d_street_1) {
        this.d_street_1 = d_street_1;
    }

    /**
     * @param d_street_2 the d_street_2 to set
     */
    public void setD_street_2(String d_street_2) {
        this.d_street_2 = d_street_2;
    }

    /**
     * @param d_city the d_city to set
     */
    public void setD_city(String d_city) {
        this.d_city = d_city;
    }

    /**
     * @param d_state the d_state to set
     */
    public void setD_state(String d_state) {
        this.d_state = d_state;
    }

    /**
     * @param d_zip the d_zip to set
     */
    public void setD_zip(String d_zip) {
        this.d_zip = d_zip;
    }

    /**
     * @param c_id the c_id to set
     */
    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    /**
     * @param c_first the c_first to set
     */
    public void setC_first(String c_first) {
        this.c_first = c_first;
    }

    /**
     * @param c_middle the c_middle to set
     */
    public void setC_middle(String c_middle) {
        this.c_middle = c_middle;
    }

    /**
     * @param c_last the c_last to set
     */
    public void setC_last(String c_last) {
        this.c_last = c_last;
    }

    /**
     * @param c_street_1 the c_street_1 to set
     */
    public void setC_street_1(String c_street_1) {
        this.c_street_1 = c_street_1;
    }

    /**
     * @param c_street_2 the c_street_2 to set
     */
    public void setC_street_2(String c_street_2) {
        this.c_street_2 = c_street_2;
    }

    /**
     * @param c_city the c_city to set
     */
    public void setC_city(String c_city) {
        this.c_city = c_city;
    }

    /**
     * @param c_state the c_state to set
     */
    public void setC_state(String c_state) {
        this.c_state = c_state;
    }

    /**
     * @param c_zip the c_zip to set
     */
    public void setC_zip(String c_zip) {
        this.c_zip = c_zip;
    }

    /**
     * @param c_since the c_since to set
     */
    public void setC_since(Date c_since) {
        this.c_since = c_since;
    }

    /**
     * @param c_credit the c_credit to set
     */
    public void setC_credit(String c_credit) {
        this.c_credit = c_credit;
    }

    /**
     * @param c_discount the c_discount to set
     */
    public void setC_discount(double c_discount) {
        this.c_discount = c_discount;
    }

    /**
     * @param c_phone the c_phone to set
     */
    public void setC_phone(String c_phone) {
        this.c_phone = c_phone;
    }

    /**
     * @param h_amount the h_amount to set
     */
    public void setH_amount(double h_amount) {
        this.h_amount = h_amount;
    }

    /**
     * @param c_credit_lim the c_credit_lim to set
     */
    public void setC_credit_lim(double c_credit_lim) {
        this.c_credit_lim = c_credit_lim;
    }

    /**
     * @param c_balance the c_balance to set
     */
    public void setC_balance(double c_balance) {
        this.c_balance = c_balance;
    }

    /**
     * @param c_data the c_data to set
     */
    public void setC_data(String c_data) {
        this.c_data = c_data;
    }


    public String getPaymentResultInJson(){
        return new Gson().toJson(this);
    }
}
