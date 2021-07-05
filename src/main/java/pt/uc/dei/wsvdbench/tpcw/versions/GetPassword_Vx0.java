package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import pt.uc.dei.wsvdbench.util.Database;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class GetPassword_Vx0 {

    public String getPassword(String C_UNAME) {
        String passwd = null;
        Connection con = Database.pickConnection();
        try {
            // Prepare SQL
            PreparedStatement get_passwd = con.prepareStatement("SELECT c_passwd FROM tpcw_customer WHERE c_uname = ?");
            // Set parameter
            get_passwd.setString(1, C_UNAME);
            ResultSet rs = get_passwd.executeQuery();
            // Results
            rs.next();
            passwd = rs.getString("c_passwd");
            rs.close();
            get_passwd.close();
            con.commit();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
        return passwd;
    }
}
