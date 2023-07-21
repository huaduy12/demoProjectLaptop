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
import Model.Order;
import Model.Orderdetail;

public class orderDao {
	
	public List<Order> getListOrders() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM `order`");
				ResultSet rs = st.executeQuery()) {
			List<Order> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				double total = rs.getDouble("total");
				int user_id = rs.getInt("user_id");
				
				Order order = new Order(id,total,user_id);
				result.add(order);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public Order getOrderByUserId(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM `order` where user_id = ? and status is null");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				int idu = rs.getInt("id");
				double total = rs.getDouble("total");
				int user_id = rs.getInt("user_id");
				
				Order order = new Order(idu,total,user_id);
				return order;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int getIdOrderByUserLatest(int user_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM `order` WHERE user_id = ? AND status = 2 ORDER BY orderdate DESC LIMIT 1;");
				) {
			st.setInt(1, user_id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				int idu = rs.getInt("id");
				
				
				return idu;
			}
			return -1;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<Order> getOrderByUserIdNotNull(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM `order` where user_id = ? and status is not null");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
		    List<Order> result = new ArrayList<>();
			while (rs.next()) {
				int idu = rs.getInt("id");
				double total = rs.getDouble("total");
				int user_id = rs.getInt("user_id");
				
				Order order = new Order(idu,total,user_id);
				result.add(order);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Order> getOrderByUserLatest(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM `order` where user_id = ? and status is not null ORDER BY `orderdate` DESC;");
				
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
		    List<Order> result = new ArrayList<>();
			while (rs.next()) {
				int idu = rs.getInt("id");
				double total = rs.getDouble("total");
				int user_id = rs.getInt("user_id");
				
				Order order = new Order(idu,total,user_id);
				result.add(order);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	
	public double getTotalByUserId(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"select total from `order` where user_id = ?;");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				
				double total = rs.getDouble(1);
				return total;
			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public void addOrder(Order order) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into `order`(total,user_id) values(?,?);");
		) {
			stt.setDouble(1,order.getTotal_money());
			stt.setInt(2, order.getUser_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
	
	public void updateOrder(Order order) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
						"UPDATE `order` SET total = ? WHERE id = ? and status is null");) {
			stt.setDouble(1, order.getTotal_money());
			stt.setInt(2, order.getId());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateOrderCheckout(Order order) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement("UPDATE `shoplaptop`.`order` SET `fullname` = ?, `email` = ?, `phonenumber` = ?, `address` = ?, `note` = ?, `orderdate` = NOW(), `status` = ? WHERE (`id` = ?);")) {
			stt.setString(1,order.getFullname());
			stt.setString(2, order.getEmail());
			stt.setString(3,order.getPhonenumber());
			stt.setString(4, order.getAddress());
			stt.setString(5,order.getNote());
			stt.setInt(6, order.getStatus());
			stt.setInt(7, order.getId());
			
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addOrderBuyNow(Order order) {
		try (
			Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement("Insert into `shoplaptop`.`order`(`fullname`,`email`, `phonenumber`, `address`, `note`, `orderdate`, `status`,`total`,`user_id`) values (?,?,?,?,?,NOW(),?,?,?);");
		) {
			stt.setString(1,order.getFullname());
			stt.setString(2, order.getEmail());
			stt.setString(3,order.getPhonenumber());
			stt.setString(4, order.getAddress());
			stt.setString(5,order.getNote());
			
			stt.setInt(6, 2);
			stt.setDouble(7, order.getTotal_money());
			stt.setInt(8, order.getUser_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeOrder(int id) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement("Delete from `order` where id = ?");) {
			stt.setInt(1, id);
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// OrderDetail
	
	public List<Orderdetail> getListOrderdetails() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM orderdetail");
				ResultSet rs = st.executeQuery()) {
			List<Orderdetail> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				double price = rs.getDouble("price");
				int quantity = rs.getInt("quantity");
				double total = rs.getDouble("total");
				int order_id = rs.getInt("order_id");
				int product_id = rs.getInt("product_id");
				
				Orderdetail orderdetail = new Orderdetail(id,price,quantity,total, product_id,order_id);
				result.add(orderdetail);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Orderdetail> getListOrderdetailByOrder_id(int orderid) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM orderdetail where order_id = ?");
				) {
			st.setInt(1, orderid);
			ResultSet rs = st.executeQuery();
			List<Orderdetail> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				double price = rs.getDouble("price");
				int quantity = rs.getInt("quantity");
				double total = rs.getDouble("total");
				int order_id = rs.getInt("order_id");
				int product_id = rs.getInt("product_id");
				
				Orderdetail orderdetail = new Orderdetail(id,price,quantity,total, product_id,order_id);
				result.add(orderdetail);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<String> getAddressOrderdetail(int user_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT o.address\r\n"
						+ "FROM `orderdetail` od\r\n"
						+ "JOIN `order` o ON od.order_id = o.id\r\n"
						+ "WHERE od.status = 2 and o.user_id =?\r\n"
						+ "group by o.id\r\n"
						+ "ORDER BY o.orderdate DESC limit 4;");
				) {
			st.setInt(1,user_id);
			ResultSet rs = st.executeQuery();
			List<String> result = new ArrayList<>();
			while (rs.next()) {
				String address = rs.getString(1);
				
				result.add(address);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	
	public Orderdetail getOrderdetail(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM orderdetail where id = ? ");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idu = rs.getInt("id");
				double price = rs.getDouble("price");
				int quantity = rs.getInt("quantity");
				double total = rs.getDouble("total");
				int order_id = rs.getInt("order_id");
				int product_id = rs.getInt("product_id");
				
				Orderdetail orderdetail = new Orderdetail(idu,price,quantity,total, product_id,order_id);
				return orderdetail;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	public void addOrderdetail(Orderdetail orderdetail) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into orderdetail(price,quantity,total,product_id,order_id) values(?,?,?,?,?);");
		) {
			stt.setDouble(1, orderdetail.getPrice());
			stt.setInt(2, orderdetail.getQuantity());
			stt.setDouble(3, orderdetail.getTotal_money());
			stt.setInt(4, orderdetail.getProduct_id());
			stt.setDouble(5, orderdetail.getOrder_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addOrderdetailStatus(Orderdetail orderdetail) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into orderdetail(price,quantity,total,product_id,order_id,status) values(?,?,?,?,?,?);");
		) {
			stt.setDouble(1, orderdetail.getPrice());
			stt.setInt(2, orderdetail.getQuantity());
			stt.setDouble(3, orderdetail.getTotal_money());
			stt.setInt(4, orderdetail.getProduct_id());
			stt.setDouble(5, orderdetail.getOrder_id());
			stt.setInt(6, orderdetail.getStatus());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateQuantityOrderDetail(Orderdetail orderdetail) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
				"UPDATE orderdetail SET quantity = ? WHERE order_id = ? and product_id = ? and status is null");) {
			
			stt.setInt(1, (orderdetail.getQuantity()+1));
			stt.setInt(2, orderdetail.getOrder_id());
			stt.setInt(3, orderdetail.getProduct_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateQuantityByMinus(Orderdetail orderdetail) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
				"UPDATE orderdetail SET quantity = ? WHERE id = ?");) {
			
			stt.setInt(1, (orderdetail.getQuantity()-1));
			stt.setInt(2, orderdetail.getId());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateQuantityByPlus(Orderdetail orderdetail) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
				"UPDATE orderdetail SET quantity = ? WHERE id = ?");) {
			
			stt.setInt(1, (orderdetail.getQuantity()+1));
			stt.setInt(2, orderdetail.getId());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateStatusOrderdetail(int id,int status) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
				"UPDATE orderdetail SET status = ? WHERE id = ?");) {
			
			stt.setInt(1, status);
			stt.setInt(2, id);
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public void updateTotalOrderDetail(Orderdetail orderdetail) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
				"UPDATE orderdetail SET total = ? WHERE order_id = ? and product_id = ? and status is null");) {
			
			stt.setDouble(1, orderdetail.getTotal_money());
			stt.setInt(2, orderdetail.getOrder_id());
			stt.setInt(3, orderdetail.getProduct_id());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeOrderdetail(int id) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement("Delete from orderdetail where id = ?");) {
			stt.setInt(1, id);
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public double calculateOrderTotal(int orderId) {
	    double total = 0.0;
	    try (Connection connection = ConnectionUtil.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement("SELECT SUM(total) FROM orderdetail WHERE order_id = ? and status is null")) {
	        preparedStatement.setInt(1, orderId);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	            total = resultSet.getDouble(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return total;
	}
	
	public Orderdetail getOrderDetail(Orderdetail orderdetail) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM orderdetail where order_id = ? and product_id =? and status is null ");
				) {
			st.setInt(1, orderdetail.getOrder_id());
			st.setInt(2, orderdetail.getProduct_id());
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idu = rs.getInt("id");
				double price = rs.getDouble("price");
				int quantity = rs.getInt("quantity");
				double total = rs.getInt("total");
				int order_id = rs.getInt("order_id");
				int product_id = rs.getInt("product_id");
				Orderdetail order = new Orderdetail(idu,price,quantity,total, order_id, product_id);
				return order;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public int countItemOrderDetail(int orderId) {
	   int total = 0;
	    try (Connection connection = ConnectionUtil.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement("select count(order_id) from orderdetail  where order_id = ? and status is null;")) {
	        preparedStatement.setInt(1, orderId);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	            total = resultSet.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return total;
	}
	
	public List<Orderdetail> getListOrderdetailOrderBy(int orderid) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM orderdetail WHERE order_id = ? and status is null ORDER BY id DESC");
				) {
			st.setInt(1, orderid);
			ResultSet rs = st.executeQuery();
			List<Orderdetail> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				double price = rs.getDouble("price");
				int quantity = rs.getInt("quantity");
				double total = rs.getDouble("total");
				int order_id = rs.getInt("order_id");
				int product_id = rs.getInt("product_id");
				
				Orderdetail orderdetail = new Orderdetail(id,price,quantity,total, product_id,order_id);
				result.add(orderdetail);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Orderdetail> getListOrderdetailNotNull(int orderid) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM orderdetail WHERE order_id = ? and status is not null ORDER BY id DESC");
				) {
			st.setInt(1, orderid);
			ResultSet rs = st.executeQuery();
			List<Orderdetail> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				double price = rs.getDouble("price");
				int quantity = rs.getInt("quantity");
				double total = rs.getDouble("total");
				int order_id = rs.getInt("order_id");
				int product_id = rs.getInt("product_id");
				int status = rs.getInt("status");
				Orderdetail orderdetail = new Orderdetail(id,price,quantity,total, product_id,order_id,status);
				result.add(orderdetail);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	
	
	
}
