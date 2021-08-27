package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.Statement;
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
public class GetUsername_VxA {

    public String getUserName(int C_ID) {
        Connection con = Database.pickConnection();
        String u_name = null;
        try {
            // Prepare SQL
            Statement get_user_name = Database.createStatement(con);
            // Set parameter
//            get_user_name.setInt(1, C_ID);
            ResultSet rs = get_user_name.executeQuery("SELECT c_uname FROM tpcw_customer WHERE c_id = " + C_ID);
            // Results
            rs.next();
            u_name = rs.getString("c_uname");
            rs.close();
            get_user_name.close();
            con.commit();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
        return u_name;
    }
}
