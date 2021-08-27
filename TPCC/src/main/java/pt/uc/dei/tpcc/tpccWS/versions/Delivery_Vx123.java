package pt.uc.dei.tpcc.tpccWS.versions;

import pt.uc.dei.tpcc.tpccWS.object.DeliveryResult;
import pt.uc.dei.tpcc.tpccWS.object.DistrictDelivery;
import pt.uc.dei.tpcc.util.Database;
import pt.uc.dei.tpcc.util.Logging;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class Delivery_Vx123 {

    public DeliveryResult deliveryTransaction(String w_id, String o_carrier_id) {
        long d_id, no_o_id, c_id;
        double ol_total;
        long[] orderIDs;
        int skippedDeliveries = 0;
        boolean newOrderRemoved;
        Connection con = Database.pickConnection();
//        StringBuffer query = null;
        try {
            // clause 2.7.4.1
            orderIDs = new long[10];
//            Statement stmt = Database.createStatement(con);
            PreparedStatement pstatement = con.prepareStatement("SELECT * FROM " +
                    "(SELECT no_o_id " +
                    "   FROM tpcc_new_order " +
                    "  WHERE no_d_id = ? " +
                    "    AND no_w_id = ? " +
                    "  ORDER BY no_o_id ASC" +
                    ")WHERE rownum = 1");
            for (d_id = 1; d_id <= 10; d_id++) {
                do {
                    no_o_id = -1;
                    pstatement.setLong(1, d_id);
                    pstatement.setString(2, w_id);
                    try {
                        // ...
                        ResultSet rs = pstatement.executeQuery();
                        if (rs.next()) {
                            no_o_id = rs.getLong("no_o_id");
                        }
                        orderIDs[(int) d_id - 1] = no_o_id;
                        rs.close();
                        rs = null;
                    } catch (SQLException e) {
                        //_log.error(query.toString()+" : "+e.getMessage());
                        throw new Exception(pstatement.toString() + " : " + e.getMessage());
                    }

                    newOrderRemoved = false;
                    if (no_o_id != -1) {
                        PreparedStatement psdelete = con.prepareStatement("DELETE FROM tpcc_new_order  " +
                                " WHERE no_d_id = ? " +
                                "   AND no_w_id = ? " +
                                "   AND no_o_id = ? ");
                        psdelete.setLong(1, d_id);
                        psdelete.setString(2, w_id);
                        psdelete.setLong(3, no_o_id);
                        //
                        //
                        try {
                            int result = psdelete.executeUpdate();
                            if (result > 0) {
                                newOrderRemoved = true;
                            }
                        } catch (SQLException e) {
                            //_log.error(query.toString()+" : "+e.getMessage());
                            throw new Exception(psdelete.toString() + " : " + e.getMessage());
                        }
                    }
                } while (no_o_id != -1 && !newOrderRemoved);

                if (no_o_id != -1) {
                    PreparedStatement ps3 = con.prepareStatement(
                            "SELECT o_c_id " +
                            "  FROM tpcc_orderr" +
                            " WHERE o_id = ?  " +
                            "   AND o_d_id = ?" +
                            "   AND o_w_id = ? ");
                    ps3.setLong(1, no_o_id);
                    ps3.setLong(2, d_id);
                    ps3.setString(3, w_id);
//
//
                    try {
                        ResultSet rs = ps3.executeQuery();
                        if (!rs.next()) {
                            //_log.error(query.toString()+" not found ");
                            throw new Exception("O_ID=" + no_o_id + " O_D_ID=" + d_id + " O_W_ID='" + w_id + "' not found!");
                        }
                        c_id = rs.getLong("o_c_id");
                        rs.close();
                        rs = null;
                    } catch (SQLException e) {
                        //_log.error(query.toString()+" : "+e.getMessage());
                        throw new Exception(ps3.toString() + " : " + e.getMessage());
                    }
                    Statement stmt = Database.createStatement(con);
                    StringBuffer query = new StringBuffer();
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
                        throw new Exception("O_ID=" + no_o_id + " O_D_ID=" + d_id + " O_W_ID=" + w_id + " not found!");
                    }
                    stmt.close();
                    PreparedStatement ps5 = con.prepareStatement("UPDATE tpcc_order_line " +
                            "   SET ol_delivery_d =  SYSDATE " +
                            " WHERE ol_o_id = ? " +
                            "   AND ol_d_id = ? " +
                            "   AND ol_w_id = ? ");
                    ps5.setLong(1, no_o_id);
                    ps5.setLong(2, d_id);
                    ps5.setString(1, w_id);
                    //  printMessage(query.toString());
                    //
                    result = ps5.executeUpdate();
                    if (result == 0) {
                        //_log.error(query.toString()+" not found ");
                        throw new Exception("OL_O_ID=" + no_o_id + " OL_D_ID=" + d_id + " OL_W_ID=" + w_id + " not found!");
                    }
                    PreparedStatement ps6 = con.prepareStatement("SELECT SUM(ol_amount) AS ol_total" +
                            " FROM tpcc_order_line " +
                            " WHERE ol_o_id = ? " +
                            "   AND ol_d_id = ? " +
                            "   AND ol_w_id = ? ");
                    ps6.setLong(1, no_o_id);
                    ps6.setLong(2, d_id);
                    ps6.setString(1, w_id);
                    //
                    //  printMessage(query.toString());
                    //
                    ResultSet rs = ps6.executeQuery();
                    if (!rs.next()) {
                        //_log.error(query.toString()+" not found");
                        throw new Exception("OL_O_ID=" + no_o_id + " OL_D_ID=" + d_id + " OL_W_ID=" + w_id + " not found!");
                    }
                    ol_total = rs.getDouble("ol_total");
                    rs.close();
                    rs = null;
                    //
                    PreparedStatement ps7 = con.prepareStatement("UPDATE tpcc_customer SET c_balance = c_balance + ? " +
                            ", c_delivery_cnt = c_delivery_cnt + 1" +
                            " WHERE c_id = ? " +
                            " AND c_d_id = ? " +
                            " AND c_w_id = ? ");
                    //
                    //
                    //
                    //
                    ps7.setDouble(1, ol_total);
                    ps7.setLong(2, c_id);
                    ps7.setLong(3, d_id);
                    ps7.setString(4, w_id);
                    result = ps7.executeUpdate();
                    if (result == 0) {
                        //_log.error(query.toString()+" not found");
                        throw new Exception("C_ID=" + c_id + " C_W_ID=" + w_id + " C_D_ID=" + d_id + " not found!");
                    }
                }
            }
            con.commit();
            pstatement.close();
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
            try {
                con.rollback();
            } catch (Exception e1) {
                Logging.trace(" error rollback : " + e1.getMessage());
            }
        } finally {
            Database.relaseConnection(con);
        }
        return null;
    }
}
