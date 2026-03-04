<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>주문 등록</title>
<style>
/* 화면 중앙 배치를 위한 CSS */
body {
	text-align: center; /* 제목(h2)을 중앙으로 */
}

table {
	margin: 0 auto; /* 테이블 자체를 화면 정중앙으로 이동 */
	border-collapse: collapse; /* 테두리 한 줄로 깔끔하게 */
	text-align: left; /* 테이블 안의 글자는 왼쪽 정렬 */
}

th, td {
	border: 1px solid black; /* 표 테두리 */
	padding: 8px 15px; /* 칸 안쪽 여백 */
}

th {
	background-color: #f2f2f2; /* 제목 칸에 연한 회색 배경 */
}

.btn-group {
	text-align: center; /* 버튼들은 가운데 정렬 */
	padding: 15px;
}

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

section p {
	font-weight: bolder;
	padding-top: 10px;
	font-size: 15px;
}

footer {
	background-color: rgb(47, 0, 255);
	color: white;
	height: px;
	text-align: center;
}
</style>
<script>
	// 유효성 검사 자바스크립트 함수
	function checkValid() {
		var f = document.frm;

		if (f.orderno.value == "") {
			alert("주문번호가 입력되지 않았습니다!");
			f.orderno.focus();
			return false;
		}
		if (f.shopno.value == "") {
			alert("주문점포가 선택되지 않았습니다!");
			f.shopno.focus();
			return false;
		}
		if (f.orderdate.value == "") {
			alert("주문일자가 입력되지 않았습니다!");
			f.orderdate.focus();
			return false;
		}
		if (f.pcode.value == "") {
			alert("제품코드가 선택되지 않았습니다!");
			f.pcode.focus();
			return false;
		}
		if (f.amount.value == "") {
			alert("주문수량이 입력되지 않았습니다!");
			f.amount.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
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




	<h2>주문 내역 등록</h2>

	<form name="frm" action="order" method="post"
		onsubmit="return checkValid()">
		<table>
			<tr>
				<th>주문번호</th>
				<td><input type="text" name="orderno" maxlength="8"></td>
			</tr>
			<tr>
				<th>매장번호</th>
				<td><select name="shopno">
						<option value="">선택하세요</option>
						<option value="S001">S001</option>
						<option value="S002">S002</option>
						<option value="S003">S003</option>
						<option value="S004">S004</option>
				</select></td>
			</tr>
			<tr>
				<th>주문일자</th>
				<td><input type="text" name="orderdate" maxlength="8"></td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><select name="pcode">
						<option value="">선택하세요</option>
						<option value="AA01">AA01</option>
						<option value="AA02">AA02</option>
						<option value="AA03">AA03</option>
						<option value="AA04">AA04</option>
						<option value="AA05">AA05</option>
						<option value="AA06">AA06</option>
				</select></td>
			</tr>
			<tr>
				<th>주문수량</th>
				<td><input type="number" name="amount"></td>
			</tr>
			<tr>
				<td colspan="2" class="btn-group">
					<button type="submit">주문등록</button>
					<button type="reset">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>