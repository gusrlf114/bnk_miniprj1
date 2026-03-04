<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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

		String sql = "SELECT o.shopno, " + "       p.pcode, " + "       p.pname, " + "       SUM(o.amount) AS allamount "
				+ "FROM tbl_order_202101 o " + "JOIN tbl_product_202101 p " + "  ON p.pcode = o.pcode "
				+ "GROUP BY o.shopno, p.pcode, p.pname " + "order by o.shopno asc";

		Statement stmt = con.createStatement();

		PreparedStatement psmt = con.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		%>
		<section>

			<div class="title">
				<p>점포별 주문현황
				<p>
			</div>

			<table class="table1" border="1">

				<tr>
					<th>할인점 코드</th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>총주문수량</th>
				</tr>



				<%
				while (rs.next()) {
				%>

				<tr>
					<td><%=rs.getString("shopno")%></td>
					<td><%=rs.getString("pcode")%></td>
					<td><%=rs.getString("pname")%></td>
					<td><%=rs.getString("allamount")%></td>

				</tr>
				<%
				}
				%>
			</table>

		</section>


	</div>



</body>
</html>