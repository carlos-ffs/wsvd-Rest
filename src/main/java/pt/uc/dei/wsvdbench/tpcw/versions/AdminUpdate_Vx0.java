package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class AdminUpdate_Vx0 {

    public void adminUpdate(int i_id, double cost, String image, String thumbnail) {
        Connection con = Database.pickConnection();
        try {
            // Prepare SQL
            PreparedStatement statement = con.prepareStatement("UPDATE tpcw_item SET i_cost = ?, i_image = ?, i_thumbnail = ?, i_pub_date = sysdate WHERE i_id = ?");

            // Set parameter
            statement.setDouble(1, cost);
            statement.setString(2, image);
            statement.setString(3, thumbnail);
            statement.setInt(4, i_id);
            statement.executeUpdate();
            statement.close();
            PreparedStatement related = con.prepareStatement("SELECT ol_i_id "
                    + "  FROM tpcw_orders, tpcw_order_line "
                    + " WHERE tpcw_orders.o_id = tpcw_order_line.ol_o_id "
                    + "   AND NOT (tpcw_order_line.ol_i_id = ?) "
                    + "   AND tpcw_orders.o_c_id IN (SELECT o_c_id "
                    + "                      FROM tpcw_orders, tpcw_order_line "
                    + "                      WHERE tpcw_orders.o_id = tpcw_order_line.ol_o_id "
                    + "                      AND tpcw_orders.o_id > (SELECT MAX(o_id)-10000 FROM tpcw_orders)"
                    + "                      AND tpcw_order_line.ol_i_id = ?) "
                    + "   AND ROWNUM < 5 "
                    + " GROUP BY ol_i_id "
                    + " ORDER BY SUM(ol_qty) DESC ");

            // Set parameter
            related.setInt(1, i_id);
            related.setInt(2, i_id);
            ResultSet rs = related.executeQuery();

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
                statement = con.prepareStatement("UPDATE tpcw_item SET i_related1 = ?, i_related2 = ?, i_related3 = ?, i_related4 = ?, i_related5 = ? WHERE i_id = ?");

                // Set parameter
                statement.setInt(1, related_items[0]);
                statement.setInt(2, related_items[1]);
                statement.setInt(3, related_items[2]);
                statement.setInt(4, related_items[3]);
                statement.setInt(5, related_items[4]);
                statement.setInt(6, i_id);
                statement.executeUpdate();
            }
            statement.close();
            con.commit();

        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
    }
}
