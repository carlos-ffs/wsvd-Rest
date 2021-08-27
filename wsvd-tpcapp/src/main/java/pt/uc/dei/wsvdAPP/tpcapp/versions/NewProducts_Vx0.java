package pt.uc.dei.wsvdAPP.tpcapp.versions;

import pt.uc.dei.wsvdAPP.tpcapp.input.NewProductsInput;
import pt.uc.dei.wsvdAPP.tpcapp.output.NewProduct;
import pt.uc.dei.wsvdAPP.tpcapp.output.NewProductsOutput;
import pt.uc.dei.wsvdAPP.util.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.*;

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
public class NewProducts_Vx0 {

    public NewProductsOutput process(NewProductsInput input) throws Exception {
        NewProductsOutput npo = new NewProductsOutput();
        Connection conn = Database.pickConnection();
        try {
            if (conn != null) {
                npo = getData(conn, npo, input);
            }
            conn.commit();
        } catch (Exception e) {
            throw e;
        } finally {
            Database.relaseConnection(conn);
        }
        return npo;
    }

    private synchronized NewProductsOutput getData(Connection conn, NewProductsOutput npo, NewProductsInput input) throws SQLException {
        // setfetch size item_limit
        Long il = input.getItemLimit();
        Long l = null;
        PreparedStatement ps81 = conn.prepareStatement(
                "   SELECT i_id, i_title, a_fname, a_lname " +
                "     FROM item, author " +
                "    WHERE lower(i_subject) = lower(?) " +
                "      AND i_pub_date > to_timestamp(?, 'YYYY-MM-DD HH24:MI:SS') " +
                "      AND i_a_id = a_id  " +
                " ORDER BY i_pub_date desc, i_title asc");

        if (il != null) {
            l = new Long(il);
            ps81.setFetchSize(l.intValue());
        }
        List<NewProduct> npl = new ArrayList<NewProduct>();
        // Date currDate= System.getCurrDate
        Calendar cal = Calendar.getInstance(TimeZone.getDefault());

        Long cod = input.getCutOffDuration();
        long time = 0;
        if (cod != null) {
            time = cal.getTimeInMillis() - cod.longValue();
        } else {
            time = cal.getTimeInMillis();
        }
        Date date = new Date(time);
        Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = formatter.format(date);


        ps81.setString(1, input.getSubjectString());
        ps81.setString(2, s);

        ResultSet rs = ps81.executeQuery();
        while (rs.next()) {
            long i_id = rs.getLong(1);
            String i_title = rs.getString(2);
            String a_fname = rs.getString(3);
            String a_lname = rs.getString(4);
            NewProduct np = new NewProduct();
            np.setItemId(i_id);
            np.setItemTitle(i_title);
            np.setAuthorLName(a_lname);
            np.setAuthorFName(a_fname);
            npl.add(np);

        }
        if (rs != null) {
            rs.close();
        }
        npo.setNewProductsList(npl);
        ps81.close();
        return (npo);
    }
}
