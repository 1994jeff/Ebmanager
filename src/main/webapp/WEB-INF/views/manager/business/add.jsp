<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加商家信息</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
</head>
<style type="text/css">
@media only screen and (min-width: 768px) {
	.login-width {
		border-radius: 4px 4px;
		box-shadow: 1px 1px 1px 1px #337ab7;
		width: 50%;
		margin: 0 auto;
		padding: 20px 40px;
		background-color: #337ab7;
		margin-top: 8%;
		margin-bottom: 80px;
	}
}

@media only screen and (max-width: 768px) {
	.login-width {
		border-radius: 4px 4px;
		box-shadow: 1px 1px 1px 1px #337ab7;
		width: 280px;
		margin: 0 auto;
		padding: 20px 40px;
		background-color: #337ab7;
		margin-top: 8%;
		margin-bottom: 30px;
	}
}
</style>
<body>

	<%@include file="/WEB-INF/common/menu.jsp"%>
	<div class="login-width">
		<div>
			<form id="form1" method="post">
				<label for="name" style="color: white">商家名</label> <input
					type="text" class="form-control" name="name" id="name"
					style="background-color: white;"> <br /> <label
					for="mobile" style="color: white">联系电话</label> <input type="text"
					class="form-control" maxlength="11" name="mobile" id="mobile"
					style="background: white;"> <br /> <label for="psd"
					style="color: white">商品类型</label> <input type="text"
					class="form-control" name="psd" id="psd" style="background: white;">
				<br /> <label for="auth" style="color: white">商家级别
					(一般,小商户,旗舰店)</label> <select id="auth"
					style="border-radius: 5px; width: 100%; height: 36px; background-color: white; padding-left: 10px; font-size: 14px;">
					<option selected="selected">----请选择商家级别----</option>
					<option value="0">一般商户</option>
					<option value="1">小商户</option>
					<option value="2">旗舰店</option>
				</select> <br /> <br /> <label for="userNo" style="color: white">请选择尚未绑定身份的用户</label>
				<select id="userNo"
					style="border-radius: 5px; width: 100%; height: 36px; background-color: white; padding-left: 10px; font-size: 14px;">
					<option selected="selected">----请选择用户----</option>
					<c:forEach items="${uList}" var="user">
						<option value="${user.userNo}">${user.name}</option>
					</c:forEach>
				</select> <br /> <br /> <br />
				<button type="button" onclick="checkParam()"
					class="btn btn-default formSub">添加</button>
			</form>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script type="text/javascript">
		function checkParam() {
			var name = $('#name').val();
			var mobile = $('#mobile').val();
			var auth = $('#auth').val();
			var type = $('#psd').val();
			var no = $('#userNo').val();
			if ("" == name) {
				alert("商家名不能为空!");
				return;
			}
			if ("" == mobile) {
				alert("商家联系电话不能为空!");
				return;
			}
			if ("" == type) {
				alert("商家类型不能为空!");
				return;
			}
			if ("----请选择商家级别----" == auth) {
				alert("商家级别不能为空!");
				return;
			}
			if ("----请选择用户----" == no) {
				alert("绑定用户不能为空!");
				return;
			}
			$
					.ajax({
						type : 'post',
						dataType : 'json',
						data : {
							'no' : no,
							'name' : name,
							'type' : type,
							'phone' : mobile,
							'level' : auth
						},
						url : '${pageContext.request.contextPath}/business/addBusiness.do',
						success : function(data) {
							var obj = $.parseJSON(data);
							var retCode = obj.retCode;
							var retMsg = obj.retMsg;
							console.log(data);
							if (retCode == 'success') {
								alert(retMsg);
								window.location.href = "${pageContext.request.contextPath}/login/toIndex.do";
							} else {
								alert(retMsg);
							}
						}
					});
		}
	</script>
</body>
</html>