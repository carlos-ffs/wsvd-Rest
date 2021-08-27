package pt.uc.dei.tpcc.tpccWS.versions;

import pt.uc.dei.tpcc.tpccWS.object.ShortOrder;
import pt.uc.dei.tpcc.util.Database;
import pt.uc.dei.tpcc.util.Logging;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class NewOrder_Vx056 {

    public final static String ORIGINAL = "ORIGINAL";

    public ShortOrder newOrderTransaction(String w_id, String d_id, String c_id, int o_ol_cnt, int o_all_local, long[] itemIDs, long[] supplierWarehouseIDs, long[] orderQuantities) {
        double c_discount, w_tax, d_tax = 0, i_price;
        long d_next_o_id, o_id = -1, s_quantity;
        String c_last = null, c_credit = null, i_name, i_data, s_data;
        String s_dist_01, s_dist_02, s_dist_03, s_dist_04, s_dist_05;
        String s_dist_06, s_dist_07, s_dist_08, s_dist_09, s_dist_10, ol_dist_info = null;
        double[] itemPrices = new double[o_ol_cnt];
        double[] orderLineAmounts = new double[o_ol_cnt];
        String[] itemNames = new String[o_ol_cnt];
        long[] stockQuantities = new long[o_ol_cnt];
        char[] brandGeneric = new char[o_ol_cnt];
        long ol_supply_w_id, ol_i_id, ol_quantity;
        int s_remote_cnt_increment;
        double ol_amount, total_amount = 0;
        boolean newOrderRowInserted;
        Connection con = Database.pickConnection();
        try {
            Statement stmt = Database.createStatement(con);
            // see clause 2.4.2.2 (dot 3 & 5)
            StringBuffer query = new StringBuffer();
            query.append("SELECT c_discount, c_last, c_credit, w_tax");
            query.append(" FROM tpcc_customer, tpcc_warehouse");
            query.append(" WHERE w_id = '");
            query.append(w_id);
            query.append("' AND c_w_id = '");
            query.append(w_id);
            query.append("' AND c_d_id = '");
            query.append(d_id);
            query.append("' AND c_id = '");
            query.append(c_id);
            query.append("'");
            //  printMessage(query.toString());
            ResultSet rs = stmt.executeQuery(query.toString());
            if (!rs.next()) {
                throw new Exception("W_ID=" + w_id + " C_D_ID=" + d_id + " C_ID=" + c_id + " not found!");
            }
            c_discount = rs.getDouble("c_discount");
            c_last = rs.getString("c_last");
            c_credit = rs.getString("c_credit");
            w_tax = rs.getDouble("w_tax");
            rs.close();
            rs = null;

            int j = 0;
            newOrderRowInserted = false;
            // see clause 2.4.2.2 (dot 4)
            // j++ < 10 ????? (� voir, mais pas necessaire)
            while (!newOrderRowInserted && j++ < 10) {
                PreparedStatement ps81 = con.prepareStatement(
                        "SELECT d_next_o_id, d_tax " +
                        "  FROM tpcc_district " +
                        " WHERE d_id = ? " +
                        "   AND d_w_id = ? ");
                ps81.setString(1, d_id);
                ps81.setString(2, w_id);
                //
                //
                rs = ps81.executeQuery();
                if (!rs.next()) {
                    throw new Exception("D_ID=" + d_id + " D_W_ID=" + w_id + " not found!");
                }
                d_next_o_id = rs.getLong("d_next_o_id");
                d_tax = rs.getDouble("d_tax");
                rs.close();
                rs = null;

                o_id = d_next_o_id;

                try {
                    PreparedStatement ps103 = con.prepareStatement(
                            "INSERT INTO tpcc_new_order (no_o_id, no_d_id, no_w_id)" +
                            " VALUES (?, ?, ?)");

                    ps103.setLong(1, o_id);
                    ps103.setString(2, d_id);
                    ps103.setString(3, w_id);
                    //
                    //
                    //
                    ps103.executeUpdate();
                    newOrderRowInserted = true;
                } catch (SQLException e2) {
//                    printMessage("The row was already on table tpcc_new_order. Restarting..." + e2.getMessage());
                }
            }


            PreparedStatement ps119 = con.prepareStatement(
                    "UPDATE tpcc_district SET d_next_o_id = d_next_o_id + 1" +
                    " WHERE d_id = ?" +
                    "  AND d_w_id = ?");
            ps119.setString(1, d_id);
            ps119.setString(2, w_id);
            //  
            //  
            int result = ps119.executeUpdate();
            if (result == 0) {
                throw new Exception("D_ID=" + d_id + " D_W_ID=" + w_id + " not found!");
            }


            PreparedStatement ps144 = con.prepareStatement(
                    "INSERT INTO tpcc_orderr (o_id, o_d_id, o_w_id, o_c_id, o_entry_d," +
                    "                           o_ol_cnt, o_all_local, o_carrier_id)" +
                    "                 VALUES (?, ?, ?, ?, SYSDATE , ?, ?, NULL) ");
//
            //
            //
            ps144.setLong(1, o_id);
            ps144.setString(2, d_id);
            ps144.setString(3, w_id);
            ps144.setString(4, c_id);
            ps144.setInt(5, o_ol_cnt);
            ps144.setInt(6, o_all_local);
            //
            //
            //
            //
            //
            //
            ps144.executeUpdate();

            // see clause 2.4.2.2 (dot 8)
            for (int ol_number = 1; ol_number <= o_ol_cnt; ol_number++) {
                ol_supply_w_id = supplierWarehouseIDs[ol_number - 1];
                ol_i_id = itemIDs[ol_number - 1];
                ol_quantity = orderQuantities[ol_number - 1];
                // clause 2.4.2.2 (dot 8.1)
                PreparedStatement ps158 = con.prepareStatement(
                        "SELECT i_price, i_name , i_data " +
                        "  FROM tpcc_item " +
                        " WHERE i_id = ? ");
                ps158.setLong(1, ol_i_id);
                //
                rs = ps158.executeQuery();
                if (!rs.next()) {
                    throw new IllegalAccessException("I_ID=" + ol_i_id + " not found!");
                }
                i_price = rs.getDouble("i_price");
                i_name = rs.getString("i_name");
                i_data = rs.getString("i_data");
                rs.close();
                rs = null;

                itemPrices[ol_number - 1] = i_price;
                itemNames[ol_number - 1] = i_name;
                // clause 2.4.2.2 (dot 8.2)
                PreparedStatement ps180 = con.prepareStatement(
                        "SELECT s_quantity, s_data," +
                        "  s_dist_01, s_dist_02, s_dist_03, s_dist_04, s_dist_05," +
                        " s_dist_06, s_dist_07, s_dist_08, s_dist_09, s_dist_10" +
                        "  FROM tpcc_stock" +
                        " WHERE s_i_id = ? " +
                        "   AND s_w_id = ? ");
                ps180.setLong(1, ol_i_id);
                ps180.setLong(1, ol_supply_w_id);
                rs = ps180.executeQuery();
                if (!rs.next()) {
                    throw new Exception("I_ID=" + ol_i_id + " not found!");
                }
                s_quantity = rs.getLong("s_quantity");
                s_data = rs.getString("s_data");
                s_dist_01 = rs.getString("s_dist_01");
                s_dist_02 = rs.getString("s_dist_02");
                s_dist_03 = rs.getString("s_dist_03");
                s_dist_04 = rs.getString("s_dist_04");
                s_dist_05 = rs.getString("s_dist_05");
                s_dist_06 = rs.getString("s_dist_06");
                s_dist_07 = rs.getString("s_dist_07");
                s_dist_08 = rs.getString("s_dist_08");
                s_dist_09 = rs.getString("s_dist_09");
                s_dist_10 = rs.getString("s_dist_10");
                rs.close();
                rs = null;


                stockQuantities[ol_number - 1] = s_quantity;
                // clause 2.4.2.2 (dot 8.2)
                if (s_quantity - ol_quantity >= 10) {
                    s_quantity -= ol_quantity;
                } else {
                    s_quantity += -ol_quantity + 91;
                }

                if (ol_supply_w_id == Long.parseLong(w_id)) {
                    s_remote_cnt_increment = 0;
                } else {
                    s_remote_cnt_increment = 1;
                }
                // clause 2.4.2.2 (dot 8.2)
                PreparedStatement ps228 = con.prepareStatement(
                        "UPDATE tpcc_stock " +
                        "   SET s_quantity = ?, s_ytd = s_ytd + ?, s_remote_cnt = s_remote_cnt + ?, " +
                        "       s_order_cnt = s_order_cnt + 1 " +
                        " WHERE s_i_id = ? " +
                        "   AND s_w_id = ? ");
                ps228.setLong(1, s_quantity);
                ps228.setLong(2, ol_quantity);
                ps228.setInt(3, s_remote_cnt_increment);
                ps228.setLong(4, ol_i_id);
                ps228.setLong(5, ol_supply_w_id);
                //  
                //
                //  
                result = ps228.executeUpdate();//NOT REACHED
                if (result == 0) {
                    throw new Exception("S_I_ID=" + ol_i_id + " S_W_ID=" + ol_supply_w_id + " not found!");
                }

                // clause 2.4.2.2 (dot 8.3)
                ol_amount = ol_quantity * i_price;
                orderLineAmounts[ol_number - 1] = ol_amount;
                total_amount += ol_amount;
                // clause 2.4.2.2 (dot 8.4)
                if (i_data.indexOf(ORIGINAL) != -1 && s_data.indexOf(ORIGINAL) != -1) {
                    brandGeneric[ol_number - 1] = 'B';
                } else {
                    brandGeneric[ol_number - 1] = 'G';
                }

                switch (Integer.parseInt(d_id)) {
                    case 1:
                        ol_dist_info = s_dist_01;
                        break;
                    case 2:
                        ol_dist_info = s_dist_02;
                        break;
                    case 3:
                        ol_dist_info = s_dist_03;
                        break;
                    case 4:
                        ol_dist_info = s_dist_04;
                        break;
                    case 5:
                        ol_dist_info = s_dist_05;
                        break;
                    case 6:
                        ol_dist_info = s_dist_06;
                        break;
                    case 7:
                        ol_dist_info = s_dist_07;
                        break;
                    case 8:
                        ol_dist_info = s_dist_08;
                        break;
                    case 9:
                        ol_dist_info = s_dist_09;
                        break;
                    case 10:
                        ol_dist_info = s_dist_10;
                        break;
                }
                // clause 2.4.2.2 (dot 8.5)
                PreparedStatement ps301 = con.prepareStatement(
                        "INSERT INTO tpcc_order_line " +
                        "     (ol_o_id, ol_d_id, ol_w_id, ol_number, ol_i_id, " +
                        "      ol_supply_w_id, ol_quantity, ol_amount, " +
                        "      ol_dist_info, ol_delivery_d)" +
                        " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NULL)");
                //
                //
                //
                //
                ps301.setLong(1, o_id);
                ps301.setString(2, d_id);
                ps301.setString(3, w_id);
                ps301.setInt(4, ol_number);
                ps301.setLong(5, ol_i_id);
                ps301.setLong(6, ol_supply_w_id);
                ps301.setLong(7, ol_quantity);
                ps301.setDouble(8, ol_amount);
                ps301.setString(9, ol_dist_info);
                //
                //
                //
                //

                ps301.executeUpdate(); //NOT REACHED
            }
            // clause 2.4.2.2 (dot 9)
            total_amount *= (1 - c_discount) * (1 + w_tax + d_tax);
            // clause 2.4.2.2 (dot 10)
            con.commit();
            // clause 2.4.3.3
//            StringBuffer terminalMessage = new StringBuffer();
//            terminalMessage(terminalMessage.toString());
            return new ShortOrder(o_id, total_amount);
        } catch (Exception e) {
            if (e instanceof IllegalAccessException) {
//                StringBuffer terminalMessage = new StringBuffer();
//                terminalMessage(terminalMessage.toString());
            } else {
                Logging.trace(e.toString());
            }
            try {
                Logging.trace("Performing ROLLBACK...");
//                conn.rollback();
            } catch (Exception e1) {
                Logging.trace(e1.toString());
            }
        } finally {
            Database.relaseConnection(con);
        }
        return null;
    }
}
