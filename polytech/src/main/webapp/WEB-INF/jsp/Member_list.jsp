<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<html>

<style>
table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
<script type="text/javascript">


	$(document).ready(function() {

		var formObj = $("form[role='form']");
		console.log(formObj);

		$(".listBtn").on("click", function() {
			self.location = "Member_insertForm"
		});
		
		

	});
	
	document.getElementByName("keyfield").value
	document.getElementByName("keyword").text
	
</script>
<head>

<title>Insert title here</title>
</head>
<body>


	<form action="search" method="post">
		<select name="keyfield">
			<option value="searchname">이름검색</option>
			<option value="searchphone">번호검색</option>
		</select> <input type="text" name="keyword" /> <input type="submit" value="검색" />
		
	</form>
	


	<h2>회원 목록</h2>
	<table class="type03">
		<tr>
			<th>회원 이름</th>
			<th>회원 나이</th>
			<th>회원 등록일</th>
			
		</tr>
		
		<c:forEach items="${memberlist}" var="member">
			<tbody>
				<td><a href="Member_view?id=${member.id}">${member.name}</a></td>
				<td>${member.age}</td>
				<td><fmt:formatDate value="${member.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
			</tbody>

		</c:forEach>
	</table>
	<div class="pull-rifht">
		<button type="submit" class="btn btn-primary listBtn">
			<i class="fa fa-list"></i> 회원 생성
		</button>

	</div>
	
	
</body>
</html>