package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import repository.EmployeeDao;
import repository.OutIdDao;
import vo.*;

public class EmployeeService {

	public int getEmployeeListLastPage(int rowPerPage) {
		
		System.out.println("EmployeeService안에있는 getEmployeeListLastPage실행");
		
		Connection conn = null;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); // 자동커밋방지

			EmployeeDao employeeDao = new EmployeeDao();
			rowPerPage = employeeDao.EmployeelastPage(conn);

			System.out.print("EmployeeService의 rowPerPage : " + rowPerPage);

			if (rowPerPage == 0) {
				throw new Exception();
			}
			conn.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		System.out.println("EmployeeService.getEmployeeListLastPage.rowPerPage값 : " + rowPerPage);
		return rowPerPage;

	}

	// 회원정보
	public ArrayList<Employee> getEmployeeList(int rowPerPage, int currentPage) {
		
		System.out.println("EmployeeService안에있는 getEmployeeList실행");

		ArrayList<Employee> list = new ArrayList<Employee>();
		Connection conn = null;
		int beginRow = (currentPage - 1) * rowPerPage;

		try {
			conn = new DBUtil().getConnection();
			EmployeeDao employeeDao = new EmployeeDao();

			list = employeeDao.SelectEmployeeList(conn, rowPerPage, beginRow);

			if (list == null) {
				throw new Exception();
			}
			conn.commit();
		} catch (Exception e) {

			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}
		System.out.println("EmployeeService.getEmployeeList.list값 : " + list);
		return list;

	}

	// 회원가입
	public void signInEmployee(Employee paramEmployee) {
		
		System.out.println("EmployeeService안에있는 signInEmployee실행");
		
		Connection conn = null;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false); 

			EmployeeDao employeeDao = new EmployeeDao();

			try {
				employeeDao.insertEmployee(conn, paramEmployee);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn.commit();

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	// 회원탈퇴
	public boolean removeEmployee(Employee paramEmployee) {
		
		System.out.println("EmployeeService안에있는 removeEmployee실행");

		Connection conn = null;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			EmployeeDao employeeDao = new EmployeeDao();
			if (employeeDao.deleteEmployee(conn, paramEmployee) != 1) {
				throw new Exception();
			}
			OutIdDao OutIdDao = new OutIdDao();
			if (OutIdDao.insertOutId(conn, paramEmployee.getEmployeeId()) != 1) {
				
				throw new Exception();
			}
			conn.commit(); 
		} catch (Exception e) {
			e.printStackTrace();// 콘솔창에 예외메시지 출력
			try {
				conn.rollback(); 
			} catch (SQLException e1) {
			
				e1.printStackTrace();
			}
			return false;
		} finally {
			try {
				conn.close(); 
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}
		return true;
	}

	// 로그인
	public Employee loginEmployee(Employee paramEmployee) {
		
		System.out.println("EmployeeService안에있는 loginEmployee실행");
		
		Connection conn = null;
		Employee employee = new Employee(); //employee객체만들기
		
		try {
			
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			EmployeeDao employeeDao = new EmployeeDao();
			employee = employeeDao.selectEmployee(conn, paramEmployee);
			System.out.println("service employee = "+ employee);

			conn.commit();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}
		
		return employee;

	}
	
	// 직원 active값 변경
	public int EmployeeActive(Employee employee) {
		
		System.out.println("EmployeeService안에있는 EmployeeActive실행");
		
		Connection conn = null;
		int row = 0;

		try {
			conn = new DBUtil().getConnection();
			conn.setAutoCommit(false);

			EmployeeDao employeeDao = new EmployeeDao();
			row = employeeDao.updateEmployee(conn, employee);

			if (row == 0) {
				throw new Exception();
			}
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("EmployeeService.EmployeeActive.row값 : " + row);
		return row;

	}
}
