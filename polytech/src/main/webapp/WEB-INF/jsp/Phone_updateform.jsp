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
	<h1>폰번호 수정</h1>
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
	$('#myModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
		  var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
		  var titleTxt = button.data('title') // 버튼에서 data-title 값을 titleTxt 변수에 저장
		  var modal = $(this)
		  modal.find('.modal-title').text('Title : ' + titleTxt) // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
		})
		$(document).ready(function() {

			var formObj = $("form[role='form']");
			console.log(formObj);

			$(".modBtn").on("click", function() {
				alert('수정 되었습니다');

				formObj.attr("action", "Phone_updating");
				formObj.submit();
			});


			$(".listBtn").on("click", function() {
				self.location = "Member_list"
			});

		});
	</SCRIPT>
<!-- Modal windows button open -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" data-title="Test Title">
  Open Modal
</button>
 
<!-- Modal window -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        Modal body
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
 
	<table class="type03">
		<tr>
			<th>번호</th>
		</tr>
		<form role="form" method="post">

			<tbody>
				<tr>
					<td><input type=text name=number size=20 maxlength=20
						value=${phone.number }></td>
							
						<input type="hidden" name=phoneid value="${phone.id}">
					
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
		
	</div>
</body>
</html>