package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.List;
import pt.uc.dei.wsvdbench.util.Database;
import pt.uc.dei.wsvdbench.tpcw.object.Cart;

/**
 * WS - Vulnerability Detection Tools Benchmark
 * TPC - C Benchmark Services
 * #WebServiceOperation
 *
 *
 * @author nmsa@dei.uc.pt
 */
public class CreateShoppingCart_VxA {

    public Cart createShoppingCart(Integer I_ID, List<String> ids, List<String> quantities, Integer SHOPPING_ID) {
        int newCartID = (SHOPPING_ID != null) ? SHOPPING_ID : createEmptyCart();
        return doCart(newCartID, I_ID, ids, quantities);
    }

    private int createEmptyCart() {
        int SHOPPING_ID = 0;
        Connection con = Database.pickConnection();
        //while(success == false) {
        try {
            Statement get_next_id = Database.createStatement(con);
            synchronized (Cart.class) {
                ResultSet rs = get_next_id.executeQuery("SELECT COUNT(*) FROM tpcw_shopping_cart");
                rs.next();
                SHOPPING_ID = rs.getInt(1);
                rs.close();
                Statement insert_cart = Database.createStatement(con);
                insert_cart.executeUpdate("INSERT into tpcw_shopping_cart (sc_id, sc_time) " +
                        "VALUES ((SELECT COUNT(*) FROM tpcw_shopping_cart)," +
                        "sysdate)");
                get_next_id.close();
                insert_cart.close();//ADDED
                con.commit();
            }
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
        return SHOPPING_ID;
    }

    private Cart doCart(int SHOPPING_ID, Integer I_ID, List<String> ids, List<String> quantities) {
        Cart cart = null;
        Connection con = Database.pickConnection();
        try {
            if (I_ID != null) {
                addItem(con, SHOPPING_ID, I_ID.intValue());
            }
            refreshCart(con, SHOPPING_ID, ids, quantities);
            addRandomItemToCartIfNecessary(con, SHOPPING_ID);
            resetCartTime(con, SHOPPING_ID);
            cart = getCart(con, SHOPPING_ID, 0.0);
            // Close connection
            con.commit();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        } finally {
            Database.relaseConnection(con);
        }
        return cart;
    }

    //This function finds the shopping cart tpcw_item associated with SHOPPING_ID
    //and I_ID. If the tpcw_item does not already exist, we create one with QTY=1,
    //otherwise we increment the quantity.
    private void addItem(Connection con, int SHOPPING_ID, int I_ID) {
        try {
            Statement find_entry = Database.createStatement(con);
            ResultSet rs = find_entry.executeQuery("SELECT scl_qty FROM tpcw_shopping_cart_line WHERE scl_sc_id = " + SHOPPING_ID + " AND scl_i_id = " + I_ID);
            // Results
            if (rs.next()) {
                //The shopping cart id, tpcw_item pair were already in the table
                int currqty = rs.getInt("scl_qty");
                currqty += 1;
                Statement update_qty = Database.createStatement(con);
                update_qty.executeUpdate("UPDATE tpcw_shopping_cart_line SET scl_qty = " + currqty +
                        " WHERE scl_sc_id = " + SHOPPING_ID +
                        "   AND scl_i_id = " + I_ID);
                update_qty.close();
            } else {//We need to add a new row to the table.
                //Stick the tpcw_item info in a new tpcw_shopping_cart_line
                Statement put_line = Database.createStatement(con);
                put_line.executeUpdate("INSERT into tpcw_shopping_cart_line (scl_sc_id, scl_qty, scl_i_id) VALUES (" + SHOPPING_ID + "," + 1 + "," + I_ID + ")");
                put_line.close();
            }
            rs.close();
            find_entry.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
    }

    private void refreshCart(Connection con, int SHOPPING_ID, List<String> ids, List<String> quantities) {
        int i;
        try {
            for (i = 0; i < ids.size(); i++) {
                String I_IDstr = ids.get(i);
                String QTYstr = quantities.get(i);
                int I_ID = Integer.parseInt(I_IDstr);
                int QTY = Integer.parseInt(QTYstr);
                if (QTY == 0) { // We need to remove the tpcw_item from the cart
                    Statement statement = Database.createStatement(con);
                    statement.executeUpdate("DELETE FROM tpcw_shopping_cart_line WHERE scl_sc_id = " + SHOPPING_ID + " AND scl_i_id = " + I_ID);
                    statement.close();
                } else { //we update the quantity
                    Statement statement = Database.createStatement(con);
                    statement.executeUpdate("UPDATE tpcw_shopping_cart_line SET scl_qty = " + QTY + " WHERE scl_sc_id = " + SHOPPING_ID + " AND scl_i_id = " + I_ID);
                    statement.close();
                }
            }
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
    }

    private void addRandomItemToCartIfNecessary(Connection con, int SHOPPING_ID) {
        // check and see if the cart is empty. If it's not, we do nothing.
        int related_item = 0;
        try {
            // Check to see if the cart is empty
            Statement get_cart = Database.createStatement(con);
            ResultSet rs = get_cart.executeQuery("SELECT COUNT(*) from tpcw_shopping_cart_line where scl_sc_id =" + SHOPPING_ID);
            rs.next();
            if (rs.getInt(1) == 0) {
                // Cart is empty
                int rand_id = TPCWUtil.getRandomI_ID();
                related_item = getRelated1(rand_id, con);
                addItem(con, SHOPPING_ID, related_item);
            }
            rs.close();
            get_cart.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
//            System.out.println("Adding entry to shopping cart failed: shopping id = " + SHOPPING_ID + " related_item = " + related_item);
        }
    }

    //This function gets the value of I_RELATED1 for the row of the tpcw_item table corresponding to I_ID
    private int getRelated1(int I_ID, Connection con) {
        int related1 = -1;
        try {
            Statement statement = Database.createStatement(con);
            ResultSet rs = statement.executeQuery("SELECT i_related1 FROM tpcw_item where i_id = " + I_ID);
            rs.next();
            related1 = rs.getInt(1);//Is 1 the correct index\"++\"
            rs.close();
            statement.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
        return related1;
    }

    private void resetCartTime(Connection con, int SHOPPING_ID) {
        try {
            Statement statement = Database.createStatement(con);
            // Set parameter
            statement.executeUpdate("UPDATE tpcw_shopping_cart SET sc_time = sysdate WHERE sc_id = " + SHOPPING_ID);
            statement.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
    }

    private Cart getCart(Connection con, int SHOPPING_ID, double c_discount) {
        Cart mycart = null;
        try {
            Statement get_cart = Database.createStatement(con);
            ResultSet rs = get_cart.executeQuery("SELECT * " +
                    "FROM tpcw_shopping_cart_line, tpcw_item " +
                    "WHERE scl_i_id = tpcw_item.i_id AND scl_sc_id = " + SHOPPING_ID);
            mycart = new Cart(rs, c_discount);
            rs.close();
            get_cart.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
        return mycart;
    }
}
