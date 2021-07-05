package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.jws.WebService;
import pt.uc.dei.wsvdbench.util.Database;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class AdminUpdate_VxA {

    public void adminUpdate(int i_id, double cost, String image, String thumbnail) {
        Connection con = Database.pickConnection();
        try {
            // Prepare SQL
            Statement statement = Database.createStatement(con);
            statement.executeUpdate("UPDATE tpcw_item " +
                    " SET i_cost = " + cost + ", i_image = '" + image + "', i_thumbnail = '" + thumbnail + "', i_pub_date = sysdate " +
                    " WHERE i_id = " + i_id);
            statement.close();

            Statement related = Database.createStatement(con);
            ResultSet rs = related.executeQuery("SELECT ol_i_id " +
                    " FROM tpcw_orders, tpcw_order_line " +
                    "WHERE tpcw_orders.o_id = tpcw_order_line.ol_o_id " +
                    "  AND NOT (tpcw_order_line.ol_i_id = " + i_id +
                    ") AND tpcw_orders.o_c_id IN (SELECT o_c_id " +
                    "                      FROM tpcw_orders, tpcw_order_line " +
                    "                      WHERE tpcw_orders.o_id = tpcw_order_line.ol_o_id " +
                    "                      AND tpcw_orders.o_id > (SELECT MAX(o_id) - 10000 FROM tpcw_orders)" +
                    "                      AND tpcw_order_line.ol_i_id = " + i_id + ") " +
                    "  AND ROWNUM < 5 " +
                    "GROUP BY ol_i_id " +
                    "ORDER BY SUM(ol_qty) DESC ");

            int[] related_items = new int[5];
            // Results
            int counter = 0;
            int last = 0;
            while (rs.next()) {
                last = rs.getInt(1);
                related_items[counter] = last;
                counter++;
            }

            // This is the case for the situation where there are not 5 related books.
            for (int i = counter; i < 5; i++) {
                last++;
                related_items[i] = last;
            }
            rs.close();
            related.close();
            {
                // Prepare SQL
                statement = Database.createStatement(con);
                statement.executeUpdate("UPDATE tpcw_item " +
                        "SET i_related1 = " + related_items[0] + ", i_related2 = " + related_items[1] + ", i_related3 = " + related_items[2] +
                        ", i_related4 = " + related_items[3] + ", i_related5 = " + related_items[4] + " " +
                        " WHERE i_id = " + i_id);
            }
            statement.close();
            con.commit();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
            try {
                ex.getCause().printStackTrace();
            } catch (Exception e) {
            }
        } finally {
            Database.relaseConnection(con);
        }
    }
}
