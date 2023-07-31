package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import Connection.ConnectionUtil;
import Model.Feedback;
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
	
	
	public List<User> getListUsersByStatus() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM user where role_id =2 and status = 1 order by id desc;");
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

				PreparedStatement st = connection.prepareStatement("SELECT * FROM user where email = ? and password = ? and role_id =2;" );
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
	
	public User getUserByEmailAndPasswordAdmin(String email,String password) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("SELECT * FROM user where email = ? and password = ? and role_id =1;" );
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
	
	
	public List<User> getNameUser() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from `user` where role_id = 2 order by id desc limit 5;" );
				) {
			
			ResultSet rs = st.executeQuery();
			List<User> users = new ArrayList<>();
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
				users.add(user);
				
			}
			return users;

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
	
	public void addUserByAdmin(User user) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into user(username,fullname,email,phonenumber,address,password,role_id) values(?,?,?,?,?,?,?);");
		) {
			stt.setString(1, user.getUsername());
			stt.setString(2, user.getEmail());
			stt.setString(3, user.getPassword());
			stt.setString(4, user.getPhonenumber());
			stt.setString(5, user.getAddress());
			stt.setString(6, user.getPassword());
			stt.setInt(7, user.getRole_id());
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
	
	
	public int updateInfor(User user) {
		int rowsAffected = 0;
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
						"UPDATE user SET username = ?,fullname = ?,email= ?,phonenumber = ?,address = ?,password = ? WHERE (id = ?)");) {
			stt.setString(1, user.getUsername());
			stt.setString(2, user.getFullname());
			stt.setString(3, user.getEmail());
			stt.setString(4, user.getPhonenumber());
			stt.setString(5, user.getAddress());
			stt.setString(6, user.getPassword());
			stt.setInt(7, user.getId());
		
			rowsAffected = stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowsAffected;
	}
	
	
	public int changePasswordByEmail(String email,String newPassword) {
		int rowsAffected = 0;
		try (Connection conn = ConnectionUtil.getConnection();
				PreparedStatement stt = conn.prepareStatement(
						"UPDATE user SET password= ? WHERE (email = ?)");) {
			stt.setString(1, newPassword);
			stt.setString(2, email);
			rowsAffected = stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowsAffected;
	}
	
	
	public void addUserFeeback(Feedback feedback) {
		try (
			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement stt = conn.prepareStatement("insert into feedback(name,email,subject,message,created_at,status,user_id) values(?,?,?,?,NOW(),?,?);");
		) {
			stt.setString(1, feedback.getName());
			stt.setString(2,feedback.getEmail());
			stt.setString(3,feedback.getSubject());
			stt.setString(4, feedback.getMessage());
			stt.setInt(5,0 );
			stt.setInt(6, feedback.getUser_id());
			
			stt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int getCountUser() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select count(*) from user where role_id =2;" );
				) {
		
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
			  int c = rs.getInt(1);
				
				return c;
			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	
}
