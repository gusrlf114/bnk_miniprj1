<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@charset "utf-8";

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

header .head {
	height: 120px;
	background-color: rgb(47, 0, 255);
	color: white;
	text-align: center;
	/* line-height: 10px; */
	font-size: 40px;
	padding-top: 25px;
}

header ul {
	background-color: pink;
	display: flex;
	justify-content: center;
	text-decoration: none;
	gap: 30px;
	height: 25px;
}

header li {
	list-style: none;
}




section {
	height: auto;
	background-color: rgb(255, 250, 243);
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 50px;
}

.title {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 20px;
}

.table1 {
	width: 500px;
	background-color: white;
}

.table1 td {
	padding: 5px;
	text-align: center;
}
</style>
</head>
<body>

	<div>


		<header>

			<p class="head">할인점 주문프로그램 ver 1.0</p>
			<ul>
				<li><a href="orderForm.jsp">주문등록</a></li>
				<li><a href="list.jsp">주문목록조회</a></li>
				<li><a href="shoplist.jsp">점포별주문현황</a></li>
				<li><a href="codelist.jsp">제품코드조회</a></li>
				<li><a href="main.jsp">홈으로</a></li>

			</ul>

		</header>



		<%
		String url = "jdbc:oracle:thin:@//localhost:1521/testdb";
		String user = "green";
		String upw = "1234";

		request.setCharacterEncoding("UTF-8");

		Class.forName("oracle.jdbc.driver.OracleDriver");

		Connection con = DriverManager.getConnection(url, user, upw);

		String sql = "SELECT pcode, " + "pname, " + "to_char(cost, '999,999') as cost, "
				+ "to_char(SUM(cost) * 0.9, '999,999,999') AS sale1, " + "to_char(SUM(cost) * 0.85, '999,999,999') AS sale2 "
				+ "FROM tbl_product_202101 " + "GROUP BY pcode, pname, cost";

		Statement stmt = con.createStatement();

		PreparedStatement psmt = con.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		%>

		<section>

			<div class="title">
				<p>제품코드조회</p>
			</div>

			<table class="table1" border="1">

				<tr>
					<th>제품코드</th>
					<th>제품명</th>
					<th>단가</th>
					<th>할인률(10%)</th>
					<th>할인률(15%)</th>
				</tr>



				<%
				while (rs.next()) {
				%>

				<tr>
					<td><%=rs.getString("pcode")%></td>
					<td><%=rs.getString("pname")%></td>
					<td><%=rs.getString("cost")%></td>
					<td><%=rs.getString("sale1")%></td>
					<td><%=rs.getString("sale2")%></td>
				</tr>

				<%
				}
				rs.close();
				psmt.close();
				con.close();
				%>




			</table>




		</section>


	</div>



</body>
</html>