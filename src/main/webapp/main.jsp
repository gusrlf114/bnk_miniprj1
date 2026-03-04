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
	height: 300px;
	background-color: rgb(255, 250, 243);
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

		<section>
			<p>과정평가형 자격 CBQ</p>
			<br>
			<p>국가직무능력표준(NCS: National Competency Stamdards)으로 설계된 교육훈련과정을
				체계적으로 이수하고 내외부 평가를 거쳐 취득하는 국가기술자격입니다.</p>
			<br>
			<p>산업현장 중심의 교육평가로 더 커지는 능력:</p>
			<p>알고 있는 것에 할 수 있는 것을 더하는</p>
			<p>과정평가형 자격은</p>
			<p>현장 중심형 인재육성을 지원합니다.</p>
		</section>


		<footer>
			<p>HRDKOREA Copyright&copy2016 All rights reserved. Human
				Resources Development Service of Korea.</p>
		</footer>

	</div>



</body>
</html>