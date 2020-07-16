package com.scholarship.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.xml.ws.Response;

import com.scholarship.db.ScholarshipDb;
import com.scholarship.utility.ScholarshipUtility;

public class StudentDao {

	// DAO class contains method for all the required opreation in the database
	// table

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public StudentDao() {
	}

	// addStudent() will add the students in the student table

	public boolean addStudent(StudentDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				// getting the database connection if the connection is null
				conn = ScholarshipDb.getScholarshipDb();
			}
			// parameterised sql query for adding a student to table
			String sql = "insert into student(sname,uname,pwd,email,phone,gender,state,stream) values (?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			// setting the values given by user
			ps.setString(1, dto.getSname());
			ps.setString(2, dto.getUname());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getPhone());
			ps.setString(6, dto.getGender());
			ps.setString(7, dto.getState());
			ps.setString(8, dto.getStream());
			// checking whether the student is successfully added in the database table or
			// not
			// if the addition is successfull addStudent() will return true, else false
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
			// catching the exception if the data is not properly processed
		} catch (Exception e) {
			System.out.println("Exception in addStudent :" + e);
		}
		// we must have to execute this finally block even if the exception comes
		// After the add operation, we are setting the statement and connection back to
		// null
		finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	// updateStudent() will update the students in the student table

	public boolean updateStudent(StudentDto dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				// getting the database connection if the connection is null
				conn = ScholarshipDb.getScholarshipDb();
			}
			// parameterised sql query for updating a student to table
			String sql = "update student set sname=?,uname=?,pwd=?,email=?,phone=?,gender=?,state=?,stream=? where sid=?";
			ps = conn.prepareStatement(sql);
			// setting the values given by user
			ps.setString(1, dto.getSname());
			ps.setString(2, dto.getUname());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getPhone());
			ps.setString(6, dto.getGender());
			ps.setString(7, dto.getState());
			ps.setString(8, dto.getStream());
			ps.setInt(9, dto.getSid());
			// checking whether the student is successfully updated in the database table or
			// not
			// if the updation is successfull updateStudent() will return true, else false
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateStudent :" + e);
		}
		// we must have to execute this finally block even if the exception comes
		// After the update operation, we are setting the statement and connection back
		// to null
		finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	// deleteStudent() will delete the students from the student table

	public boolean deleteStudent(int sid) {
		boolean flag = false;
		if (conn == null) {
			// getting the database connection if the connection is null
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			// parameterised sql query for deleting a student from table
			String sql = "delete from student where sid=?";
			ps = conn.prepareStatement(sql);
			// setting the values given by user
			ps.setInt(1, sid);
			// checking whether the student is successfully deleted in the database table or
			// not
			// if the deletion is successfull deleteStudent() will return true, else false
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at deleteStudent :" + e);
		}
		// we must have to execute this finally block even if the exception comes
		// After the delete operation, we are setting the statement and connection back
		// to null
		finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	// getStudent() will fetch the specific student from the student table

	public StudentDto getStudent(int sid) {
		StudentDto dto = null;
		if (conn == null) {
			// getting the database connection if the connection is null
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			// parameterised sql query for fetching a specific student from table
			String sql = "select * from student where sid =?";
			ps = conn.prepareStatement(sql);
			// setting the values given by user
			ps.setInt(1, sid);
			rs = ps.executeQuery();
			// checking whether the student is avilable in the database table or not
			// if the student is available getStudent() will return the dto object
			if (rs.next()) {
				dto = new StudentDto();
				// getting the values obtained from the database table and setting in DTO object
				dto.setSid(rs.getInt("sid"));
				dto.setSname(rs.getString("sname"));
				dto.setUname(rs.getString("uname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setGender(rs.getString("gender"));
				dto.setState(rs.getString("state"));
				dto.setStream(rs.getString("stream"));

			}
		} catch (Exception e) {
			System.out.println("Exception at getStudent :" + e);
		}
		// we must have to execute this finally block even if the exception comes
		// After the get operation, we are setting the statement, connection, and
		// resultset back to null finally {
		rs = null;
		ps = null;
		conn = null;
		return dto;
	}

	// getAllStudent() will fetch all the students from the student table

	public ArrayList<StudentDto> getAllStudent() {
		ArrayList<StudentDto> al = new ArrayList<>();
		if (conn == null) {
			// getting the database connection if the connection is null
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			// sql query for fetching all students from table
			String sql = "select * from student";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			// checking whether the students are avilable in the database table or not
			// if the students are available getAllStudent() will return the ArrayList
			// object containing all students
			while (rs.next()) {
				StudentDto dto = new StudentDto();
				// getting the values obtained from the database table and setting in DTO object
				dto.setSid(rs.getInt("sid"));
				dto.setSname(rs.getString("sname"));
				dto.setUname(rs.getString("uname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setGender(rs.getString("gender"));
				dto.setState(rs.getString("state"));
				dto.setStream(rs.getString("stream"));

				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception at getAllStudent :" + e);
		}
		// we must have to execute this finally block even if the exception comes
		// After the getAll operation, we are setting the statement, connection, and
		// resultset back to null
		finally {
			rs = null;
			ps = null;
			conn = null;
			return al;
		}
	}

	// loginStudent() will fetch the student from the student table if the uname and
	// pwd is matching

	public StudentDto loginStudent(String uname, String pwd) {
		StudentDto dto = null;
		if (conn == null) {
			// getting the database connection if the connection is null
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			// parameterised sql query for fetching a specific student from table
			String sql = "select * from student where uname=? and pwd=?";
			ps = conn.prepareStatement(sql);
			// setting the values given by user
			ps.setString(1, uname);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			// checking whether the student is avilable in the database table or not
			// if the student is available loginStudent() will return the dto object
			if (rs.next()) {
				// getting the values obtained from the database table and setting in DTO object
				dto = new StudentDto();
				dto.setSid(rs.getInt("sid"));
				dto.setSname(rs.getString("sname"));
				dto.setUname(rs.getString("uname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setGender(rs.getString("gender"));
				dto.setState(rs.getString("state"));
				dto.setStream(rs.getString("stream"));

			}
		} catch (Exception e) {
			System.out.println("Exception at loginStudent :" + e);
		}
		// we must have to execute this finally block even if the exception comes
		// After the get operation for login, we are setting the statement, connection,
		// and resultset back to null
		finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public int sendOtp(String email) {
		int otp = 0;
		try {
			if (conn == null) {
				conn = ScholarshipDb.getScholarshipDb();
			}
			ps = conn.prepareStatement("Select * from student where email=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				otp = ScholarshipUtility.getRandom();
				if (!new ScholarshipUtility().sendMail("" + otp, email)) {
					otp = 0;
				} 
			}else {
				otp = 1;
			}
		} catch (Exception e) {
			System.out.println("Exception at sendOtp : " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return otp;
		}
	}

	public boolean changePassword(String email, String password) {
		boolean flag = true;
		try {
			if (conn == null) {
				conn = ScholarshipDb.getScholarshipDb();
			}
			String query = "update student set pwd=? where email=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, password);
			ps.setString(2, email);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception in changePassword : " + e.getMessage());
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<StudentDto> checkStudent(String state, String stream) {
		ArrayList<StudentDto> al = new ArrayList<>();
		if (conn == null) {
			// getting the database connection if the connection is null
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			// parameterised sql query for fetching a specific student from table
			String sql = "select * from student where state=? and stream=?";
			ps = conn.prepareStatement(sql);
			// setting the values given by user
			ps.setString(1, state);
			ps.setString(2, stream);
			rs = ps.executeQuery();
			// checking whether the student is avilable in the database table or not
			// if the student is available loginStudent() will return the dto object
			while (rs.next()) {
				// getting the values obtained from the database table and setting in DTO object
				StudentDto dto = new StudentDto();

				dto.setSid(rs.getInt("sid"));
				dto.setSname(rs.getString("sname"));
				dto.setUname(rs.getString("uname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setGender(rs.getString("gender"));
				dto.setState(rs.getString("state"));
				dto.setStream(rs.getString("stream"));
				al.add(dto);

			}
		} catch (Exception e) {
			System.out.println("Exception at checkStudent :" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return al;
		}
	}
}
