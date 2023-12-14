<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h2>관리자 로그인</h2>
 	<hr>
 	<%
 		request.setCharacterEncoding("utf-8");
 		
 		String aid = request.getParameter("adminID");
 		String apw = request.getParameter("adminPW");
 		
		String sql="SELECT * FROM membertb WHERE userid='"+aid+"' AND userpw='"+apw+"'";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/memberdata";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);//select문 실행->executeQuery로 SQL문 실행
			//DB에서 보내주는 select문의 실행결과를 ResultSet 클래스로 만든 rs로 받음
			
			if(rs.next()) {
				session.setAttribute("adminID", aid);
				// 세션에 로그인한 adminID를 올려서 생성
				out.println("관리자" + aid + "로그인 하셨습니다.");
			} else {
				response.sendRedirect("loginErr.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		
 
	%>
	
	<table border="0">
		<tr>
			<td>
				<form action="memberlist.jsp">
					<input type="submit" value="◀ 등록회원 관리">
				</form>
			</td>
			<td>
				<form action="logout.jsp">
					<input type="submit" value="로그아웃하기 ▶">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>