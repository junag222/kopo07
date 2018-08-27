<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
<html>
<script type="text/javascript">

$(document).ready(function () {

    var formObj = $("form[role='form']");
    console.log(formObj);
    
    $(".delBtn").on("click", function () {
    	alert('삭제 되었습니다');

       formObj.attr("action", "Member_delete");
       formObj.attr("method", "post");
       formObj.submit();
    });
   
    $(".listBtn").on("click", function () {
       self.location = "/Member_list"
    });

});
</script>
<head>
<title>Member</title>
</head>
<body>
	<h2>검색 리스트</h2>

	<table class="type03">
		<tr>
				<th>회원 이름</th>
			
		</tr>

		<tbody>
			<tr>

			</tr>
			<tr>
				<c:forEach items="${memberes}" var="memberes">
					<td><a href="Member_view?id=${memberes.id}">${memberes.name}</a></td>
			
			</tr>

			<div class="pull-rifht">
				<form role="form" method="post">
					<input type="hidden" name="id" value="${memberes.id}"> 
					<input type="hidden" name="pid" value="${phone.id}">
				</form>
				</c:forEach>
		</tbody>
	</table>

	<button type="submit" class="btn btn-primary listBtn">
		<i class="fa fa-list"></i> 목록
	</button>
	<button type="submit" class="btn btn-warning modBtn">
		<i class="fa fa-edit"></i> 수정
	</button>
	<button type="submit" class="btn btn-danger delBtn">
		<i class="fa fa-trash"></i> 전체삭제
	</button>
	</div>




</body>
</html>
