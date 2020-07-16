package com.scholarship.scholarship;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.scholarship.db.ScholarshipDb;

public class ScholarshipDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public ScholarshipDao() {
	}

	public boolean addScholarship(ScholarshipDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "insert into scholarship(name, description, state, stream) values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getDescription());
			ps.setString(3, dto.getState());
			ps.setString(4, dto.getStream());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at addScholarship():" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateScholarship(ScholarshipDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "update scholarship set name=?, description=?, state=?, stream=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getDescription());
			ps.setString(3, dto.getState());
			ps.setString(4, dto.getStream());
			ps.setInt(5, dto.getId());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at updateScholarship():" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<ScholarshipDto> getAllScholarship() {
		ArrayList<ScholarshipDto> list = new ArrayList<>();
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "select *from scholarship";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ScholarshipDto dto;
			while (rs.next()) {
				dto = new ScholarshipDto();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setDescription(rs.getString("description"));
				dto.setState(rs.getString("state"));
				dto.setStream(rs.getString("stream"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("Exception at getAllScholarship:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			if (list.isEmpty()) {
				list = null;
			}
			return list;
		}
	}

	public ScholarshipDto getScholarship(int id) {
		ScholarshipDto dto1 = null;
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "select *from scholarship where id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto1 = new ScholarshipDto();
				dto1.setId(rs.getInt("id"));
				dto1.setName(rs.getString("name"));
				dto1.setDescription(rs.getString("description"));
				dto1.setState(rs.getString("state"));
				dto1.setStream(rs.getString("stream"));
			}

		} catch (Exception e) {
			System.out.println("Exception at getScholarship:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto1;
		}
	}

	public ArrayList<ScholarshipDto> ScholarshipByState(String state) {
		ArrayList<ScholarshipDto> list = new ArrayList<>();
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "select *from scholarship where state=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, state);
			rs = ps.executeQuery();
			ScholarshipDto dto;
			while (rs.next()) {
				dto = new ScholarshipDto();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setDescription(rs.getString("description"));
				dto.setState(rs.getString("state"));
				dto.setStream(rs.getString("stream"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("Exception at ScholarshipByState:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			if (list.isEmpty()) {
				list = null;
			}
			return list;
		}
	}

	public ArrayList<ScholarshipDto> ScholarshipByStream(String stream) {
		ArrayList<ScholarshipDto> list = new ArrayList<>();
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "select *from scholarship where stream=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, stream);
			rs = ps.executeQuery();
			ScholarshipDto dto;
			while (rs.next()) {
				dto = new ScholarshipDto();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setDescription(rs.getString("description"));
				dto.setState(rs.getString("state"));
				dto.setStream(rs.getString("stream"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("Exception at ScholarshipByStream:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			if (list.isEmpty()) {
				list = null;
			}
			return list;
		}
	}

	public ArrayList<ScholarshipDto> ScholarshipByStateStream(String state, String stream) {
		ArrayList<ScholarshipDto> list = new ArrayList<>();
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "select *from scholarship where stream=? and state=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, stream);
			ps.setString(2, state);
			rs = ps.executeQuery();
			ScholarshipDto dto;
			while (rs.next()) {
				dto = new ScholarshipDto();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setDescription(rs.getString("description"));
				dto.setState(rs.getString("state"));
				dto.setStream(rs.getString("stream"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("Exception at ScholarshipByStateStream:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			if (list.isEmpty()) {
				list = null;
			}
			return list;
		}
	}

	public boolean deleteScholarship(int id) {
		boolean flag = false;
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "delete from scholarship where id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("Exception at deleteScholarship:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteScholarshipSpecific() {
		boolean flag = false;
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "delete from scholarship ORDER BY id DESC Limit 1";
			ps = conn.prepareStatement(sql);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("Exception at deleteScholarshipSpecific:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return flag;
		}
	}

}
