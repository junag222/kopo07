<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
	$(document).ready(function() {

		var mode;
		var formObj = $("form[role='form']");

		$(".addReplyBtn").on("click", function() {
			$("#myModal").modal("show");
			$(".modal-title").text("Add Phone");

			mode = "ADD";
		});

		$(".modBtn").on("click", function() {
			formObj.attr("action", "Member_editForm");
			formObj.submit();
		});

		$(".delBtn").on("click", function() {
			alert('삭제 되었습니다');

			formObj.attr("action", "Member_delete");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$(".phonedelBtn").on("click", function() {
			alert('폰 삭제 되었습니다');

			formObj.attr("action", "Phone_delete");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$(".listBtn").on("click", function() {
			formObj.attr("action", "Member_list");
		});
		$(".phonemodBtn").on("click", function() {

			formObj.attr("action", "Phone_updateform");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$(".phonenumberaddBtn").on("click", function() {
			alert('폰 추가 되었습니다');

			formObj.attr("action", "Phone_add");
			formObj.attr("method", "post");
			formObj.submit();
		});

	});
</script>
<head>
<title>Member</title>
</head>
<body>
	<h2>회원정보 상세</h2>


	<form role="form" method="post">

		<table class="type03">
			<tr>
				<th>이름</th>
				<td>${member.name}</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>${member.age}</td>
			</tr>
			<tr>
				<th>폰 번호</th>
				<td><input type="text" name="addphone" id="addphone">
					<button type="submit" class="btn btn-primary phonenumberaddBtn">
						<i class="fa fa-trash"></i> 폰추가
					</button> <input type="hidden" name="id" value="${member.id}"></td>
				</td>
			</tr>

			<tr>
				</form>
				<c:forEach items="${member.phones}" var="phone">
					<%-- <form method="post" action="Phone_delete.html?zid=${phone.id}"> --%>
					<form role="form" method="post">

						<th>폰 번호</th>
						<td>${phone.number }<!-- <input type=submit value="삭제"> -->
							<button type="submit" class="btn btn-primary phonedelBtn">
								<i class="fa fa-trash"></i> 폰삭제
							</button>
							<button type="submit" class="btn btn-primary phonemodBtn">
								<i class="fa fa-trash"></i> 폰수정
							</button> <input type="hidden" name="pid" value="${phone.id}"></td> <input
							type="hidden" name="id" value="${member.id}">
			</tr>
			</form>
			</c:forEach>
			<tr>
				<th>회원 가입 날짜</th>
				<td><fmt:formatDate value="${member.regdate}"
						pattern="yyyy-MM-dd a HH:mm:ss" /></td>

			</tr>
		</table>



		<button type="submit" class="btn btn-primary listBtn">
			<i class="fa fa-list"></i> 목록
		</button>
		<button type="submit" class="btn btn-warning modBtn">
			<i class="fa fa-edit"></i> 회원 정보 수정
		</button>
		<button type="submit" class="btn btn-danger delBtn">
			<i class="fa fa-trash"></i> 회원 삭제
		</button>
		<button type="submit" class='btn btn-primary addReplyBtn'>Add
			Phone</button>
		</div>
		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">폰 번호 추가</h4>
					</div>
					<div class="modal-body">
						<label>Phone Number</label> <input type="text"
							class="form-control" name='phonenumber'>

					</div>
					<div class="modal-footer">
						<button id='modalBtn' class="btn btn-info">Save</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
