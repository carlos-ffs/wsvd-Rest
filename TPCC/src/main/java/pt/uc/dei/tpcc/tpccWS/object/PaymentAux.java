package pt.uc.dei.tpcc.tpccWS.object;

import javax.jws.WebParam;

public class PaymentAux {

    public String w_id;
    public String c_w_id;
    public double h_amount;
    public String d_id;
    public String c_d_id;
    public String c_id;
    public String c_last;
    public boolean c_by_name;


    public String getW_id() { return w_id; }
    public void setW_id(String w_id) { this.w_id = w_id; }

    public String getC_w_id() { return c_w_id; }
    public void setC_w_id(String c_w_id) { this.c_w_id = c_w_id; }

    public double getH_amount() { return h_amount; }
    public void setH_amount(double h_amount) { this.h_amount = h_amount; }

    public String getD_id() { return d_id; }
    public void setD_id(String d_id) { this.d_id = d_id; }

    public String getC_d_id() { return c_d_id; }
    public void setC_d_id(String c_d_id) { this.c_d_id = c_d_id; }

    public String getC_id() { return c_id; }
    public void setC_id(String c_id) { this.c_id = c_id; }

    public String getC_last() { return c_last; }
    public void setC_last(String c_last) { this.c_last = c_last; }

    public boolean isC_by_name() { return c_by_name; }
    public void setC_by_name(boolean c_by_name) { this.c_by_name = c_by_name; }
}
