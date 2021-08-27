package pt.uc.dei.tpcc.tpccWS.versions;

import pt.uc.dei.tpcc.tpccWS.object.Order;
import pt.uc.dei.tpcc.tpccWS.object.OrderLine;
import pt.uc.dei.tpcc.util.Database;
import pt.uc.dei.tpcc.util.Logging;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class OrderStatus_VxA {

    public Order orderStatusTransaction(String w_id, String d_id, String c_id, String c_last, boolean c_by_name) {
        long namecnt, o_id = -1, o_carrier_id = -1;
        double c_balance;
        String c_first, c_middle;
        java.sql.Date entdate = null;
        List<OrderLine> orderLines = new ArrayList<OrderLine>();
        Connection con = Database.pickConnection();
        try {
            Statement stmt = Database.createStatement(con);
            if (c_by_name) {
                StringBuffer query = new StringBuffer();
                query.append("SELECT count(c_id) AS namecnt");
                query.append(" FROM tpcc_customer");
                query.append(" WHERE c_last = \'");
                query.append(c_last);
                query.append("\' AND c_d_id = '");
                query.append(d_id);
                query.append("' AND c_w_id = '");
                query.append(w_id);
                query.append("'");
                //  printMessage(query.toString());
                ResultSet rs = stmt.executeQuery(query.toString());
                if (!rs.next()) {
                    throw new Exception("C_LAST=" + c_last + " C_D_ID=" + d_id + " C_W_ID=" + w_id + " not found!");
                }
                namecnt = rs.getLong("namecnt");
                rs.close();
                rs = null;

                // clause 2.6.2.2 (dot 3, Case 2)
                query = new StringBuffer();
                query.append("SELECT c_balance, c_first, c_middle, c_id");
                query.append(" FROM tpcc_customer");
                query.append(" WHERE c_last = \'");
                query.append(c_last);
                query.append("\' AND c_d_id = '");
                query.append(d_id);
                query.append("' AND c_w_id = '");
                query.append(w_id);
                query.append("' ORDER BY c_first ASC");
                //  printMessage(query.toString());
                rs = stmt.executeQuery(query.toString());
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
                StringBuffer query = new StringBuffer();
                query.append("SELECT c_balance, c_first, c_middle, c_last");
                query.append(" FROM tpcc_customer");
                query.append(" WHERE c_id = '");
                query.append(c_id);
                query.append("' AND c_d_id = '");
                query.append(d_id);
                query.append("' AND c_w_id = '");
                query.append(w_id);
                query.append("'");
                //  printMessage(query.toString());
                ResultSet rs = stmt.executeQuery(query.toString());
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
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM (");
            query.append("SELECT o_id, o_carrier_id, o_entry_d");
            query.append(" FROM tpcc_orderr");
            query.append(" WHERE o_w_id = '");
            query.append(w_id);
            query.append("' AND o_d_id = '");
            query.append(d_id);
            query.append("' AND o_c_id = '");
            query.append(c_id);
            query.append("' ORDER BY o_id DESC");
            query.append(") WHERE rownum = 1");
            //  printMessage(query.toString());
            ResultSet rs = stmt.executeQuery(query.toString());
            if (rs.next()) {
                o_id = rs.getLong("o_id");
                o_carrier_id = rs.getLong("o_carrier_id");
                entdate = rs.getDate("o_entry_d");
            }
            rs.close();
            rs = null;
            // clause 2.6.2.2 (dot 5)
            query = new StringBuffer();
            query.append("SELECT ol_i_id, ol_supply_w_id, ol_quantity,");
            query.append(" ol_amount, ol_delivery_d");
            query.append(" FROM tpcc_order_line");
            query.append(" WHERE ol_o_id = ");
            query.append(o_id);
            query.append(" AND ol_d_id = '");
            query.append(d_id);
            query.append("' AND ol_w_id = '");
            query.append(w_id);
            query.append("'");
            //  printMessage(query.toString());
            rs = stmt.executeQuery(query.toString());
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
//            StringBuffer terminalMessage = new StringBuffer();
//            System.out.println(" Date: ");
//            System.out.println(new Date());
//            System.out.println("\n\n Warehouse: ");
//            System.out.println(w_id);
//            System.out.println("\n District:  ");
//            System.out.println(d_id);
//            System.out.println("\n\n Customer:  ");
//            System.out.println(c_id);
//            System.out.println("\n   Name:    ");
//            System.out.println(c_first);
//            System.out.println(" ");
//            System.out.println(c_middle);
//            System.out.println(" ");
//            System.out.println(c_last);
//            System.out.println("\n   Balance: ");
//            System.out.println(c_balance);
//            System.out.println("\n\n");
            if (o_id != -1) {
//                System.out.println(" Order-Number: ");
//                System.out.println(o_id);
//                System.out.println("\n    Entry-Date: ");
//                System.out.println(entdate);
//                System.out.println("\n    Carrier-Number: ");
//                System.out.println(o_carrier_id);
//                System.out.println("\n\n");
                Order order = new Order(o_id, c_id, new Date(entdate.getTime()), o_carrier_id, orderLines);
//                if (orderLines.size() != 0) {
//                    System.out.println(" [Supply_W - Item_ID - Qty - Amount - Delivery-Date]\n");
//                    for (OrderLine orderline : orderLines) {
//                        System.out.println(orderline);
//                    }
//                }
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
