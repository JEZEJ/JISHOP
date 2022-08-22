package repository;

import java.sql.*;

public class CounterDao {
	
   public String selectCounterToday(Connection conn) {
      String result = null;
      // SELECT counter_date FROM counter WHERE counter_date = CURDATE()
      return result;   
   }
   
   public void insertCounter(Connection conn) {
      // INSERT INTO counter(counter_date,counter_num) VALUES(CURDATE(),1)
   }
   
   public void updateCounter(Connection conn) {
      // UPDATE counter SET counter_num = counter_num+1 WHERE counter_date = CURDATE()
   }
   
   
   // IndexController에서 호출
   // 전체접속자 수
   // SELECT SUM(counter_num) FROM counter; 
   
   // 오늘 접속자 수
   // SELECT counter_num FROM counter WHERE counter_date = CURDATE();
}