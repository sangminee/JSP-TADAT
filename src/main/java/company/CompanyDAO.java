package company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CompanyDAO {

	private Connection conn;
	private ResultSet rs;
	
	public CompanyDAO() {  // 데이터 접근 객체 
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
		String SQL = "SELECT companyID FROM COMPANY ORDER BY companyID DESC";
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
	
	public int write(String userID, String companyName
			, String companyField, String companyWorkingHours
			, String companySalary, String companyContent) {
		
		String SQL = "INSERT INTO COMPANY VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, companyName);
			pstmt.setString(4, companyField);
			pstmt.setString(5, companyWorkingHours);
			pstmt.setString(6, companySalary);
			pstmt.setString(7, companyContent);
			pstmt.setString(8, getDate());
			pstmt.setInt(9, 1);
			
			return pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Company> getList(int pageNumber){
		String SQL = "SELECT * FROM COMPANY WHERE companyID < ? AND companyAvaliable =1 ORDER BY companyID DESC LIMIT 10";
		ArrayList<Company> list = new ArrayList<Company>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Company company = new Company();
				company.setCompanyID(rs.getInt(1));
				company.setUserID(rs.getString(2));
				company.setCompanyName(rs.getString(3));
				company.setCompanyField(rs.getString(4));
				company.setCompanyWorkingHours(rs.getString(5));
				company.setCompanySalary(rs.getString(6));
				company.setCompanyContent(rs.getString(7));
				company.setCompanyDate(rs.getString(8));
				company.setCompanyAvaliable(rs.getInt(9));

				list.add(company);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // 데이터베이스 오류
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM COMPANY WHERE companyID < ? AND companyAvaliable =1";
		ArrayList<Company> list = new ArrayList<Company>();
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
