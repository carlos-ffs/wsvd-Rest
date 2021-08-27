package pt.uc.dei.tpcc.tpccWS.versions;

import pt.uc.dei.tpcc.tpccWS.object.Order;
import pt.uc.dei.tpcc.tpccWS.object.OrderLine;
import pt.uc.dei.tpcc.tpccWS.object.ShortOrder;
import pt.uc.dei.tpcc.util.Database;
import pt.uc.dei.tpcc.util.Logging;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class OrderStatus_Vx0 {

    public Order orderStatusTransaction(String w_id, String d_id, String c_id, String c_last, boolean c_by_name) {
        long namecnt, o_id = -1, o_carrier_id = -1;
        double c_balance;
        String c_first, c_middle;
        java.sql.Date entdate = null;
        List<OrderLine> orderLines = new ArrayList<OrderLine>();
        Connection con = Database.pickConnection();
        try {
            if (c_by_name) {
                PreparedStatement ps46 = con.prepareStatement(
                        "SELECT count(c_id) AS namecnt " +
                        "  FROM tpcc_customer " +
                        " WHERE c_last = ? " +
                        "   AND c_d_id = ? " +
                        "   AND c_w_id = ? ");
                ps46.setString(1, c_last);
                ps46.setString(2, d_id);
                ps46.setString(3, w_id);
                // 
                //
                // 
                ResultSet rs = ps46.executeQuery();
                if (!rs.next()) {
                    throw new Exception("C_LAST=" + c_last + " C_D_ID=" + d_id + " C_W_ID=" + w_id + " not found!");
                }
                namecnt = rs.getLong("namecnt");
                rs.close();
                rs = null;

                PreparedStatement ps66 = con.prepareStatement(
                        "SELECT c_balance, c_first, c_middle, c_id " +
                        "  FROM tpcc_customer " +
                        " WHERE c_last = ? " +
                        "   AND c_d_id = ? " +
                        "   AND c_w_id = ? " +
                        " ORDER BY c_first ASC");
                ps66.setString(1, c_last);
                ps66.setString(2, d_id);
                ps66.setString(3, w_id);
//
//
                rs = ps66.executeQuery();
                if (!rs.next()) {
                    throw new Exception("C_LAST=" + c_last + " C_D_ID=" + d_id + " C_W_ID=" + w_id + " not found!");
                }
                // clause 2.6.2.2 (dot 3, Case 2)
                if (namecnt % 2 == 1) {
                    namecnt++;
                }
                for (int i = 1; i < namecnt / 2; i++) {
                    rs.next();
                }
                c_id = Long.toString(rs.getLong("c_id"));
                c_first = rs.getString("c_first");
                c_middle = rs.getString("c_middle");
                c_balance = rs.getDouble("c_balance");
                rs.close();
                rs = null;
            } else {
                // clause 2.6.2.2 (dot 3, Case 1)
                PreparedStatement ps96 = con.prepareStatement(
                        "SELECT c_balance, c_first, c_middle, c_last " +
                        "  FROM tpcc_customer " +
                        " WHERE c_id = ? " +
                        "   AND c_d_id = ? " +
                        "   AND c_w_id = ? ");
                ps96.setString(1, c_id);
                ps96.setString(2, d_id);
                ps96.setString(3, w_id);
                //  
                //
                ResultSet rs = ps96.executeQuery();
                if (!rs.next()) {
                    throw new Exception("C_ID=" + c_id + " C_D_ID=" + d_id + " C_W_ID=" + w_id + " not found!");
                }
                c_last = rs.getString("c_last");
                c_first = rs.getString("c_first");
                c_middle = rs.getString("c_middle");
                c_balance = rs.getDouble("c_balance");
                rs.close();
                rs = null;
            }

            // clause 2.6.2.2 (dot 4)
            PreparedStatement ps122 = con.prepareStatement(
                    "SELECT * FROM " +
                    "   (SELECT o_id, o_carrier_id, o_entry_d " +
                    "      FROM tpcc_orderr " +
                    "     WHERE o_w_id = ? " +
                    "       AND o_d_id = ? " +
                    "       AND o_c_id = ? " +
                    "     ORDER BY o_id DESC) " +
                    " WHERE rownum = 1");
            //  
            ps122.setString(1, w_id);
            ps122.setString(2, d_id);
            ps122.setString(3, c_id);
            ResultSet rs = ps122.executeQuery();
            if (rs.next()) {
                o_id = rs.getLong("o_id");
                o_carrier_id = rs.getLong("o_carrier_id");
                entdate = rs.getDate("o_entry_d");
            }
            rs.close();
            rs = null;
            // clause 2.6.2.2 (dot 5)
            PreparedStatement ps143 = con.prepareStatement(
                    "SELECT ol_i_id, ol_supply_w_id, ol_quantity," +
                    "       ol_amount, ol_delivery_d" +
                    "  FROM tpcc_order_line" +
                    " WHERE ol_o_id = ? " +
                    "   AND ol_d_id = ? " +
                    "   AND ol_w_id = ? ");
            ps143.setLong(1, o_id);
            ps143.setString(2, d_id);
            ps143.setString(3, w_id);
            //
            //
            rs = ps143.executeQuery();
            while (rs.next()) {
                StringBuffer orderLine = new StringBuffer();
                orderLine.append("[");
                long ol_supply_w_id = rs.getLong("ol_supply_w_id");
                orderLine.append(" - ");
                long ol_i_id = rs.getLong("ol_i_id");
                orderLine.append(" - ");
                long ol_quantity = rs.getLong("ol_quantity");
                orderLine.append(" - ");
                double ol_amount = rs.getDouble("ol_amount");
                orderLine.append(" - ");
                Date ol_delivery_d = new GregorianCalendar(9999, 12, 31).getTime();
                if (rs.getDate("ol_delivery_d") != null) {
                    ol_delivery_d.setTime(rs.getDate("ol_delivery_d").getTime());
                }
                orderLine.append("]");

                orderLines.add(new OrderLine(ol_supply_w_id, ol_i_id, ol_quantity, ol_amount, ol_delivery_d));
            }
            rs.close();
            rs = null;
            con.commit();
            if (o_id != -1) {
                Order order = new Order(o_id, c_id, new Date(entdate.getTime()), o_carrier_id, orderLines);
                return order;
            }
        } catch (Exception e) {
//            printMessage("An error occurred!");
            Logging.trace(" ORDER STATUS  EXCEPTION " + e.toString());
        } finally {
            Database.relaseConnection(con);
        }
        return null;
    }
}
