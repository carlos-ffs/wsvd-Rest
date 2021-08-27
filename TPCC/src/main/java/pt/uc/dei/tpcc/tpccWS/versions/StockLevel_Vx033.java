package pt.uc.dei.tpcc.tpccWS.versions;
import pt.uc.dei.tpcc.util.Database;
import pt.uc.dei.tpcc.util.Logging;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class StockLevel_Vx033 {

    public long stockLevelTransaction(String w_id, String d_id, long threshold) {
        long o_id, stock_count;
        Connection con = Database.pickConnection();
        try {
            Statement stmt = Database.createStatement(con);
            StringBuffer query = new StringBuffer();
            query.append("SELECT d_next_o_id");
            query.append(" FROM tpcc_district");
            query.append(" WHERE d_w_id = '");
            query.append(w_id);
            query.append("' AND d_id = '");
            query.append(d_id);
            query.append("'");
            ResultSet rs = stmt.executeQuery(query.toString());
            if (!rs.next()) {
                throw new Exception("D_W_ID=" + w_id + " D_ID=" + d_id + " not found!");
            }
            o_id = rs.getLong("d_next_o_id");
            rs.close();
            stmt.close();
            rs = null;
            PreparedStatement ps57 = con.prepareStatement("SELECT COUNT(DISTINCT (s_i_id)) AS stock_count " +
                    "  FROM tpcc_order_line, tpcc_stock " +
                    " WHERE s_i_id = ol_i_id " +
                    "   AND s_quantity < ? " +
                    "   AND ol_w_id = ? " +
                    "   AND ol_d_id = ? " +
                    "   AND ol_o_id < ? " +
                    "   AND ol_o_id >= ? " +
                    "   AND s_w_id = ? ");
            ps57.setLong(1, threshold);
            ps57.setString(2, w_id);
            ps57.setString(3, d_id);
            ps57.setLong(4, o_id);
            ps57.setLong(5, o_id - 20);
            ps57.setString(6, w_id);
            //
            rs = ps57.executeQuery();
            if (!rs.next()) {
                throw new Exception("OL_W_ID=" + w_id + " OL_D_ID=" + d_id + " OL_O_ID=" + o_id + " (...) not found!");
            }
            stock_count = rs.getLong("stock_count");
            rs.close();
            rs = null;
            ps57.close();
            Logging.trace("\n Stock Level Threshold: " + threshold);
            con.commit();
//            System.out.println("\n Low Stock Count:       ");
            return stock_count;
        } catch (Exception e) {
            Logging.trace(" STOCK LEVEL " + e.toString());
//            logException(e);
        } finally {
            Database.relaseConnection(con);
        }
        return -1;
    }
}
