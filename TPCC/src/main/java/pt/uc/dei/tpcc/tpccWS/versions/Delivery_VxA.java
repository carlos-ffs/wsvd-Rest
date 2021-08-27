
package pt.uc.dei.tpcc.tpccWS.versions;

import pt.uc.dei.tpcc.tpccWS.object.DeliveryResult;
import pt.uc.dei.tpcc.tpccWS.object.DistrictDelivery;
import pt.uc.dei.tpcc.util.Database;
import pt.uc.dei.tpcc.util.Logging;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class Delivery_VxA {

    public DeliveryResult deliveryTransaction(String w_id, String o_carrier_id) {
        long d_id, no_o_id, c_id;
        double ol_total;
        long[] orderIDs;
        int skippedDeliveries = 0;
        boolean newOrderRemoved;
        Connection con = Database.pickConnection();
        StringBuffer query = null;
        try {
            // clause 2.7.4.1
            orderIDs = new long[10];
            Statement stmt = Database.createStatement(con);
            for (d_id = 1; d_id <= 10; d_id++) {
                do {
                    no_o_id = -1;
                    query = new StringBuffer();
                    // clause 2.7.4.2 (dot 3)
                    query.append("SELECT * FROM (");
                    query.append("SELECT no_o_id");
                    query.append(" FROM tpcc_new_order");
                    query.append(" WHERE no_d_id = ");
                    query.append(d_id);
                    query.append(" AND no_w_id = '");
                    query.append(w_id);
                    query.append("' ORDER BY no_o_id ASC");
                    query.append(") WHERE rownum = 1");
                    try {
                        ResultSet rs = stmt.executeQuery(query.toString());
                        if (rs.next()) {
                            no_o_id = rs.getLong("no_o_id");
                        }
                        orderIDs[(int) d_id - 1] = no_o_id;
                        rs.close();
                        rs = null;
                    } catch (SQLException e) {
                        //_log.error(query.toString()+" : "+e.getMessage());
                        throw new Exception(query.toString() + " : " + e.getMessage());
                    }

                    newOrderRemoved = false;
                    if (no_o_id != -1) {
                        query = new StringBuffer();
                        query.append("DELETE FROM tpcc_new_order");
                        query.append(" WHERE no_d_id = ");
                        query.append(d_id);
                        query.append(" AND no_w_id = '");
                        query.append(w_id);
                        query.append("' AND no_o_id = ");
                        query.append(no_o_id);
//                       //  printMessage(query.toString());
                        try {
                            int result = stmt.executeUpdate(query.toString());
                            if (result > 0) {
                                newOrderRemoved = true;
                            }
                        } catch (SQLException e) {
                            //_log.error(query.toString()+" : "+e.getMessage());
                            throw new Exception(query.toString() + " : " + e.getMessage());
                        }
                    }
                } while (no_o_id != -1 && !newOrderRemoved);

                if (no_o_id != -1) {
                    query = new StringBuffer();
                    query.append("SELECT o_c_id");
                    query.append(" FROM tpcc_orderr");
                    query.append(" WHERE o_id = ");
                    query.append(no_o_id);
                    query.append(" AND o_d_id = ");
                    query.append(d_id);
                    query.append(" AND o_w_id = '");
                    query.append(w_id);
                    query.append("'");
//                   //  printMessage(query.toString());
                    try {
                        ResultSet rs = stmt.executeQuery(query.toString());
                        if (!rs.next()) {
                            //_log.error(query.toString()+" not found ");
                            throw new Exception("O_ID=" + no_o_id + " O_D_ID=" + d_id + " O_W_ID='" + w_id + "' not found!");
                        }
                        c_id = rs.getLong("o_c_id");
                        rs.close();
                        rs = null;
                    } catch (SQLException e) {
                        //_log.error(query.toString()+" : "+e.getMessage());
                        throw new Exception(query.toString() + " : " + e.getMessage());
                    }

                    query = new StringBuffer();
                    query.append("UPDATE tpcc_orderr SET o_carrier_id = '");
                    query.append(o_carrier_id);
                    query.append("' WHERE o_id = ");
                    query.append(no_o_id);
                    query.append(" AND o_d_id = ");
                    query.append(d_id);
                    query.append(" AND o_w_id = '");
                    query.append(w_id);
                    query.append("'");
//                   //  printMessage(query.toString());
                    int result = stmt.executeUpdate(query.toString());
                    if (result == 0) {
                        //_log.error(query.toString()+" not found ");
                        throw new Exception("O_ID=" + no_o_id + " O_D_ID=" + d_id + " O_W_ID=" + w_id + " not found!");
                    }
                    query = new StringBuffer();
                    query.append("UPDATE tpcc_order_line SET ol_delivery_d =  SYSDATE ");
                    query.append(" WHERE ol_o_id = ");
                    query.append(no_o_id);
                    query.append(" AND ol_d_id = ");
                    query.append(d_id);
                    query.append(" AND ol_w_id = '");
                    query.append(w_id);
                    query.append("'");
//                   //  printMessage(query.toString());
                    result = stmt.executeUpdate(query.toString());
                    if (result == 0) {
                        //_log.error(query.toString()+" not found ");
                        throw new Exception("OL_O_ID=" + no_o_id + " OL_D_ID=" + d_id + " OL_W_ID=" + w_id + " not found!");
                    }
                    query = new StringBuffer();
                    query.append("SELECT SUM(ol_amount) AS ol_total");
                    query.append(" FROM tpcc_order_line");
                    query.append(" WHERE ol_o_id = ");
                    query.append(no_o_id);
                    query.append(" AND ol_d_id = ");
                    query.append(d_id);
                    query.append(" AND ol_w_id = '");
                    query.append(w_id);
                    query.append("'");
                    //  printMessage(query.toString());
                    ResultSet rs = stmt.executeQuery(query.toString());
                    if (!rs.next()) {
                        //_log.error(query.toString()+" not found");
                        throw new Exception("OL_O_ID=" + no_o_id + " OL_D_ID=" + d_id + " OL_W_ID=" + w_id + " not found!");
                    }
                    ol_total = rs.getDouble("ol_total");
                    rs.close();
                    rs = null;


                    query = new StringBuffer();
                    query.append("UPDATE tpcc_customer SET c_balance = c_balance + ");
                    query.append(ol_total);
                    query.append(", c_delivery_cnt = c_delivery_cnt + 1");
                    query.append(" WHERE c_id = ");
                    query.append(c_id);
                    query.append(" AND c_d_id = ");
                    query.append(d_id);
                    query.append(" AND c_w_id = '");
                    query.append(w_id);
                    query.append("'");
                    //  printMessage(query.toString());
                    result = stmt.executeUpdate(query.toString());
                    if (result == 0) {
                        //_log.error(query.toString()+" not found");
                        throw new Exception("C_ID=" + c_id + " C_W_ID=" + w_id + " C_D_ID=" + d_id + " not found!");
                    }
                }
            }
            con.commit();
            stmt.close();
//            System.out.println("\n\n Warehouse: ");
//            System.out.println(w_id);
//            System.out.println("\n Carrier:   ");
//            System.out.println(o_carrier_id);
//            System.out.println("\n\n Delivered Orders\n");

            List<DistrictDelivery> districtDeliveryList = new ArrayList<DistrictDelivery>(10);
            for (int i = 1; i <= 10; i++) {
                districtDeliveryList.add(new DistrictDelivery(i, orderIDs[i - 1]));
                if (orderIDs[i - 1] >= 0) {
//                    System.out.println("  District ");
//                    System.out.println(i < 10 ? " " : "");
//                    System.out.println(i);
//                    System.out.println(": Order number ");
//                    System.out.println(orderIDs[i - 1]);
//                    System.out.println(" was delivered.\n");
                } else {// clause 2.7.4.2 (dot 3) : delivery skipped
//                    System.out.println("  District ");
//                    System.out.println(i < 10 ? " " : "");
//                    System.out.println(i);
//                    System.out.println(": No orders to be delivered.\n");
                    skippedDeliveries++;
                }
            }
            return new DeliveryResult(w_id, o_carrier_id, skippedDeliveries, districtDeliveryList);
        } catch (Exception e) {
            Logging.trace(" deliveryTransaction : " + e.getMessage());
//            error("DELIVERY");
//            logException(e);
            try {
//                terminalMessage("Performing ROLLBACK...");
                con.rollback();
            } catch (Exception e1) {
                Logging.trace(" error rollback : " + e1.getMessage());
//                error("DELIVERY-ROLLBACK");
//                logException(e1);
            }
        } finally {
            Database.relaseConnection(con);
        }
        return null;
    }
}
