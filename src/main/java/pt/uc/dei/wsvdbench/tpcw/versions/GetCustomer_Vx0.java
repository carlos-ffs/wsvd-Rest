package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import pt.uc.dei.wsvdbench.util.Database;
import pt.uc.dei.wsvdbench.tpcw.object.Customer;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class GetCustomer_Vx0 {

    public Customer getCustomer(String UNAME) {
        Customer cust = null;
        Connection con = Database.pickConnection();
        try {
            // Prepare SQL
            PreparedStatement statement = con.prepareStatement("SELECT * FROM tpcw_customer, tpcw_address, tpcw_country WHERE tpcw_customer.c_addr_id = tpcw_address.addr_id AND tpcw_address.addr_co_id = tpcw_country.co_id AND tpcw_customer.c_uname = ?");
            // Set parameter
            statement.setString(1, UNAME);
            ResultSet rs = statement.executeQuery();
            // Results
            if (rs.next()) {
                cust = new Customer(rs);
            } else {
//                System.err.println("ERROR: NULL returned in getCustomer!");
                rs.close();
                statement.close();
                return null;
            }
            statement.close();
            con.commit();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
        return cust;
    }
}
