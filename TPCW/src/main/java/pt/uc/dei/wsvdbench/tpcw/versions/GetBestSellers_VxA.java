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
public class GetBestSellers_VxA {

    public List<ShortBook> getBestSellers(String subject) {
        List<ShortBook> books = new ArrayList<ShortBook>();
        Connection con = Database.pickConnection();
        try {
            Statement statement = Database.createStatement(con);
            ResultSet rs = statement.executeQuery("SELECT i_id, i_title, a_fname, a_lname " +
                    "FROM tpcw_item, tpcw_author, tpcw_order_line " +
                    "WHERE tpcw_item.i_id = tpcw_order_line.ol_i_id " +
                    "AND tpcw_item.i_a_id = tpcw_author.a_id " +
                    "AND tpcw_order_line.ol_o_id > (SELECT MAX(o_id)-3333 FROM tpcw_orders) " +
                    "AND tpcw_item.i_subject = '" + subject + "' " +
                    "AND ROWNUM <= 50 " +
                    "GROUP BY i_id, i_title, a_fname, a_lname " +
                    "ORDER BY SUM(ol_qty) DESC ");
            // Results
            while (rs.next()) {
                books.add(new ShortBook(rs));
            }
            rs.close();
            statement.close();
            con.commit();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
        return books;
    }
}
