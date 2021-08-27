package pt.uc.dei.tpcc.tpccWS.versions;
import pt.uc.dei.tpcc.tpccWS.object.PaymentResult;
import pt.uc.dei.tpcc.util.Database;
import pt.uc.dei.tpcc.util.Logging;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class Payment_Vx212 {

    public PaymentResult paymentTransaction(String w_id, String c_w_id, double h_amount, String d_id, String c_d_id, String c_id, String c_last, boolean c_by_name) {
        String w_street_1, w_street_2, w_city, w_state, w_zip, w_name;
        String d_street_1, d_street_2, d_city, d_state, d_zip, d_name;
        long namecnt;
        String c_first, c_middle, c_street_1, c_street_2, c_city, c_state, c_zip;
        String c_phone, c_credit = null, c_data = null, c_new_data, h_data;
        double c_credit_lim, c_discount, c_balance = 0;
        java.sql.Date c_since;
        int result;
//        StringBuffer query = null;
        Connection con = Database.pickConnection();
        try {
            PreparedStatement ps43 = con.prepareStatement(
                    "UPDATE tpcc_warehouse " +
                    "   SET w_ytd = w_ytd + ?  " +
                    " WHERE w_id = ? ");
            ps43.setDouble(1, h_amount);
            ps43.setString(2, w_id);
            //
            //
            try {
                result = ps43.executeUpdate();
            } catch (SQLException e) {
                throw new Exception("paymentTransaction SQLException " + ps43.toString() + " :" + e.getMessage());
            }
            if (result == 0) {
                throw new Exception("W_ID=" + w_id + " not found!");
            }
            PreparedStatement ps57 = con.prepareStatement(
                    "SELECT w_street_1, w_street_2, w_city, w_state, w_zip, w_name" +
                    "  FROM tpcc_warehouse" +
                    " WHERE w_id = ? ");
            ps57.setString(1, w_id);
            //
            //
            ResultSet rs = ps57.executeQuery();
            if (!rs.next()) {
                throw new Exception("W_ID=" + w_id + " not found!");
            }
            w_street_1 = rs.getString("w_street_1");
            w_street_2 = rs.getString("w_street_2");
            w_city = rs.getString("w_city");
            w_state = rs.getString("w_state");
            w_zip = rs.getString("w_zip");
            w_name = rs.getString("w_name");
            rs.close();
            rs = null;
            PreparedStatement ps78 = con.prepareStatement(
                    "UPDATE tpcc_district " +
                    "   SET d_ytd = d_ytd + ? " +
                    " WHERE d_w_id =  ? " +
                    "   AND d_id =  ? ");
            ps78.setDouble(1, h_amount);
            ps78.setString(2, w_id);
            ps78.setString(3, d_id);
            //
            result = ps78.executeUpdate();
            if (result == 0) {
                throw new Exception("D_ID=" + d_id + " D_W_ID=" + w_id + " not found!");
            }
            PreparedStatement ps91 = con.prepareStatement(
                    "SELECT d_street_1, d_street_2, d_city, d_state, d_zip, d_name " +
                    "  FROM tpcc_district " +
                    " WHERE d_w_id = ? " +
                    "   AND d_id = ? ");
            ps91.setString(1, w_id);
            ps91.setString(2, d_id);
            //
            //
            rs = ps91.executeQuery();
            if (!rs.next()) {
                throw new Exception("D_ID=" + d_id + " D_W_ID=" + w_id + " not found!");
            }
            d_street_1 = rs.getString("d_street_1");
            d_street_2 = rs.getString("d_street_2");
            d_city = rs.getString("d_city");
            d_state = rs.getString("d_state");
            d_zip = rs.getString("d_zip");
            d_name = rs.getString("d_name");
            rs.close();
            rs = null;
            if (c_by_name) {
                PreparedStatement ps115 = con.prepareStatement(
                        "SELECT count(c_id) AS namecnt " +
                        "  FROM tpcc_customer " +
                        " WHERE c_last = ? " +
                        "   AND c_d_id = ? " +
                        "   AND c_w_id = ? ");
                ps115.setString(1, c_last);
                ps115.setString(2, c_d_id);
                ps115.setString(3, c_w_id);
                //
                //
                rs = ps115.executeQuery();
                if (!rs.next()) {
                    throw new Exception("C_LAST=" + c_last + " C_D_ID=" + c_d_id + " C_W_ID=" + c_w_id + " not found!");
                }
                namecnt = rs.getLong("namecnt");
                rs.close();
                rs = null;
                PreparedStatement ps136 = con.prepareStatement(
                        "SELECT c_first, c_middle, c_id, " +
                        " c_street_1, c_street_2, c_city, c_state, c_zip, " +
                        " c_phone, c_credit, c_credit_lim, " +
                        " c_discount, c_balance, c_since " +
                        "  FROM tpcc_customer " +
                        " WHERE c_w_id = ? " +
                        "   AND c_d_id = ? " +
                        "   AND c_last = ? " +
                        " ORDER BY c_first ASC");
                ps136.setString(1, c_w_id);
                ps136.setString(2, c_d_id);
                ps136.setString(3, c_last);
                //
                rs = ps136.executeQuery();
                if (!rs.next()) {
                    throw new Exception("C_LAST=" + c_last + " C_D_ID=" + c_d_id + " C_W_ID=" + c_w_id + " not found!");
                }
                if (namecnt % 2 == 1) {
                    namecnt++;
                }
                for (int i = 1; i < namecnt / 2; i++) {
                    rs.next();
                }
                c_id = Long.toString(rs.getLong("c_id"));
                c_first = rs.getString("c_first");
                c_middle = rs.getString("c_middle");
                c_street_1 = rs.getString("c_street_1");
                c_street_2 = rs.getString("c_street_2");
                c_city = rs.getString("c_city");
                c_state = rs.getString("c_state");
                c_zip = rs.getString("c_zip");
                c_phone = rs.getString("c_phone");
                c_credit = rs.getString("c_credit");
                c_credit_lim = rs.getDouble("c_credit_lim");
                c_discount = rs.getDouble("c_discount");
                c_balance = rs.getDouble("c_balance");
                c_since = rs.getDate("c_since");
                rs.close();
                rs = null;
            } else {
                PreparedStatement ps177 = con.prepareStatement(
                        "SELECT c_first, c_middle, c_last, " +
                        " c_street_1, c_street_2, c_city, c_state, c_zip, " +
                        " c_phone, c_credit, c_credit_lim, " +
                        " c_discount, c_balance, c_since " +
                        "  FROM tpcc_customer " +
                        " WHERE c_w_id = ? " +
                        "   AND c_d_id = ? " +
                        "   AND c_id = ? ");
                ps177.setString(1, c_w_id);
                ps177.setString(2, c_d_id);
                ps177.setString(3, c_id);
                //
                //
                rs = ps177.executeQuery();
                if (!rs.next()) {
                    throw new Exception("C_ID=" + c_id + " C_D_ID=" + c_d_id + " C_W_ID=" + c_w_id + " not found!");
                }
                c_last = rs.getString("c_last");
                c_first = rs.getString("c_first");
                c_middle = rs.getString("c_middle");
                c_street_1 = rs.getString("c_street_1");
                c_street_2 = rs.getString("c_street_2");
                c_city = rs.getString("c_city");
                c_state = rs.getString("c_state");
                c_zip = rs.getString("c_zip");
                c_phone = rs.getString("c_phone");
                c_credit = rs.getString("c_credit");
                c_credit_lim = rs.getDouble("c_credit_lim");
                c_discount = rs.getDouble("c_discount");
                c_balance = rs.getDouble("c_balance");
                c_since = rs.getDate("c_since");
                rs.close();
                rs = null;
            }
            c_balance += h_amount;
            Logging.trace("c_last " + c_last + "   c_d_id " + c_d_id + "   c_id " + c_id + "   c_w_id " + c_w_id + "   c_credit: " + c_credit);
            if (c_credit.equals("BC")) {
                Statement stmt = Database.createStatement(con);
                StringBuffer query = new StringBuffer();
                query.append("SELECT c_data");
                query.append(" FROM tpcc_customer");
                query.append(" WHERE c_w_id = '");
                query.append(c_w_id);
                query.append("' AND c_d_id = '");
                query.append(c_d_id);
                query.append("' AND c_id = '");
                query.append(c_id).append("'");
                rs = stmt.executeQuery(query.toString());
                if (!rs.next()) {
                    throw new Exception("C_ID=" + c_id + " C_W_ID='" + c_w_id + "' C_D_ID=" + c_d_id + " not found!");
                }
                c_data = rs.getString("c_data");
                rs.close();
                stmt.close();
                rs = null;
                c_new_data = "'" + c_id + "' '" + c_d_id + "' '" + c_w_id + "' '" + d_id + "' '" + w_id + "' " + h_amount + " |";
                if (c_data.length() > c_new_data.length()) {
                    c_new_data += c_data.substring(0, c_data.length() - c_new_data.length());
                } else {
                    c_new_data += c_data;
                }
                if (c_new_data.length() > 500) {
                    c_new_data = c_new_data.substring(0, 500);
                }
                PreparedStatement ps241 = con.prepareStatement(
                        "UPDATE tpcc_customer " +
                        "   SET c_balance = ?, c_data = ? " +
                        " WHERE c_w_id = ? " +
                        "   AND c_d_id = ? " +
                        "   AND c_id = ? ");
                ps241.setDouble(1, c_balance);
                ps241.setString(2, c_new_data);
                ps241.setString(3, c_w_id);
                ps241.setString(4, c_d_id);
                ps241.setString(5, c_id);
                //
                //
                result = ps241.executeUpdate();
                if (result == 0) {
                    throw new Exception("C_ID=" + c_id + " C_W_ID=" + c_w_id + " C_D_ID=" + c_d_id + " not found!");
                }
            } else {
                PreparedStatement ps257 = con.prepareStatement(
                        "UPDATE tpcc_customer " +
                        "   SET c_balance = ?" +
                        " WHERE c_w_id = ?" +
                        "   AND c_d_id = ?" +
                        "   AND c_id = ?");
                ps257.setDouble(1, c_balance);
                ps257.setString(3, c_w_id);
                ps257.setString(4, c_d_id);
                ps257.setString(5, c_id);
                //
                result = ps257.executeUpdate();
                if (result == 0) {
                    throw new Exception("C_ID=" + c_id + " C_W_ID=" + c_w_id + " C_D_ID=" + c_d_id + " not found!");
                }
            }
            if (w_name.length() > 10) {
                w_name = w_name.substring(0, 10);
            }
            if (d_name.length() > 10) {
                d_name = d_name.substring(0, 10);
            }
            h_data = w_name + "    " + d_name;
            PreparedStatement ps290 = con.prepareStatement(
                    "INSERT INTO tpcc_history " +
                    "   (h_c_d_id, h_c_w_id, h_c_id, " +
                    "      h_d_id, h_w_id, h_date, " +
                    "      h_amount, h_data)" +
                    "VALUES (?, ?, ?, ?, ?, SYSDATE, ?, ?)");
            //
            ps290.setString(1, c_d_id);
            ps290.setString(2, c_w_id);
            ps290.setString(3, c_id);
            ps290.setString(4, d_id);
            ps290.setString(5, w_id);
            ps290.setDouble(6, h_amount);
            ps290.setString(7, h_data);
//
//
//
//
//
//
//
            ps290.executeUpdate();
            con.commit();
            PaymentResult pr = new PaymentResult(w_id, w_street_1, w_street_2,
                    w_city, w_state, w_zip, d_id, d_street_1, d_street_2, d_city,
                    d_state, d_zip, c_id, c_first, c_middle, c_last, c_street_1,
                    c_street_2, c_city, c_state, c_zip, new Date(c_since.getTime()), c_credit,
                    c_discount, c_phone, h_amount, c_credit_lim, c_balance, c_data);
            return pr;
        } catch (Exception e) {
            Logging.trace(e.toString());
//            logException(e);
            try {
//                terminalMessage("Performing ROLLBACK...");
                con.rollback();
            } catch (Exception e1) {
                Logging.trace("PAYMENT-ROLLBACK" + e1);
            }
        } finally {
            Database.relaseConnection(con);
        }
        return null;
    }
}
