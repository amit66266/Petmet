package com.net.DAO;

import java.sql.*;

import com.net.bean.PetBean;
import com.net.bean.UserBean;

public class UserDAO {
	static String dclass = "com.mysql.cj.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/pet_adopt";
	static String username = "root";
	static String password = "Madhavsingh0#";

	static Connection con = null;
	static int status = 0;
	static Statement st = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;

	public static int Register(UserBean ub) {
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "insert into user(uname,password,name,email,dob,city) values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);

			ps.setString(1, ub.getUname());
			ps.setString(2, ub.getPassword());
			ps.setString(3, ub.getName());
			ps.setString(4, ub.getEmail());
			ps.setString(5, ub.getDob());
			ps.setString(6, ub.getCity());

			status = ps.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public static UserBean Login(UserBean ub) {
		UserBean user = null;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);

			String sql = "SELECT * FROM user WHERE uname=? AND password=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ub.getUname());
			ps.setString(2, ub.getPassword());

			rs = ps.executeQuery();

			if (rs.next()) {
				user = new UserBean();
				user.setUname(rs.getString("uname"));
				user.setRole(rs.getString("role"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public static ResultSet Show() {
		status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "select * from user";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
			status = -1;
		}
		return rs;
	}

	public static ResultSet ShowUpdate(String uname) {
		status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "select * from user where uname=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, uname);
			rs = ps.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
			status = -1;
		}
		return rs;
	}

	public static int Update(UserBean ub) {
		status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "UPDATE user SET uname=?, password=?, name=?, email=?, dob=?, city=? WHERE uname=?";
			ps = con.prepareStatement(sql);

			ps.setString(1, ub.getUname());
			ps.setString(2, ub.getPassword());
			ps.setString(3, ub.getName());
			ps.setString(4, ub.getEmail());
			ps.setString(5, ub.getDob());
			ps.setString(6, ub.getCity());
			ps.setString(7, ub.getUname());

			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			status = -1;
		}
		return status;
	}

	public static int Delete(String uname) {
		status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "delete from user where uname=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, uname);

			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			status = -1;
		}
		return status;
	}

	public static ResultSet getAllPets() {
		ResultSet rs = null;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "SELECT * FROM pets";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static ResultSet getPetById(int id) {
		ResultSet rs = null;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "SELECT * FROM pets WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int updatePet(PetBean pb) {
		int status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "UPDATE pets SET name=?, breed=?, age=?, gender=?, description=?, image=? WHERE id=?";
			ps = con.prepareStatement(sql);

			ps.setString(1, pb.getName());
			ps.setString(2, pb.getBreed());
			ps.setInt(3, pb.getAge());
			ps.setString(4, pb.getGender());
			ps.setString(5, pb.getDescription());
			ps.setString(6, pb.getImage());
			ps.setInt(7, pb.getId());

			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			status = -1;
		}
		return status;
	}

	public static int insertPet(PetBean pb) {
		int status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "INSERT INTO pets (name, breed, age, gender, description, image) VALUES (?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);

			ps.setString(1, pb.getName());
			ps.setString(2, pb.getBreed());
			ps.setInt(3, pb.getAge());
			ps.setString(4, pb.getGender());
			ps.setString(5, pb.getDescription());
			ps.setString(6, pb.getImage());

			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			status = -1;
		}
		return status;
	}

	public static int deletePet(int id) {
		int status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "DELETE FROM pets WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			status = -1;
		}
		return status;
	}

	public static int insertFeedback(String uname, String message) {
		int status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "INSERT INTO feedbacks (username, message) VALUES (?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, message);
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static ResultSet getAllFeedback() {
		ResultSet rs = null;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "SELECT * FROM feedbacks ORDER BY submitted_at DESC";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int deleteFeedback(int id) {
		int status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "DELETE FROM feedbacks WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int adoptPet(String uname, int petid) {
		int status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "INSERT INTO adoptions (username, pet_id, adopted_at) VALUES (?, ?, NOW())";
			ps = con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setInt(2, petid);
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int isPetAlreadyAdopted(int petid) {
		int adopted = 0; 
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "SELECT * FROM adoptions WHERE pet_id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, petid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				adopted = 1; 
			}
		} catch (Exception e) {
			e.printStackTrace();
			adopted = -1;
		}
		return adopted;
	}

	public static String getPetAdopter(int petid) {
		String adopter = null;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "SELECT username FROM adoptions WHERE pet_id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, petid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				adopter = rs.getString("username");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return adopter; 
	}

	public static int isPetAdoptedByUser(String uname, int petid) {
		int adopted = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "SELECT * FROM adoptions WHERE username = ? AND pet_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setInt(2, petid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				adopted = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			adopted = -1; // Optional: -1 indicates error
		}
		return adopted;
	}

	public static ResultSet getAdoptedPets(String uname) {
		ResultSet rs = null;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "SELECT a.id AS adoption_id, p.* FROM adoptions a LEFT JOIN pets p ON p.id = a.pet_id WHERE a.username = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, uname);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static ResultSet getAdoptedPets() {
		ResultSet rs = null;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);

			String sql = "SELECT a.id AS adoption_id, a.username, p.*, u.name AS adopter_name " +
					"FROM adoptions a " +
					"LEFT JOIN pets p ON p.id = a.pet_id " +
					"LEFT JOIN user u ON u.uname = a.username";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int getAdoptionCount(String uname) {
		int count = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "SELECT COUNT(*) FROM adoptions WHERE username = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public static int getTotalAdoptionCount() {
		int count = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "SELECT COUNT(*) FROM adoptions";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public static int deleteAdoption(int id) {
		int status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);
			String sql = "DELETE FROM adoptions WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int makeAdmin(String uname) {
		int status = 0;
		try {
			Class.forName(dclass);
			con = DriverManager.getConnection(url, username, password);

			String sql = "UPDATE user SET role='admin' WHERE uname=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, uname);

			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			status = -1;
		}
		return status;
	}

}
