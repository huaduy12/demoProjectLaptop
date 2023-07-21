package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import Connection.ConnectionUtil;
import Model.Cart;
import Model.Cartdetail;
import Model.User;

public class cartDao {
	
	public List<Cart> getListCarts() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM cart");
				ResultSet rs = st.executeQuery()) {
			List<Cart> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				double total = rs.getDouble("total");
				int user_id = rs.getInt("user_id");
				
				Cart cart = new Cart(id,total,user_id);
				result.add(cart);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public Cart getCartByUserId(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM cart where user_id = ? ");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idu = rs.getInt("id");
				double total = rs.getDouble("total");
				int user_id = rs.getInt("user_id");
				
				Cart cart = new Cart(idu,total,user_id);
				return cart;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void addCart(Cart cart) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into cart(total,user_id) values(?,?);");
		) {
			stt.setDouble(1, cart.getTotal_money());
			stt.setInt(2, cart.getUser_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateCart(Cart cart) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
						"UPDATE cart SET total = ? WHERE (id = ?)");) {
			stt.setDouble(1, cart.getTotal_money());
			stt.setInt(2, cart.getId());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeCart(int id) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement("Delete from cart where id = ?");) {
			stt.setInt(1, id);
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// cartDetail
	
	public List<Cartdetail> getListCartdetails() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM cartdetail");
				ResultSet rs = st.executeQuery()) {
			List<Cartdetail> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				int quantity = rs.getInt("quantity");
				int cart_id = rs.getInt("cart_id");
				int product_id = rs.getInt("product_id");
				double total = rs.getDouble("total_item");
				Cartdetail cart = new Cartdetail(id,quantity, cart_id, product_id,total);
				result.add(cart);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Cartdetail> getListCartdetailByCart_id(int cartid) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM cartdetail where cart_id = ?");
				) {
			st.setInt(1, cartid);
			ResultSet rs = st.executeQuery();
			List<Cartdetail> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				int quantity = rs.getInt("quantity");
				int cart_id = rs.getInt("cart_id");
				int product_id = rs.getInt("product_id");
				double total = rs.getDouble("total_item");
				Cartdetail cart = new Cartdetail(id,quantity, cart_id, product_id,total);
				result.add(cart);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public Cartdetail getCartDetailById(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM cartdetail where id = ? ");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idu = rs.getInt("id");
				int quantity = rs.getInt("quantity");
				int cart_id = rs.getInt("cart_id");
				int product_id = rs.getInt("product_id");
				double total = rs.getDouble("total_item");
				Cartdetail cart = new Cartdetail(idu,quantity, cart_id, product_id,total);
				return cart;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	public void addCartdetail(Cartdetail cart) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into cartdetail(quantity,cart_id,product_id,total_item) values(?,?,?,?);");
		) {
			stt.setInt(1, cart.getQuantity());
			stt.setInt(2, cart.getCart_id());
			stt.setInt(3, cart.getProduct_id());
			stt.setDouble(4, cart.getTotal_item());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateQuantityCartDetail(Cartdetail cartdetail) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
				"UPDATE cartdetail SET quantity = ? WHERE cart_id = ? and product_id = ?");) {
			
			stt.setInt(1, (cartdetail.getQuantity()+1));
			stt.setInt(2, cartdetail.getCart_id());
			stt.setInt(3, cartdetail.getProduct_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateTotalCartDetail(Cartdetail cartdetail) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
				"UPDATE cartdetail SET total_item = ? WHERE cart_id = ? and product_id = ?");) {
			
			stt.setDouble(1, cartdetail.getTotal_item());
			stt.setInt(2, cartdetail.getCart_id());
			stt.setInt(3, cartdetail.getProduct_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeCartdetail(int id) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement("Delete from cartdetail where id = ?");) {
			stt.setInt(1, id);
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public double calculateCartTotal(int cartId) {
	    double total = 0.0;
	    try (Connection connection = ConnectionUtil.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement("SELECT SUM(total) FROM cartdetail WHERE cart_id = ?")) {
	        preparedStatement.setInt(1, cartId);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	            total = resultSet.getDouble(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return total;
	}
	
	public Cartdetail getCartDetai(Cartdetail cartdetail) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM cartdetail where cart_id = ? and product_id =? ");
				) {
			st.setInt(1, cartdetail.getCart_id());
			st.setInt(2, cartdetail.getProduct_id());
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idu = rs.getInt("id");
				int quantity = rs.getInt("quantity");
				int cart_id = rs.getInt("cart_id");
				int product_id = rs.getInt("product_id");
				Cartdetail cart = new Cartdetail(idu,quantity, cart_id, product_id);
				return cart;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
