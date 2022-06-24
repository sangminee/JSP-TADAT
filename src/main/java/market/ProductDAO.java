package market;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {

	private Connection conn;
	private ResultSet rs;
	
	public ProductDAO() {  // 데이터 접근 객체 
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
		String SQL = "SELECT productID FROM PRODUCT ORDER BY productID DESC";
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
	
	public int write(String productTitle,String userID, String productCategory,String productPhoto,
			String productPrice, String productContent) {
		
		String SQL = "INSERT INTO PRODUCT VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, productTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, productCategory);
			pstmt.setString(5, productPhoto);
			pstmt.setString(6, productPrice);
			pstmt.setString(7, productContent);
			pstmt.setString(8, getDate());
			pstmt.setInt(9, 1);
			
			return pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Product> getList(int pageNumber){
		String SQL = "SELECT * FROM PRODUCT WHERE productID < ? AND productAvaliable = 1 ORDER BY productID DESC LIMIT 10";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getInt(1));
				product.setProductTitle(rs.getString(2));
				product.setUserID(rs.getString(3));
				product.setProductCategory(rs.getString(4));
				product.setProductPhoto(rs.getString(5));
				product.setProductPrice(rs.getString(6));
				product.setProductContent(rs.getString(7));
				product.setProductDate(rs.getString(8));
				product.setProductAvaliable(rs.getInt(9));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // 데이터베이스 오류
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM PRODUCT WHERE productID < ? AND productAvaliable =1";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
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
