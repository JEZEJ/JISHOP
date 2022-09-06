package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.*;

public class EmployeeDao {

	// 로그인
	public Employee selectEmployee(Connection conn, Employee paramemployee) throws SQLException {
		
		System.out.println("EmployeeDao안에있는 selectEmployee(로그인) 실행");

		Employee loginEmployee = null;

		String sql = "SELECT employee_id, employee_pass, employee_name, update_date, create_date, active FROM employee WHERE employee_id=? AND employee_pass=PASSWORD(?) AND active='Y'";

		PreparedStatement stmt = null;
		ResultSet rset = null;

		try {

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramemployee.getEmployeeId());
			stmt.setString(2, paramemployee.getEmployeePass());
			rset = stmt.executeQuery();
			System.out.println("Dao : " + rset);

			if (rset.next()) { 
				
				//쿼리가 실행이 안됬으면 rset이 0이라서 이부분이 실행이 안됨.
				
				loginEmployee = new Employee();
				loginEmployee.setEmployeeId(rset.getString("employee_id"));
				loginEmployee.setEmployeePass(rset.getString("employee_pass"));
				loginEmployee.setEmployeeName(rset.getString("employee_name"));
				
				System.out.println("loginEmployee : " + loginEmployee);
			}

		} finally {
			
			if(stmt!=null) {stmt.close();}
			if(rset!=null) {rset.close();}
		}
		
		return loginEmployee;
	}

	// 회원가입
	public int insertEmployee(Connection conn, Employee paramEmployee) throws SQLException {
		
		System.out.println("EmployeeDao안에있는 insertEmployee(회원가입) 실행");
		
		int row = 0;

		String sql = "INSERT INTO Employee ( employee_id, employee_pass, employee_name,employee_address,employee_detailaddress,employee_telephone,update_date, create_date, active) VALUES ( ?, PASSWORD(?), ?,?,?,?, NOW(), NOW(), 'N')";

		PreparedStatement stmt = null;

		try { // ?값 넣어주기
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramEmployee.getEmployeeId());
			stmt.setString(2, paramEmployee.getEmployeePass());
			stmt.setString(3, paramEmployee.getEmployeeName());
			stmt.setString(4, paramEmployee.getEmployeeAddress());
			stmt.setString(5, paramEmployee.getEmployeeDetailaddress());
			stmt.setString(6, paramEmployee.getEmployeeTelephone());

			row = stmt.executeUpdate();
			
		} finally {
			
			stmt.close();
		}
		System.out.println("EmployeeDao.insertEmployee.row값 :"+row);
		return row;
	}

	// 탈퇴
	public int deleteEmployee(Connection conn, Employee paramEmployee) throws SQLException {
		
		System.out.println("EmployeeDao안에있는 deleteEmployee(탈퇴) 실행");

		int row = 0;

		// DELETE FROM employee WHERE employee_id AND employee_pass=PASSWORD(?)

		// 삭제쿼리
		String sql = "DELETE FROM employee WHERE employee_id=? AND employee_pass=PASSWORD(?)";

		PreparedStatement stmt = null;

		try {

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paramEmployee.getEmployeeId());
			stmt.setString(2, paramEmployee.getEmployeePass());

			row = stmt.executeUpdate();

		} finally {

			stmt.close();
		}
		
		System.out.println("EmployeeDao.deleteEmployee.row값 :"+row);
		
		return row;
	}

	// 사원 상세보기
	// 그 테이블의 값들을 전부 가져와야함
	public ArrayList<Employee> SelectEmployeeList(Connection conn, int rowPerPage, int beginRow) throws SQLException {
		
		System.out.println("EmployeeDao안에있는 selectEmployeeList(직원목록) 실행");
		
		ArrayList<Employee> list = new ArrayList<Employee>();

		// SELECT employee_id, employee_pass, employee_name, update_date, create_date,
		// active FROM employee ORDER BY crate_date DESC LIMIT ?, ?;

		// 그냥 employee 리스트의 값 다 받아오는거니까 *은 되도록 쓰지말기
		String sql = " SELECT employee_id, employee_pass, employee_name, update_date, create_date, active FROM employee ORDER BY create_date DESC LIMIT ?, ?";

		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		Employee employee = new Employee();

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rset = stmt.executeQuery();

			while (rset.next()) {
				employee = new Employee();
				employee.setEmployeeId(rset.getString("employee_id"));
				employee.setEmployeePass(rset.getString("employee_pass"));
				employee.setEmployeeName(rset.getString("employee_name"));
				employee.setCreateDate(rset.getString("create_date"));
				employee.setUpdateDate(rset.getString("update_date"));
				employee.setActive(rset.getString("active"));
				list.add(employee);

			}

		} finally {
			if (rset != null) {
				rset.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}
		System.out.println("EmployeeDao.SelectEmployeeList.list값 :"+list);
		
		return list;
	}

	// 사원테이블 active 값 변경
	
	public int updateEmployee(Connection conn, Employee paramEmployee) throws SQLException {
		
		System.out.println("EmployeeDao안에있는 updateEmployee(사원테이블 active값 변경) 실행");

		int row = 0;

		// update쿼리 active값을 y 또는 n으로 변경
		String sql = "UPDATE employee SET active = ? WHERE employee_id = ?";
		PreparedStatement stmt = null;

		try {
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,paramEmployee.getActive() );
			stmt.setString(2,paramEmployee.getEmployeeId() );
			
			row = stmt.executeUpdate();
			
		} finally {
			
			if(stmt!=null) {stmt.close();}

		}

		System.out.println("EmployeeDao.updateEmployee.row값 :"+row);
		
		return row;

	}

	// employee테이블 갯수를 출력해줌
	public int EmployeelastPage(Connection conn) throws SQLException {
		
		System.out.println("EmployeeDao안에있는 employeeLastPage(employee테이블안에 값 갯수) 실행");

		String sql = "SELECT COUNT(*) FROM employee";
		PreparedStatement stmt = null;
		ResultSet rset = null;
		int totalCount = 0;

		try {
			stmt = conn.prepareStatement(sql);
			rset = stmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}

			System.out.print(totalCount + "Employee의 dao");

		} finally {

			if (rset != null) {
				rset.close();
			}
			if (rset != null) {
				stmt.close();
			}
		}
		System.out.println("EmployeeDao.EmployeelastPage.totalCount값 :"+totalCount);
		return totalCount;

	}
}
