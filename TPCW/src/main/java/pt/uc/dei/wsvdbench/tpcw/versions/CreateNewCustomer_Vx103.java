package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import pt.uc.dei.wsvdbench.util.Database;
import pt.uc.dei.wsvdbench.tpcw.object.Address;
import pt.uc.dei.wsvdbench.tpcw.object.Customer;
import static pt.uc.dei.wsvdbench.tpcw.versions.TPCWUtil.DigSyl;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class CreateNewCustomer_Vx103 {

    public Customer createNewCustomer(Customer cust) {
        Connection con = Database.pickConnection();
        try {
            // Get largest customer ID already in use.
            cust.c_discount = (int) (java.lang.Math.random() * 51);
            cust.c_balance = 0.0;
            cust.c_ytd_pmt = 0.0;
            // FIXME - Use SQL CURRENT_TIME to do this
            cust.c_last_visit = new Date(System.currentTimeMillis());
            cust.c_since = new Date(System.currentTimeMillis());
            cust.c_login = new Date(System.currentTimeMillis());
            cust.c_expiration = new Date(System.currentTimeMillis() +
                    7200000);//milliseconds in 2 hours
            PreparedStatement insert_customer_row = con.prepareStatement("INSERT into tpcw_customer (c_id, c_uname, c_passwd, c_fname, c_lname, c_addr_id, c_phone, c_email, c_since, c_last_login, c_login, c_expiration, c_discount, c_balance, c_ytd_pmt, c_birthdate, c_data) " +
                    " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            insert_customer_row.setString(4, cust.c_fname);
            insert_customer_row.setString(5, cust.c_lname);
            insert_customer_row.setString(7, cust.c_phone);
            insert_customer_row.setString(8, cust.c_email);
            insert_customer_row.setDate(9, new java.sql.Date(cust.c_since.getTime()));
            insert_customer_row.setDate(10, new java.sql.Date(cust.c_last_visit.getTime()));
            insert_customer_row.setDate(11, new java.sql.Date(cust.c_login.getTime()));
            insert_customer_row.setDate(12, new java.sql.Date(cust.c_expiration.getTime()));
            insert_customer_row.setDouble(13, cust.c_discount);
            insert_customer_row.setDouble(14, cust.c_balance);
            insert_customer_row.setDouble(15, cust.c_ytd_pmt);
            insert_customer_row.setDate(16, new java.sql.Date(cust.c_birthdate.getTime()));
            insert_customer_row.setString(17, cust.c_data);

            cust.addr_id = enterAddress(con,
                    cust.addr_street1,
                    cust.addr_street2,
                    cust.addr_city,
                    cust.addr_state,
                    cust.addr_zip,
                    cust.co_name);
            PreparedStatement get_max_id = con.prepareStatement("SELECT max(c_id) FROM tpcw_customer");

            synchronized (Customer.class) {
                // Set parameter

                ResultSet rs = get_max_id.executeQuery();
                // Results
                rs.next();
                cust.c_id = rs.getInt(1);//Is 1 the correct index?
                rs.close();
                cust.c_id += 1;
                cust.c_uname = DigSyl(cust.c_id, 0);
                cust.c_passwd = cust.c_uname.toLowerCase();
                insert_customer_row.setInt(1, cust.c_id);
                insert_customer_row.setString(2, cust.c_uname);
                insert_customer_row.setString(3, cust.c_passwd);
                insert_customer_row.setInt(6, cust.addr_id);
                //
                //
                insert_customer_row.executeUpdate();// VxA_78
                con.commit();
                insert_customer_row.close();
            }
            get_max_id.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
        return cust;
    }

    private int enterAddress(Connection con, String street1, String street2, String city, String state, String zip, String country) {
        // returns the tpcw_address id of the specified tpcw_address.  Adds a
        // new tpcw_address to the table if needed
        int addr_id = 0;

        // Get the country ID from the country table matching this tpcw_address.

        // Is it safe to assume that the country that we are looking
        // for will be there?
        try {
            Statement get_co_id = Database.createStatement(con);
//            get_co_id.setString(1, );
//            System.out.println("SELECT co_id FROM tpcw_country WHERE co_name = '" + country + "'");
            ResultSet rs = get_co_id.executeQuery("SELECT co_id FROM tpcw_country WHERE co_name = '" + country + "'");
            rs.next();
            int addr_co_id = rs.getInt("co_id");
//            PreparedStatement get_co_id = con.prepareStatement("SELECT co_id FROM tpcw_country WHERE co_name = ?");
//            get_co_id.setString(1, country);
//            ResultSet rs = get_co_id.executeQuery();// VxA_103
//            rs.next();
//            int addr_co_id = rs.getInt("co_id");
            rs.close();
            get_co_id.close();
            PreparedStatement match_address = con.prepareStatement("SELECT addr_id FROM tpcw_address " +
                    "WHERE addr_street1 = ? " +
                    "AND addr_street2 = ? " +
                    "AND addr_city = ? " +
                    "AND addr_state = ? " +
                    "AND addr_zip = ? " +
                    "AND addr_co_id = ?");
            match_address.setString(1, street1);
            match_address.setString(2, street2);
            match_address.setString(3, city);
            match_address.setString(4, state);
            match_address.setString(5, zip);
            match_address.setInt(6, addr_co_id);
            rs = match_address.executeQuery(); // VxA_113

            if (!rs.next()) {//We didn't match an tpcw_address in the addr table
                PreparedStatement insert_address_row = con.prepareStatement("INSERT into tpcw_address (addr_id, addr_street1, addr_street2, addr_city, addr_state, addr_zip, addr_co_id) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?)");

                insert_address_row.setString(2, street1);
                insert_address_row.setString(3, street2);
                insert_address_row.setString(4, city);
                insert_address_row.setString(5, state);
                insert_address_row.setString(6, zip);
                insert_address_row.setInt(7, addr_co_id);

                PreparedStatement get_max_addr_id = con.prepareStatement("SELECT max(addr_id) FROM tpcw_address");
                synchronized (Address.class) {
                    ResultSet rs2 = get_max_addr_id.executeQuery();
                    rs2.next();
                    addr_id = rs2.getInt(1) + 1;

                    rs2.close();
                    //Need to insert a new row in the tpcw_address table
                    insert_address_row.setInt(1, addr_id);
                    insert_address_row.executeUpdate();// VxA_132
                }
                get_max_addr_id.close();
                insert_address_row.close();
            } else { //We actually matched
                addr_id = rs.getInt("addr_id");
            }
            match_address.close();
            rs.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
        return addr_id;
    }
}
