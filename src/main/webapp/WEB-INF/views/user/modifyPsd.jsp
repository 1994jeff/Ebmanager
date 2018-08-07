<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
</head>
<style>
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
	<div class="container">
		<div class="login-width">
			<form>
				<label for="oldPsd" style="color: white">请输入旧密码</label> <input
					type="password" class="form-control" name="oldPsd" id="oldPsd"
					placeholder="Please input your old password"
					style="background-color: white;"> <br /> <label
					for="newPsd" style="color: white">请输入新密码</label> <input
					type="password" class="form-control" name="newPsd" id="newPsd"
					placeholder="Please input new password" style="background: white;">
				<br /> <label for="newPsd2" style="color: white">请再次输入新密码</label> <input
					type="password" class="form-control" name="newPsd2" id="newPsd2"
					placeholder="Please confirm your new password"
					style="background: white;"> <br />
				<button type="button" class="btn btn-default formSub">确认修改</button>
			</form>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {

			$('.formSub').on('click', function() {
				checkParam();
			});

		});

		function checkParam() {
			var oldPsd = $('#oldPsd').val();
			var newPsd = $('#newPsd').val();
			var newPsd2 = $('#newPsd2').val();
			if ("" == oldPsd) {
				alert("旧密码不能为空!");
				return;
			}
			if ("" == newPsd) {
				alert("新密码不能为空!");
				return;
			}
			if ("" == newPsd2) {
				alert("新密码不能为空!");
				return;
			}
			if (newPsd != newPsd2) {
				alert("两次新密码不匹配!");
				return;
			}
			checkPsd(oldPsd,newPsd);
		}

		//要求，不少于8位，必须含有两个数字，不能与原来的密码相似，不能都为大写或小写
		function checkPsd(oldPsd,psd) {
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
			postAjax(oldPsd,psd);
		}

		function postAjax(oldPsd, newPsd) {
			$
					.ajax({
						type : 'post',
						data : {
							'psd' : oldPsd,
							'newPsd' : newPsd
						},
						dataType : 'json',
						url : '${pageContext.request.contextPath}/user/modifyPsd.do',
						success : function(data) {
							var obj = $.parseJSON(data);
							var retCode = obj.retCode;
							var retMsg = obj.retMsg;
							if (retCode == 'failed') {
								alert(retMsg);
							} else if (retCode == 'success') {
								alert("密码修改成功，重新登录验证吧！");
								window.location.href = "${pageContext.request.contextPath}/login/toLogin.do";
							}
						},
						error : function() {
							alert('未知错误，请重试！');
						}
					});
		}
	</script>
</body>
</html>