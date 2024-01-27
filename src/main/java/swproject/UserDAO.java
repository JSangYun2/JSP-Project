package swproject;

import java.sql.*;


public class UserDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public UserDAO() {
      try {
    		Class.forName("com.mysql.jdbc.Driver");
    		String jdbcURL = "jdbc:mysql://localhost:3306/jsp_project";
    		String dbUser = "root";
    		String dbPass = "rootpw";
    		
    		conn = DriverManager.getConnection(jdbcURL,dbUser,dbPass);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public int login(String userID, String userPW) {
      String SQL = "select userPW from userinfo where userID = ?";
      try {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1, userID);
         rs = pstmt.executeQuery();
         
         if (rs.next()) {
            if (rs.getString(1).equals(userPW)) {
               return 1; // 로그인 성공
            }
            else {
               return 0; // 비밀번호 불일치
            }
         }
         return -1; // 아이디가 없음   
      } catch (Exception e) {
         e.printStackTrace();
      }
      return -2; // 데이터베이스 오류
   }
}