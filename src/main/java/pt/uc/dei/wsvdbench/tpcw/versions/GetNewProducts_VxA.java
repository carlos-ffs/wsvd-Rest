package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import pt.uc.dei.wsvdbench.util.Database;
import pt.uc.dei.wsvdbench.tpcw.object.ShortBook;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class GetNewProducts_VxA {

    public List<ShortBook> getNewProducts(String subject) {
        List<ShortBook> vec = new ArrayList<ShortBook>();
        Connection con = Database.pickConnection();
        try {
            // Prepare SQL
            Statement statement = Database.createStatement(con);
            // Set parameter
//            statement.setString(1, );
            ResultSet rs = statement.executeQuery("SELECT i_id, i_title, a_fname, a_lname " +
                    "FROM tpcw_item, tpcw_author " +
                    "WHERE tpcw_item.i_a_id = tpcw_author.a_id " +
                    "AND tpcw_item.i_subject = '" + subject + "' " +
                    "ORDER BY tpcw_item.i_pub_date DESC,tpcw_item.i_title LIMIT 50");
            // Results
            while (rs.next()) {
                vec.add(new ShortBook(rs));
            }
            rs.close();
            statement.close();
            con.commit();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
        return vec;
    }
}
