package pt.uc.dei.wsvdbench.tpcw.versions;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class CreateShoppingCart_Vx0 {

    public Cart createShoppingCart(Integer I_ID, List<String> ids, List<String> quantities, Integer SHOPPING_ID) {
        int newCartID = (SHOPPING_ID != null) ? SHOPPING_ID : createEmptyCart();
        return doCart(newCartID, I_ID, ids, quantities);
    }

    private int createEmptyCart() {
        int SHOPPING_ID = 0;
        //	boolean success = false;
        Connection con = Database.pickConnection();
        //while(success == false) {
        try {
            PreparedStatement get_next_id = con.prepareStatement("SELECT COUNT(*) FROM tpcw_shopping_cart");
            synchronized (Cart.class) {
                ResultSet rs = get_next_id.executeQuery();
                rs.next();
                SHOPPING_ID = rs.getInt(1);
                rs.close();
                PreparedStatement insert_cart = con.prepareStatement("INSERT into tpcw_shopping_cart (sc_id, sc_time) " +
                        "VALUES ((SELECT COUNT(*) FROM tpcw_shopping_cart)," +
                        "sysdate)");
                insert_cart.executeUpdate();
                get_next_id.close();
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
            // Prepare SQL
            PreparedStatement find_entry = con.prepareStatement("SELECT scl_qty FROM tpcw_shopping_cart_line WHERE scl_sc_id = ? AND scl_i_id = ?");
            // Set parameter
            find_entry.setInt(1, SHOPPING_ID);
            find_entry.setInt(2, I_ID);
            ResultSet rs = find_entry.executeQuery();
            // Results
            if (rs.next()) {
                //The shopping cart id, tpcw_item pair were already in the table
                int currqty = rs.getInt("scl_qty");
                currqty += 1;
                PreparedStatement update_qty = con.prepareStatement("UPDATE tpcw_shopping_cart_line SET scl_qty = ? WHERE scl_sc_id = ? AND scl_i_id = ?");
                update_qty.setInt(1, currqty);
                update_qty.setInt(2, SHOPPING_ID);
                update_qty.setInt(3, I_ID);
                update_qty.executeUpdate();
                update_qty.close();
            } else {//We need to add a new row to the table.
                //Stick the tpcw_item info in a new tpcw_shopping_cart_line
                PreparedStatement put_line = con.prepareStatement("INSERT into tpcw_shopping_cart_line (scl_sc_id, scl_qty, scl_i_id) VALUES (?,?,?)");
                put_line.setInt(1, SHOPPING_ID);
                put_line.setInt(2, 1);
                put_line.setInt(3, I_ID);
                put_line.executeUpdate();
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
                    PreparedStatement statement = con.prepareStatement("DELETE FROM tpcw_shopping_cart_line WHERE scl_sc_id = ? AND scl_i_id = ?");
                    statement.setInt(1, SHOPPING_ID);
                    statement.setInt(2, I_ID);
                    statement.executeUpdate();
                    statement.close();
                } else { //we update the quantity
                    PreparedStatement statement = con.prepareStatement("UPDATE tpcw_shopping_cart_line SET scl_qty = ? WHERE scl_sc_id = ? AND scl_i_id = ?");
                    statement.setInt(1, QTY);
                    statement.setInt(2, SHOPPING_ID);
                    statement.setInt(3, I_ID);
                    statement.executeUpdate();
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
            PreparedStatement get_cart = con.prepareStatement("SELECT COUNT(*) from tpcw_shopping_cart_line where scl_sc_id = ?");
            get_cart.setInt(1, SHOPPING_ID);
            ResultSet rs = get_cart.executeQuery();
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
            PreparedStatement statement = con.prepareStatement("SELECT i_related1 FROM tpcw_item where i_id = ?");
            statement.setInt(1, I_ID);
            ResultSet rs = statement.executeQuery();
            rs.next();
            related1 = rs.getInt(1);//Is 1 the correct index?
            rs.close();
            statement.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
        return related1;
    }

    private void resetCartTime(Connection con, int SHOPPING_ID) {
        try {
            PreparedStatement statement = con.prepareStatement("UPDATE tpcw_shopping_cart SET sc_time = sysdate WHERE sc_id = ?");
            // Set parameter
            statement.setInt(1, SHOPPING_ID);
            statement.executeUpdate();
            statement.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
    }

    private Cart getCart(Connection con, int SHOPPING_ID, double c_discount) {
        Cart mycart = null;
        try {
            PreparedStatement get_cart = con.prepareStatement("SELECT * " +
                    "FROM tpcw_shopping_cart_line, tpcw_item " +
                    "WHERE scl_i_id = tpcw_item.i_id AND scl_sc_id = ?");
            get_cart.setInt(1, SHOPPING_ID);
            ResultSet rs = get_cart.executeQuery();
            mycart = new Cart(rs, c_discount);
            rs.close();
            get_cart.close();
        } catch (java.lang.Exception ex) {
            //ex.printStackTrace();
        }
        return mycart;
    }
}
