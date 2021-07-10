package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dto.Product;

public class ProductDao {

	private Connection conn;
	private ResultSet rs;
	
	private static ProductDao instance = new ProductDao();
	
		public static ProductDao getinstance() {
			return instance;
		}
	
	public ProductDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/irish?serverTimezone=UTC", "root","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 메소드 : 모든 제품 호출
	public ArrayList<Product> getAllProducts(){
		ArrayList<Product> listProducts = new ArrayList<Product>();
		
		String SQL = "SELECT * FROM product";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setpID(rs.getString(1));
				product.setpName(rs.getString(2));
				product.setpQuantity(rs.getInt(3));
				product.setpPrice(rs.getInt(4));
				product.setpImg(rs.getString(5));
				product.setpSize(rs.getString(6));
				product.setactivation(rs.getInt(7));
			
				listProducts.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listProducts;
	}
	
	
	// 메소드 : 제품 id에 해당하는 제품 정보 반환
	public Product getProduct(String pID) {
		Product product = null;
		String SQL = "SELECT * FROM product WHERE pID =?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new Product();
				product.setpID(rs.getString(1));
				product.setpName(rs.getString(2));
				product.setpQuantity(rs.getInt(3));
				product.setpPrice(rs.getInt(4));
				product.setpImg(rs.getString(5));
				product.setpSize(rs.getString(6));
				product.setactivation(rs.getInt(7));
				
				return product;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}
	
	
	// 메소드 : 제품 추가
	public int setProduct(Product product) {
		String SQL = "INSERT INTO product VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, product.getpID());
			pstmt.setString(2, product.getpName());
			pstmt.setInt(3, product.getpQuantity());
			pstmt.setInt(4, product.getpPrice());
			pstmt.setString(5, product.getpImg());
			pstmt.setString(6, product.getpSize());
			pstmt.setInt(7, product.getactivation());
			pstmt.executeUpdate();
			
			return 1;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 메소드 : 제품 수정
	public int updateProduct(Product product) {
		String SQL = "UPDATE product SET pName=? , pQuantity=? , pPrice=? , pImg=? , pSize=? WHERE pID=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, product.getpName());
			pstmt.setInt(2, product.getpQuantity());
			pstmt.setInt(3, product.getpPrice());
			pstmt.setString(4, product.getpImg());
			pstmt.setString(5, product.getpSize());
			pstmt.setString(6, product.getpID());
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	// 메소드 : 제품 삭제
	public int deleteProduct(String pID) {
		String SQL = "DELETE FROM product WHERE pID =?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pID);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 검색 제품 호출
	public ArrayList<Product> serarchGetAllProducts(String key, String keyword){
		ArrayList<Product> listProducts = new ArrayList<Product>();
		String SQL = "SELECT * FROM product WHERE "+key+" like '%"+keyword+"%'";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Product product = new Product();
				product.setpID(rs.getString(1));
				product.setpName(rs.getString(2));
				product.setpQuantity(rs.getInt(3));
				product.setpPrice(rs.getInt(4));
				product.setpImg(rs.getString(5));
				product.setpSize(rs.getString(6));
				product.setactivation(rs.getInt(7));
				
				listProducts.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listProducts;
	}
	
	// 메소드 : 제품 활성화 여부
	public int activation(String pID) {
		String SQL = "SELECT activation FROM product WHERE pID =?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt("activation")  == 1) {
					SQL = "UPDATE product SET activation = 0 WHERE pID =?";
					PreparedStatement pstmt2 = conn.prepareStatement(SQL);
					pstmt2.setString(1, pID);
					pstmt2.executeUpdate();
					return 1;
				}
			}
			if(rs.getInt("activation")  == 0) {
				SQL = "UPDATE product SET activation = 1 WHERE pID =?";
				PreparedStatement pstmt2 = conn.prepareStatement(SQL);
				pstmt2.setString(1, pID);
				pstmt2.executeUpdate();
				return 1;
			}
			if(rs.getInt("activation")  == 2) {
				SQL = "UPDATE product SET activation = 1 WHERE pID =?";
				PreparedStatement pstmt2 = conn.prepareStatement(SQL);
				pstmt2.setString(1, pID);
				pstmt2.executeUpdate();
				return 1;
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 메소드 : 제품 재고 여부
	public int soldout() {
		String SQL = "UPDATE product SET activation = 2 where pQuantity = 0";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	
	
}
