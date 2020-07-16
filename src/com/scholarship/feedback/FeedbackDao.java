package com.scholarship.feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.scholarship.db.ScholarshipDb;

public class FeedbackDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public FeedbackDao() {
	}

	public boolean addFeedback(FeedbackDto dto) {
		boolean flag = false;
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "insert into feedback(feed) values(?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getFeed());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("Exception at addFeedback():" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<FeedbackDto> getAllFeedback() {
		ArrayList<FeedbackDto> list = new ArrayList<>();
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "select *from feedback";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			FeedbackDto dto;
			while (rs.next()) {
				dto = new FeedbackDto();
				dto.setFid(rs.getInt("fid"));
				dto.setFeed(rs.getString("feed"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("Exception at getAllFeedback:" + e);
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

	public boolean deleteFeedback(int fid) {
		boolean flag = false;
		if (conn == null) {
			conn = ScholarshipDb.getScholarshipDb();
		}
		try {
			String sql = "delete from feedback where fid=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fid);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("Exception at deleteFeedback:" + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return flag;
		}
	}
}
