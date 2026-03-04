package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import dto.OrderDTO;

public class OrderDAO {
    
    // DB 연결 메서드
	public Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/testdb", "green", "1234");
        return conn;
    }

    // 주문 등록 메서드
    public int insertOrder(OrderDTO order) {
        String sql = "INSERT INTO tbl_order_202101 (orderno, shopno, orderdate, pcode, amount) VALUES (?, ?, ?, ?, ?)";
        int result = 0;
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, order.getOrderno());
            pstmt.setString(2, order.getShopno());
            pstmt.setString(3, order.getOrderdate());
            pstmt.setString(4, order.getPcode());
            pstmt.setInt(5, order.getAmount());
            
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}