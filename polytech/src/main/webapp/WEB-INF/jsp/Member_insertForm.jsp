<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<script type="text/javascript">
//글쓰기 20바이트 못넘게 자바스크립트에서 잡아줘야함
function fn_addtoBoard(){
    
    var form = document.getElementById("writeForm");
	alert('입력 되었습니다');

    form.action = "<c:url value='Member_save'/>";
    form.submit();
    
}
 
//목록
function fn_cancel(){
        
    self.location = "Member_list"
    
}

</script>
</head>

<body>
	<table class="type03">
		<form id="writeForm" name="writeForm" method="post">
			<h2>글쓰기</h2>
		<tr>
			<th>이름</th>
			<td><input style="width: 500px" type="text" id="name"
				name="name" /></td>
		</tr>
		<tr>
			<th>번호</th>
			<td><input style="width: 500px" type="text" id="number"
				name="number" /></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input style="width: 500px" type="text" id="age"
				name="age" /></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>자동 생성<input type="hidden" name="date" value="${memberes.date}"></td>


	</table>
	<div>
		<a href='#' onClick='fn_addtoBoard()'>이름 등록</a> <a href='#'
			onClick='fn_cancel()'>목록</a>
	</div>
	</form>

</body>
</html>
