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
public class StockLevel_Vx057 {

    public long stockLevelTransaction(String w_id, String d_id, long threshold) {
        long o_id, stock_count;
        Connection con = Database.pickConnection();
        try {
            PreparedStatement ps33 = con.prepareStatement(
                    "SELECT d_next_o_id " +
                    "  FROM tpcc_district " +
                    " WHERE d_w_id = ? " +
                    "   AND d_id = ? ");
            ps33.setString(1, w_id);
            ps33.setString(2, d_id);
            //
            //
            //
            ResultSet rs = ps33.executeQuery();
            if (!rs.next()) {
                throw new Exception("D_W_ID=" + w_id + " D_ID=" + d_id + " not found!");
            }
            o_id = rs.getLong("d_next_o_id");
            rs.close();
            ps33.close();
            rs = null;
            Statement stmt = Database.createStatement(con);
            StringBuffer query = new StringBuffer();
            query.append("SELECT COUNT(DISTINCT (s_i_id)) AS stock_count");
            query.append(" FROM tpcc_order_line, tpcc_stock");
            query.append(" WHERE s_i_id = ol_i_id");
            query.append(" AND s_quantity < ").append(threshold);
            query.append(" AND ol_w_id = '").append(w_id);
            query.append("' AND ol_d_id = '");
            query.append(d_id);
            query.append("' AND ol_o_id < ");
            query.append(o_id);
            query.append(" AND ol_o_id >= ");
            query.append(o_id - 20);
            query.append(" AND s_w_id = '");
            query.append(w_id).append("' ");
            rs = stmt.executeQuery(query.toString());
            if (!rs.next()) {
                throw new Exception("OL_W_ID=" + w_id + " OL_D_ID=" + d_id + " OL_O_ID=" + o_id + " (...) not found!");
            }
            stock_count = rs.getLong("stock_count");
            rs.close();
            rs = null;
            stmt.close();
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
