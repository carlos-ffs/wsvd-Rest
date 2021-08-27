package pt.uc.dei.tpcc.tpccWS.versions;
import pt.uc.dei.tpcc.tpccWS.object.PaymentResult;
import pt.uc.dei.tpcc.util.Database;
import pt.uc.dei.tpcc.util.Logging;

import java.sql.Connection;
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
public class Payment_VxA {

    public PaymentResult paymentTransaction(String w_id, String c_w_id, double h_amount, String d_id, String c_d_id, String c_id, String c_last, boolean c_by_name) {
        String w_street_1, w_street_2, w_city, w_state, w_zip, w_name;
        String d_street_1, d_street_2, d_city, d_state, d_zip, d_name;
        long namecnt;
        String c_first, c_middle, c_street_1, c_street_2, c_city, c_state, c_zip;
        String c_phone, c_credit = null, c_data = null, c_new_data, h_data;
        double c_credit_lim, c_discount, c_balance = 0;
        java.sql.Date c_since;
        int result;
        StringBuffer query = null;
        Connection con = Database.pickConnection();
        try {
            Statement stmt = Database.createStatement(con);
            query = new StringBuffer();
            query.append("UPDATE tpcc_warehouse SET w_ytd = w_ytd + ");
            query.append(h_amount);
            query.append(" WHERE w_id = '");
            query.append(w_id);
            query.append("'");
            //  printMessage(query.toString());
            try {
                result = stmt.executeUpdate(query.toString());
            } catch (SQLException e) {
                throw new Exception("paymentTransaction SQLException " + query.toString() + " :" + e.getMessage());
            }
            if (result == 0) {
                throw new Exception("W_ID=" + w_id + " not found!");
            }
            query = new StringBuffer();
            query.append("SELECT w_street_1, w_street_2, w_city, w_state, w_zip, w_name");
            query.append(" FROM tpcc_warehouse");
            query.append(" WHERE w_id = '");
            query.append(w_id);
            query.append("'");
            //  printMessage(query.toString());
            ResultSet rs = stmt.executeQuery(query.toString());
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
            query = new StringBuffer();
            query.append("UPDATE tpcc_district SET d_ytd = d_ytd + ");
            query.append(h_amount);
            query.append(" WHERE d_w_id = '");
            query.append(w_id);
            query.append("' AND d_id = '");
            query.append(d_id);
            query.append("'");
            //  printMessage(query.toString());
            result = stmt.executeUpdate(query.toString());
            if (result == 0) {
                throw new Exception("D_ID=" + d_id + " D_W_ID=" + w_id + " not found!");
            }
            query = new StringBuffer();
            query.append("SELECT d_street_1, d_street_2, d_city, d_state, d_zip, d_name");
            query.append(" FROM tpcc_district");
            query.append(" WHERE d_w_id = '");
            query.append(w_id);
            query.append("' AND d_id = '");
            query.append(d_id);
            query.append("'");
            //  printMessage(query.toString());
            rs = stmt.executeQuery(query.toString());
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
                query = new StringBuffer();
                query.append("SELECT count(c_id) AS namecnt");
                query.append(" FROM tpcc_customer");
                query.append(" WHERE c_last = \'");
                query.append(c_last);
                query.append("\' AND c_d_id = '");
                query.append(c_d_id);
                query.append("' AND c_w_id = '");
                query.append(c_w_id);
                query.append("'");
                //  printMessage(query.toString());
                rs = stmt.executeQuery(query.toString());
                if (!rs.next()) {
                    throw new Exception("C_LAST=" + c_last + " C_D_ID=" + c_d_id + " C_W_ID=" + c_w_id + " not found!");
                }
                namecnt = rs.getLong("namecnt");
                rs.close();
                rs = null;
                query = new StringBuffer();
                query.append("SELECT c_first, c_middle, c_id,");
                query.append(" c_street_1, c_street_2, c_city, c_state, c_zip,");
                query.append(" c_phone, c_credit, c_credit_lim,");
                query.append(" c_discount, c_balance, c_since");
                query.append(" FROM tpcc_customer");
                query.append(" WHERE c_w_id = '");
                query.append(c_w_id);
                query.append("' AND c_d_id = '");
                query.append(c_d_id);
                query.append("' AND c_last = \'");
                query.append(c_last);
                query.append("\' ORDER BY c_first ASC");
                //  printMessage(query.toString());
                rs = stmt.executeQuery(query.toString());
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
                query = new StringBuffer();
                query.append("SELECT c_first, c_middle, c_last,");
                query.append(" c_street_1, c_street_2, c_city, c_state, c_zip,");
                query.append(" c_phone, c_credit, c_credit_lim,");
                query.append(" c_discount, c_balance, c_since");
                query.append(" FROM tpcc_customer");
                query.append(" WHERE c_w_id = '");
                query.append(c_w_id);
                query.append("' AND c_d_id = '");
                query.append(c_d_id);
                query.append("' AND c_id = '");
                query.append(c_id);
                query.append("'");
                //  printMessage(query.toString());
                rs = stmt.executeQuery(query.toString());
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
                query = new StringBuffer();
                query.append("SELECT c_data");
                query.append(" FROM tpcc_customer");
                query.append(" WHERE c_w_id = '");
                query.append(c_w_id);
                query.append("' AND c_d_id = '");
                query.append(c_d_id);
                query.append("' AND c_id = '");
                query.append(c_id);
                query.append("'");
                //  printMessage(query.toString());
                rs = stmt.executeQuery(query.toString());
                if (!rs.next()) {
                    throw new Exception("C_ID=" + c_id + " C_W_ID='" + c_w_id + "' C_D_ID=" + c_d_id + " not found!");
                }
                c_data = rs.getString("c_data");
                rs.close();
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
                query = new StringBuffer();
                query.append("UPDATE tpcc_customer SET c_balance = ");
                query.append(c_balance);
                query.append(", c_data = \'");
                query.append(c_new_data);
                query.append("\' WHERE c_w_id = '");
                query.append(c_w_id);
                query.append("' AND c_d_id = '");
                query.append(c_d_id);
                query.append("' AND c_id = '");
                query.append(c_id);
                query.append("'");
                //  printMessage(query.toString());
                result = stmt.executeUpdate(query.toString());
                if (result == 0) {
                    throw new Exception("C_ID=" + c_id + " C_W_ID=" + c_w_id + " C_D_ID=" + c_d_id + " not found!");
                }
            } else {
                query = new StringBuffer();
                query.append("UPDATE tpcc_customer SET c_balance = ");
                query.append(c_balance);
                query.append(" WHERE c_w_id = '");
                query.append(c_w_id);
                query.append("' AND c_d_id = '");
                query.append(c_d_id);
                query.append("' AND c_id = '");
                query.append(c_id);
                query.append("'");
                //  printMessage(query.toString());
                result = stmt.executeUpdate(query.toString());
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
            query = new StringBuffer();
            query.append("INSERT INTO tpcc_history (h_c_d_id, h_c_w_id, h_c_id, h_d_id,");
            query.append(" h_w_id, h_date, h_amount, h_data)");
            query.append(" VALUES ('");
            query.append(c_d_id);
            query.append("', '");
            query.append(c_w_id);
            query.append("', '");
            query.append(c_id);
            query.append("', '");
            query.append(d_id);
            query.append("', '");
            query.append(w_id);
            query.append("',");
            query.append(" SYSDATE ");
            query.append(", ");
            query.append(h_amount);
            query.append(", \'");
            query.append(h_data);
            query.append("\')");
            //  printMessage(query.toString());
            stmt.executeUpdate(query.toString());
            con.commit();
            PaymentResult pr = new PaymentResult(w_id, w_street_1, w_street_2,
                    w_city, w_state, w_zip, d_id, d_street_1, d_street_2, d_city,
                    d_state, d_zip, c_id, c_first, c_middle, c_last, c_street_1,
                    c_street_2, c_city, c_state, c_zip, new Date(c_since.getTime()), c_credit,
                    c_discount, c_phone, h_amount, c_credit_lim, c_balance, c_data);
//            if (c_credit.equals("BC")) {
//                if (c_data.length() > 40) {
//                    System.out.println("\n\n Cust-Data: " + c_data.substring(0, 50));
//                    int data_chunks = c_data.length() > 200 ? 4 : c_data.length() / 50;
//                    for (int n = 1; n < data_chunks; n++) {
//                        System.out.println("\n            " + c_data.substring(n * 50, (n + 1) * 50));
//                    }
//                } else {
//                    System.out.println("\n\n Cust-Data: " + c_data);
//                }
//            }
//            System.out.println("\n+-----------------------------------------------------------------+\n\n");
//            terminalMessage(terminalMessage.toString());
            return pr;
        } catch (Exception e) {
            Logging.trace(e.toString());
            Logging.trace("PAYMENT query length " + query.length());
            Logging.trace("PAYMENT query statement " + query.toString());
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
