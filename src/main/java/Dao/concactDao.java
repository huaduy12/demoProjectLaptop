package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.mysql.cj.exceptions.RSAException;

import Connection.ConnectionUtil;
import Model.Feedback;
import Model.Review;

public class concactDao {
	
	public List<Feedback> getListFeedbacks() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from feedback where status = 0;");
				) {
			
			ResultSet rs =  st.executeQuery();
			List<Feedback> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String subject = rs.getString("subject");	
				String message = rs.getString("message");
				Date create_at = rs.getDate("created_at");
				int status = rs.getInt("status");
				int userid = rs.getInt("user_id");
				
				Feedback feedback = new Feedback(id,name, email, subject, message, create_at, status, userid);
				
				result.add(feedback);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	public List<Feedback> getListFeedbackRespon() {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from feedback where status = 1;");
				) {
			
			ResultSet rs =  st.executeQuery();
			List<Feedback> result = new ArrayList<>();
			while (rs.next()) {
				
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String subject = rs.getString("subject");	
				String message = rs.getString("message");
				Date create_at = rs.getDate("created_at");
				int status = rs.getInt("status");
				int userid = rs.getInt("user_id");
				
				Feedback feedback = new Feedback(id,name, email, subject, message, create_at, status, userid);
				
				result.add(feedback);
			}
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	
	public Feedback getListFeedbackById(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("select * from feedback where id = ?;");
				) {
			st.setInt(1, id);
			ResultSet rs =  st.executeQuery();
			
			while (rs.next()) {
				
				int idu = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String subject = rs.getString("subject");	
				String message = rs.getString("message");
				Date create_at = rs.getDate("created_at");
				int status = rs.getInt("status");
				int userid = rs.getInt("user_id");
				
				Feedback feedback = new Feedback(idu,name, email, subject, message, create_at, status, userid);
				
				return feedback;
			}
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public void updateFeedback(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement("update feedback set status = 1 where id = ?");
				) {
			st.setInt(1, id);
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	public void deleteFeedback(int id) {
		try (Connection connection = ConnectionUtil.getConnection();

				PreparedStatement st = connection.prepareStatement(" delete from feedback where id = ?");
				) {
			st.setInt(1, id);
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}
