package Dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import Connection.ConnectionUtil;
import Model.Category;
import Model.Galery;
import Model.Product;
import Model.User;

public class productDao {

	public List<Category> getListCategorys() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM category");
				ResultSet rs = st.executeQuery()) {
			List<Category> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				
				Category category = new Category(name);
				result.add(category);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public String getNameCategory(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT name FROM category where id = ?");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				
			   return name;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	// lấy sản phẩm mới nhất cách 2 ngày so với ngày hiện tại
	
	
	public List<Product> getListProducts() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT *FROM product;");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public List<Product> getListProductNew() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM product WHERE create_at >= DATE_SUB(CURDATE(), INTERVAL 2 DAY);");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	// lấy 10 sản phẩm được thêm gần nhất
	public List<Product> getListProductNearest() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT *FROM product Order by id DESC limit 10;");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	// top 10 sản phẩm được quan tâm nhất
	public List<Product> getListTopProduct() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT od.product_id, p.*, SUM(od.quantity) AS total_sold FROM orderdetail od JOIN product p ON od.product_id = p.id GROUP BY od.product_id, p.name ORDER BY total_sold DESC limit 10;");
				ResultSet rs = st.executeQuery()) {
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("product_id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("total_sold");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public List<Product> getListProductByCategory(int category_id,int product_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from product where category_id =? and id != ?;");
				) {
			st.setInt(1, category_id);
			st.setInt(2, product_id);
			ResultSet rs = st.executeQuery();
			List<Product> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int categoryid = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(id,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, categoryid, create_at, update_at);
				
				result.add(product);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public Product getProductById(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM product WHERE id = ?;");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				
				int idp = rs.getInt("id");
				String name = rs.getString("name");
				String short_des = rs.getString("short_description");
				Double price = rs.getDouble("price");
				Double discount = rs.getDouble("discount");
				int quantity = rs.getInt("quantity");
				String thumbnail = rs.getString("thumbnail");
				String description = rs.getString("description");
				int is_featured = rs.getInt("is_featured");
				int status = rs.getInt("status");
				int category_id = rs.getInt("category_id");
				Date create_at = rs.getDate("create_at");
				Date update_at = rs.getDate("update_at");
				
				Product product = new Product(idp,name,short_des,price, discount, quantity, thumbnail, description, is_featured, status, category_id, create_at, update_at);
				
				return product;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<Galery> getListGaleries(int product_id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from galery where product_id = ?;");
				) {
			st.setInt(1, product_id);
			ResultSet rs = st.executeQuery();
			List<Galery> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String thumbnail = rs.getString("thumbnail");
				int productid  = rs.getInt("product_id");
				
				Galery galery = new Galery(id,thumbnail, product_id);
				
				result.add(galery);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	
}
