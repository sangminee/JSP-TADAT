package community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommunityDAO {

	private Connection conn;
	private ResultSet rs;
	
	public CommunityDAO() {  // 데이터 접근 객체 
		try {
			String dbURL = "";
			String dbID = ""; // db 아이디 
			String dbPassword = "";   // db 로그인
			Class.forName("com.mysql.jdbc.Driver");
			
			conn=DriverManager.getConnection(dbURL,dbID, dbPassword);	
			System.out.println("DB 연결성공");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT communityID FROM COMMUNITY ORDER BY communityID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; // 첫번째 게시물인 경우 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String userID, String communityTitle, String communityContent) {
		
		String SQL = "INSERT INTO COMMUNITY VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, communityTitle);
			pstmt.setString(4, communityContent);
			pstmt.setString(5, getDate());
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Community> getList(int pageNumber){
		String SQL = "SELECT * FROM COMMUNITY WHERE communityID < ? AND communityAvaliable =1 ORDER BY communityID DESC LIMIT 10";
		ArrayList<Community> list = new ArrayList<Community>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Community community = new Community();
				community.setCommunityID(rs.getInt(1));
				community.setUserID(rs.getString(2));
				community.setCommunityTitle(rs.getString(3));
				community.setCommunityContent(rs.getString(4));
				community.setCommunityDate(rs.getString(5));
				community.setCommunityAvaliable(rs.getInt(6));

				list.add(community);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // 데이터베이스 오류
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM COMMUNITY WHERE communityID < ? AND communityAvaliable =1";
		ArrayList<Community> list = new ArrayList<Community>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류
	}
}
