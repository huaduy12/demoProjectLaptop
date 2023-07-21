package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import Connection.ConnectionUtil;
import Model.User;


public class userDao {
	public List<User> getListUsers() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM user");
				ResultSet rs = st.executeQuery()) {
			List<User> result = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String fullname = rs.getString("fullname");
				String email = rs.getString("email");
				String phonenumber = rs.getString("phonenumber");
				String address = rs.getString("address");
				String password = rs.getString("password");
				int roleId = rs.getInt("role_id");
				int status = rs.getInt("status");
				
				User user = new User(id,username,fullname, email, phonenumber, address,password,roleId,status);
				result.add(user);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public User getUserById(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM user where id = ? ");
				) {
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int iduser = rs.getInt("id");
				String username = rs.getString("username");
				String fullname = rs.getString("fullname");
				String email = rs.getString("email");
				String phonenumber = rs.getString("phonenumber");
				String address = rs.getString("address");
				String password = rs.getString("password");
				int roleId = rs.getInt("role_id");
				int status = rs.getInt("status");
				
				User user = new User(iduser,username,fullname, email, phonenumber, address,password,roleId,status);
				return user;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public User getUserByEmail(String email) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(	"SELECT * FROM user where email = ?");
						) {
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String fullname = rs.getString("fullname");
				String emailuser = rs.getString("email");
				String phonenumber = rs.getString("phonenumber");
				String address = rs.getString("address");
				String password = rs.getString("password");
				int roleId = rs.getInt("role_id");
				int status = rs.getInt("status");
				
				User user = new User(id,username,fullname, emailuser, phonenumber, address,password,roleId,status);
				return user;
					
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public User getUserByPhone(String phone) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM user where phonenumber = ?" );
				) {
			st.setString(1, phone);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String fullname = rs.getString("fullname");
				String email = rs.getString("email");
				String phonenumber = rs.getString("phonenumber");
				String address = rs.getString("address");
				String password = rs.getString("password");
				int roleId = rs.getInt("role_id");
				int status = rs.getInt("status");
				
				User user = new User(id,username,fullname, email, phonenumber, address,password,roleId,status);
				return user;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public User getUserByEmailAndPassword(String email,String password) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM user where email = ? and password = ?" );
				) {
			st.setString(1, email);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String fullname = rs.getString("fullname");
				String emailuser = rs.getString("email");
				String phonenumber = rs.getString("phonenumber");
				String address = rs.getString("address");
				String passworduser = rs.getString("password");
				int roleId = rs.getInt("role_id");
				int status = rs.getInt("status");
				
				User user = new User(id,username,fullname, emailuser, phonenumber, address,passworduser,roleId,status);
				return user;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void addUser(User user) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into user(username,email,password) values(?,?,?);");
		) {
			stt.setString(1, user.getUsername());
			stt.setString(2, user.getEmail());
			stt.setString(3, user.getPassword());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void editUser(User user) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
						"UPDATE user SET username= ?, fullname = ?, email = ?, phonenumber = ?, address = ? WHERE (id = ?)");) {
			stt.setString(1, user.getUsername());
			stt.setString(2, user.getFullname());
			stt.setString(3, user.getEmail());
			stt.setString(4, user.getPhonenumber());
			stt.setString(5, user.getAddress());
			stt.setInt(6, user.getId());
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeUser(int id) {
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement("UPDATE user SET status = 0 WHERE (id = ?)");) {
			stt.setInt(1, id);
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int changePassword(int id,String newPassword) {
		int rowsAffected = 0;
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
						"UPDATE user SET password= ? WHERE (id = ?)");) {
			stt.setString(1, newPassword);
			stt.setInt(2, id);
			rowsAffected = stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowsAffected;
	}
	
}
