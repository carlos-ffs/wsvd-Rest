package pt.uc.dei.wsvdbench.tpcw.object;

/*
 * Order.java - Order class Stores the important pertinent to a
 *              single order
 * 
 ************************************************************************
 *
 * This is part of the the Java TPC-W distribution,
 * written by Harold Cain, Tim Heil, Milo Martin, Eric Weglarz, and Todd
 * Bezenek.  University of Wisconsin - Madison, Computer Sciences
 * Dept. and Dept. of Electrical and Computer Engineering, as a part of
 * Prof. Mikko Lipasti's Fall 1999 ECE 902 course.
 *
 * Copyright (C) 1999, 2000 by Harold Cain, Timothy Heil, Milo Martin, 
 *                             Eric Weglarz, Todd Bezenek.
 *
 * This source code is distributed "as is" in the hope that it will be
 * useful.  It comes with no warranty, and no author or distributor
 * accepts any responsibility for the consequences of its use.
 *
 * Everyone is granted permission to copy, modify and redistribute
 * this code under the following conditions:
 *
 * This code is distributed for non-commercial use only.
 * Please contact the maintainer for restrictions applying to 
 * commercial use of these tools.
 *
 * Permission is granted to anyone to make or distribute copies
 * of this code, either as received or modified, in any
 * medium, provided that all copyright notices, permission and
 * nonwarranty notices are preserved, and that the distributor
 * grants the recipient permission for further redistribution as
 * permitted by this document.
 *
 * Permission is granted to distribute this code in compiled
 * or executable form under the same conditions that apply for
 * source code, provided that either:
 *
 * A. it is accompanied by the corresponding machine-readable
 *    source code,
 * B. it is accompanied by a written offer, with no time limit,
 *    to give anyone a machine-readable copy of the corresponding
 *    source code in return for reimbursement of the cost of
 *    distribution.  This written offer must permit verbatim
 *    duplication by anyone, or
 * C. it is distributed by someone who received only the
 *    executable form, and is accompanied by a copy of the
 *    written offer of source code that they received concurrently.
 *
 * In other words, you are welcome to use, share and improve this codes.
 * You are forbidden to forbid anyone else to use, share and improve what
 * you give them.
 *
 ************************************************************************/
import com.google.gson.Gson;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

//Glorified struct to pass order information from the DB to servlets
@XmlType(name = "Order", namespace = "http://tpcw.wsvdbench.dei.uc.pt/")
public class Order implements Serializable {

    public Order() {
        order_lines = new ArrayList<OrderLine>();
    }

    public Order(ResultSet rs) {
        this();
        try {
            o_id = rs.getInt("o_id");
            c_fname = rs.getString("c_fname");
            c_lname = rs.getString("c_lname");
            c_passwd = rs.getString("c_passwd");
            c_uname = rs.getString("c_uname");
            c_phone = rs.getString("c_phone");
            c_email = rs.getString("c_email");
            o_date = rs.getDate("o_date");
            o_subtotal = rs.getDouble("o_sub_total");
            o_tax = rs.getDouble("o_tax");
            o_total = rs.getDouble("o_total");
            o_ship_type = rs.getString("o_ship_type");
            o_ship_date = rs.getDate("o_ship_date");
            o_status = rs.getString("o_status");
            cx_type = rs.getString("cx_type");

            bill_addr_street1 = rs.getString("bill_addr_street1");
            bill_addr_street2 = rs.getString("bill_addr_street2");
            bill_addr_state = rs.getString("bill_addr_state");
            bill_addr_zip = rs.getString("bill_addr_zip");
            bill_co_name = rs.getString("bill_co_name");

            ship_addr_street1 = rs.getString("ship_addr_street1");
            ship_addr_street2 = rs.getString("ship_addr_street2");
            ship_addr_state = rs.getString("ship_addr_state");
            ship_addr_zip = rs.getString("ship_addr_zip");
            ship_co_name = rs.getString("ship_co_name");
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
    }
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Integer.class)
    public int o_id;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String c_fname;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String c_lname;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String c_passwd;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String c_uname;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String c_phone;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String c_email;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Date.class)
    public Date o_date;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Double.class)
    public double o_subtotal;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Double.class)
    public double o_tax;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Double.class)
    public double o_total;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String o_ship_type;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Date.class)
    public Date o_ship_date;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String o_status;
    //Billing address
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String bill_addr_street1;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String bill_addr_street2;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String bill_addr_state;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String bill_addr_zip;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String bill_co_name;
    //Shipping address
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String ship_addr_street1;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String ship_addr_street2;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String ship_addr_state;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String ship_addr_zip;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String ship_co_name;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String cx_type;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = OrderLine.class)
    public final List<OrderLine> order_lines;

    public String getOrderInJson(){
        return new Gson().toJson(this);
    }
}
