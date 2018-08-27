<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>editForm</h1>
	<style>
table.type03 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 3px solid #369;
	margin: 20px 10px;
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
	<SCRIPT LANGUAGE="JavaScript">
		$(document).ready(function() {

			var formObj = $("form[role='form']");
			console.log(formObj);

			$(".modBtn").on("click", function() {
				alert('수정 되었습니다');

				formObj.attr("action", "Member_updating");
				formObj.submit();
			});

			$(".delBtn").on("click", function() {
				alert('삭제 되었습니다');

				formObj.attr("action", "Member_delete");
				formObj.attr("method", "post");
				formObj.submit();
			});

			$(".listBtn").on("click", function() {
				self.location = "Member_list"
			});

		});
	</SCRIPT>

	<table class="type03">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		<form role="form" method="post">

			<tbody>
				<tr>
					<td><input type=text name=name size=20 maxlength=20
						value=${member.name }></td>
					<td><input type=text name=age size=10 maxlength=10
						value=${member.age }></td>
					<%-- <c:forEach items="${member.phones}" var="phone">
						<td><input type=text name=number size=20 maxlength=20
							value=${phone.number } required>
							<button type="submit" class="btn btn-warning modBtn">
								<i class="fa fa-edit"></i> 수정
							</button></td> --%> 
				</tr>

			</tbody>
	</table>

	<input type="hidden" name=phoneid value="${phone.id}">
	<%-- </c:forEach> --%>
	<input type="hidden" name=id value="${member.id}">
	</form>


	<div class="pull-rifht">
		<button type="submit" class="btn btn-primary listBtn">
			<i class="fa fa-list"></i> 목록
		</button>
		<button type="submit" class="btn btn-warning modBtn">
			<i class="fa fa-edit"></i> 수정
		</button>
		<button type="submit" class="btn btn-danger delBtn">
			<i class="fa fa-trash"></i> 삭제
		</button>
	</div>
</body>
</html>