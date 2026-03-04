<%@page import="java.util.ArrayList"%>
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
</head>

<body>
<%
String url= "jdbc:oracle:thin:@//localhost:1521/testdb";
String uid= "green";
String upw = "1234";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(url,uid,upw);
PreparedStatement pstmt = con.prepareStatement("select o.shopno,s.shopname,SUBSTR(o.orderno,1,4) || '-' || SUBSTR(o.orderno,5,4) as orderno,SUBSTR(o.orderdate,1,4)||'-'||substr(o.orderdate,5,2)||'-'||substr(o.orderdate,7,2) as orderdate,o.pcode,p.pname,o.amount,to_char(p.cost,'FM99,999,999') AS cost,to_char(p.cost*o.amount,'FM99,999,999') as a ,to_char(p.cost*o.amount-(p.cost*o.amount*s.discount*0.01),'FM99,999,999') as b from TBL_ORDER_202101 o join TBL_PRODUCT_202101 p on o.pcode=p.pcode join TBL_SHOP_202101 s on o.shopno=s.shopno order by o.orderno");
ResultSet rs =pstmt.executeQuery();
ArrayList<String> shopno = new ArrayList<>();
ArrayList<String> shopname = new ArrayList<>();
ArrayList<String> orderno = new ArrayList<>();
ArrayList<String> orderdate = new ArrayList<>();
ArrayList<String> pcode = new ArrayList<>();
ArrayList<String> pname = new ArrayList<>();
ArrayList<Integer> amount = new ArrayList<>();
ArrayList<String> cost = new ArrayList<>();
ArrayList<String> concost = new ArrayList<>();
ArrayList<String> discost = new ArrayList<>();


while(rs.next()){
	shopno.add(rs.getString("shopno"));
	shopname.add(rs.getString("shopname"));
	orderno.add(rs.getString("orderno"));
	orderdate.add(rs.getString("orderdate"));
	pcode.add(rs.getString("pcode"));
	pname.add(rs.getString("pname"));
	amount.add(rs.getInt("amount"));
	cost.add(rs.getString("cost"));
	concost.add(rs.getString("a"));
	discost.add(rs.getString("b"));
}

pstmt.close();
con.close();


%>

<section>
	<h1>주문목록</h1>
	<table border="1" style="border-collapse:collapse">
		<tr>
       			<th>할인점코드</th>
       			<th>점포명</th>
       			<th>주문번호</th>
       			<th>주문일자</th>
       			<th>제품코드</th>
       			<th>제품명</th>
       			<th>주문수량</th>
       			<th>단가</th>
       			<th>소비자가격</th>
       			<th>할인가격</th>
       	</tr>
		<%for(int i=0;i<pcode.size();i++){
       	%><tr>
       			<th><%=shopno.get(i) %></th>
       			<th><%=shopname.get(i) %></th>
       			<th><%=orderno.get(i) %></th>
       			<th><%=orderdate.get(i)%></th>
       			<th><%=pcode.get(i)%></th>
       			<th><%=pname.get(i)%></th>
       			<th><%=amount.get(i)%></th>
       			<th><%=cost.get(i)%></th>
       			<th><%=concost.get(i)%></th>
       			<th><%=discost.get(i)%></th>
     	</tr>
     	<%} %>

	</table>

</section>


</body>
</html>