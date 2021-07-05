package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import pt.uc.dei.wsvdbench.util.Database;
import pt.uc.dei.wsvdbench.tpcw.object.Order;
import pt.uc.dei.wsvdbench.tpcw.object.OrderLine;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class GetMostRecentOrder_VxA {

    public Order getMostRecentOrder(
            String c_uname) {
        Connection con = Database.pickConnection();
        try {
            int order_id;
            Order order;
            // Prepare SQL
            //	    System.out.println("cust_id: " + getCustomer(c_uname).c_id);
//            System.out.println("XXXXXX - 1");
            {
                // *** Get the o_id of the most recent order for this user
                Statement get_most_recent_order_id = Database.createStatement(con);
                // Set parameter
//                get_most_recent_order_id.setString(1, c_uname);
                ResultSet rs = get_most_recent_order_id.executeQuery("SELECT o_id " +
                        "FROM tpcw_customer, tpcw_orders " +
                        "WHERE tpcw_customer.c_id = tpcw_orders.o_c_id " +
                        "AND c_uname = '" + c_uname + "' " +
                        "ORDER BY o_date, tpcw_orders.o_id DESC LIMIT 50");
//                System.out.println("XXXXXX - 2   ");
                if (rs.next()) {
                    order_id = rs.getInt("o_id");
                } else {
                    // There is no most recent order
                    rs.close();
                    get_most_recent_order_id.close();
                    con.commit();
//                    Database.relaseConnection(con);
                    return null;
                }
                rs.close();
                get_most_recent_order_id.close();
            }

//            System.out.println(order_id);
//            System.out.println("XXXXXX - 35");
            {
                // *** Get the order info for this o_id
                Statement get_order = Database.createStatement(con);
//                System.out.println("XXXXXX - 333333");
                // Set parameter
//                get_order.setInt(1, );
                ResultSet rs2 = get_order.executeQuery("SELECT tpcw_orders.*, tpcw_customer.*, " +
                        "  tpcw_cc_xacts.cx_type, " +
                        "  ship.addr_street1 AS ship_addr_street1, " +
                        "  ship.addr_street2 AS ship_addr_street2, " +
                        "  ship.addr_state AS ship_addr_state, " +
                        "  ship.addr_zip AS ship_addr_zip, " +
                        "  ship_co.co_name AS ship_co_name, " +
                        "  bill.addr_street1 AS bill_addr_street1, " +
                        "  bill.addr_street2 AS bill_addr_street2, " +
                        "  bill.addr_state AS bill_addr_state, " +
                        "  bill.addr_zip AS bill_addr_zip, " +
                        "  bill_co.co_name AS bill_co_name " +
                        "FROM tpcw_customer, tpcw_orders, tpcw_cc_xacts," +
                        "  tpcw_address ship, " +
                        "  tpcw_country ship_co, " +
                        "  tpcw_address bill,  " +
                        "  tpcw_country bill_co " +
                        "WHERE tpcw_orders.o_id = " + order_id + " " +
                        "  AND tpcw_cx_o_id = tpcw_orders.o_id " +
                        "  AND tpcw_customer.c_id = tpcw_orders.o_c_id " +
                        "  AND tpcw_orders.o_bill_addr_id = bill.addr_id " +
                        "  AND bill.addr_co_id = bill_co.co_id " +
                        "  AND tpcw_orders.o_ship_addr_id = ship.addr_id " +
                        "  AND ship.addr_co_id = ship_co.co_id " +
                        "  AND tpcw_orders.o_c_id = tpcw_customer.c_id");

                // Results
                if (!rs2.next()) {
                    // FIXME - This case is due to an error due to a database population error
                    con.commit();
                    rs2.close();
                    //		    get_order.close();
//                    Database.relaseConnection(con);
                    return null;
                }
//                System.out.println("XXXXXX - 3355555");
                order = new Order(rs2);
                rs2.close();
                get_order.close();
            }
            {
                // *** Get the tpcw_order_lines for this o_id
                Statement get_order_lines = Database.createStatement(con);
                // Set parameter
//                get_order_lines.setInt(1, );
                ResultSet rs3 = get_order_lines.executeQuery("SELECT * " +
                        "FROM tpcw_order_line, tpcw_item " +
                        "WHERE ol_o_id = " + order_id + " " +
                        "AND ol_i_id = i_id");

                // Results
                while (rs3.next()) {
                    order.order_lines.add(new OrderLine(rs3));
                }
                rs3.close();
                get_order_lines.close();
            }
            con.commit();
            return order;
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
        return null;
    }
}
