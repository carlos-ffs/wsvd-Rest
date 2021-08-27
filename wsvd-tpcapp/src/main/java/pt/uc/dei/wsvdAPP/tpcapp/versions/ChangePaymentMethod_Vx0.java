package pt.uc.dei.wsvdAPP.tpcapp.versions;

import pt.uc.dei.wsvdAPP.external.LongWrapper;
import pt.uc.dei.wsvdAPP.external.Pov;
import pt.uc.dei.wsvdAPP.tpcapp.input.ChangePaymentMethodInput;
import pt.uc.dei.wsvdAPP.tpcapp.output.ChangePaymentMethodOutput;
import pt.uc.dei.wsvdAPP.util.Database;
import pt.uc.dei.wsvdAPP.util.Logging;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - APP Benchmark Services
 *
 *
 * #WebServiceOperation
 *
 * @author cnl@dei.uc.pt
 * @author nmsa@dei.uc.pt
 */
public class ChangePaymentMethod_Vx0 {

    public ChangePaymentMethodOutput process(ChangePaymentMethodInput input) throws Exception {
        ChangePaymentMethodOutput cpmo = new ChangePaymentMethodOutput();
        //        db = new Database(server, port, sid, userName, passwd);
        String c_b_name = null;
        if (input.getPaymentMethod().equalsIgnoreCase("PO")) {
            Connection conn = Database.pickConnection();
            try {
                if (conn != null) {
                    Long cid = input.getCustomerId();
                    if (cid != null) {
                        long c_id = cid.longValue();
                        c_b_name = getBusiName(conn, c_id);
                    }
                } else {
                    throw new SQLException("Cannot Establish Connection");
                }
                // initiates a web service request to the POV to validate the

                String poId = input.getPoId();
                if ((poId != null) && (c_b_name != null)) {
                    Pov pov = new Pov();
                    LongWrapper wrapper = pov.call(poId, c_b_name);
                    wrapper.getValue().getClass();
                }
                if (conn != null) {
                    String c_payment_method = updateCPM(conn, input);
                    if (c_payment_method != null) {
                        cpmo.setCurrPaymentMethod(c_payment_method);
                    }
                } else {
                    throw new SQLException("Cannot Establish Connection");
                }
                conn.commit();
            } catch (SQLException e) {
                throw e;
            } finally {
                Database.relaseConnection(conn);
            }
        }
        //   System.gc();
        return cpmo;
    }

    private synchronized String updateCPM(final Connection conn, final ChangePaymentMethodInput input)
            throws SQLException {
        String cpm = null;
        PreparedStatement ps79 = conn.prepareStatement("UPDATE customer " +
                " SET C_PAYMENT_METHOD= ?, C_CREDIT_INFO= ?, C_PO= ?  " +
                " WHERE C_ID = ?");
        ps79.setString(1, input.getPaymentMethod());
        ps79.setString(2, input.getCreditInfo());
        ps79.setLong(3, Long.parseLong(input.getPoId()));
        ps79.setLong(4, input.getCustomerId());
//        Statement stat = Database.createStatement(conn);
        int rc = ps79.executeUpdate();
        ps79.close();
        cpm = input.getPaymentMethod();
        return (cpm);
    }

    private synchronized String getBusiName(final Connection conn, long c_id) throws SQLException {
        String cbn = null;
        PreparedStatement ps89 = conn.prepareStatement("select c_business_name from customer where c_id = ? ");
        ps89.setLong(1, c_id);
        ResultSet rs = ps89.executeQuery();
        if (rs.next()) {
            cbn = rs.getString(1);
        }
        if (rs != null) {
            rs.close();
        }
        ps89.close();
        return (cbn);
    }
}
