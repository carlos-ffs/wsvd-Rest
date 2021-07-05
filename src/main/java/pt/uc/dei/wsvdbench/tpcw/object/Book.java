package pt.uc.dei.wsvdbench.tpcw.object;

/*
 * Book.java - Class used to store all of the data associated with a single
 *             book. 
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
import java.io.Serializable;
import java.sql.ResultSet;
import java.util.Date;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@XmlType(name = "Book", namespace = "http://tpcw.wsvdbench.dei.uc.pt/")
public class Book implements Serializable {

    public Book() {
    }
    // Construct a book from a ResultSet

    public Book(ResultSet rs) {
        // The result set should have all of the fields we expect.
        // This relies on using field name access.  It might be a bad
        // way to break this up since it does not allow us to use the
        // more efficient select by index access method.  This also
        // might be a problem since there is no type checking on the
        // result set to make sure it is even a reasonble result set
        // to give to this function.

        try {
            i_id = rs.getInt("i_id");
            i_title = rs.getString("i_title");
            i_pub_Date = rs.getDate("i_pub_Date");
            i_publisher = rs.getString("i_publisher");
            i_subject = rs.getString("i_subject");
            i_desc = rs.getString("i_desc");
            i_related1 = rs.getInt("i_related1");
            i_related2 = rs.getInt("i_related2");
            i_related3 = rs.getInt("i_related3");
            i_related4 = rs.getInt("i_related4");
            i_related5 = rs.getInt("i_related5");
            i_thumbnail = rs.getString("i_thumbnail");
            i_image = rs.getString("i_image");
            i_srp = rs.getDouble("i_srp");
            i_cost = rs.getDouble("i_cost");
            i_avail = rs.getDate("i_avail");
            i_isbn = rs.getString("i_isbn");
            i_page = rs.getInt("i_page");
            i_backing = rs.getString("i_backing");
            i_dimensions = rs.getString("i_dimensions");
            a_id = rs.getInt("a_id");
            a_fname = rs.getString("a_fname");
            a_lname = rs.getString("a_lname");
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
    }
    // From Item
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Integer.class)
    public int i_id;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String i_title;
//  public int i_a_id;   // Redundant
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Date.class)
    public Date i_pub_Date;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String i_publisher;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String i_subject;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String i_desc;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Integer.class)
    public int i_related1;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Integer.class)
    public int i_related2;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Integer.class)
    public int i_related3;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Integer.class)
    public int i_related4;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Integer.class)
    public int i_related5;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String i_thumbnail;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String i_image;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Double.class)
    public double i_srp;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Double.class)
    public double i_cost;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Date.class)
    public Date i_avail;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String i_isbn;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Integer.class)
    public int i_page;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String i_backing;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String i_dimensions;
    // From Author
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = Integer.class)
    public int a_id;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String a_fname;
    @XmlElement(namespace = "http://tpcw.wsvdbench.dei.uc.pt/", type = String.class)
    public String a_lname;
}



