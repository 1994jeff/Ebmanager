<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户信息</title>
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
				<label for="name" style="color: white">用户名</label> <input
					type="text" class="form-control" value="${user.name}" disabled="disabled" name="name"
					id="name" style="background-color: white;"> <br /> <label
					for="psd" style="color: white">密码</label> <input type="text"
					class="form-control" value="${user.psd}" name="psd" id="psd"
					value="12345678" placeholder="Please enter the user password"
					style="background: white;"> <br /> 
<!-- 					<label for="auth" -->
<!-- 					style="color: white">用户类别 (商家, 文章)</label> -->
<%-- 				<c:if test="${user.auth==0}"> --%>
<!-- 					<select id="auth" -->
<!-- 						style="border-radius: 5px; width: 100%; height: 36px; background-color: white; padding-left: 10px; font-size: 14px;"> -->
<!-- 						<option></option> -->
<!-- 						<option selected="selected" value="0">商家</option> -->
<!-- 						<option value="2">文章</option> -->
<!-- 					</select> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${user.auth==2}"> --%>
<!-- 					<select id="auth" -->
<!-- 						style="border-radius: 5px; width: 100%; height: 36px; background-color: white; padding-left: 10px; font-size: 14px;"> -->
<!-- 						<option></option> -->
<!-- 						<option value="0">商家</option> -->
<!-- 						<option selected="selected" value="2">文章</option> -->
<!-- 					</select> -->
<%-- 				</c:if> --%>
				<br />
				<br />
				<br />
				<button type="button" onclick="checkParam()"
					class="btn btn-default formSub">修改</button>
			</form>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script type="text/javascript">
		var userNo = '${user.userNo}';
		function checkParam() {
			var name = $('#name').val();
			var psd = $('#psd').val();
// 			var auth = $('#auth').val();
			if ("" == name) {
				alert("Username can not be empty!");
				return;
			}
			if ("" == psd) {
				alert("Password can not be blank!");
				return;
			}

			checkPsd(psd,name);
			
		}
		
		//要求，不少于8位，必须含有两个数字，不能与原来的密码相似，不能都为大写或小写
		function checkPsd(psd,name) {
			if (psd.length < 8) {
				alert("新密码长度不能小于8位!");
				return;
			}
			var psds = psd.split("");
			var count = 0;//数字数量
			var minStr = 0;//小写字母数量
			var maxStr = 0;//大写字母数量
			for (var i = 0; i < psds.length; i++) {
				if(/[a-z]/.test(psds[i])){
					minStr++;
				}
				if(/[A-Z]/.test(psds[i])){
					maxStr++;
				}
				if(isNaN(Number(psds[i]))){
					
				}else{
					count++;
				}
			}
			if(count<2){
				alert("新密码必须包含2位数字!");
				return;
			}
			if(minStr==0){
				alert("新密码不能全为大写字母!");
				return;
			}
			if(maxStr==0){
				alert("新密码不能全为小写字母!");
				return;
			}
			
			$.ajax({
				type : 'post',
				dataType : 'json',
				data : {
					'userNo':userNo,
					'name' : name,
					'psd' : psd
				},
				url : '${pageContext.request.contextPath}/user/updateUser.do',
				success : function(data) {
					var obj = $.parseJSON(data);
					var retCode = obj.retCode;
					var retMsg = obj.retMsg;
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