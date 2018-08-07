<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加文章信息</title>
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
				<label for="name" style="color: white">文章名</label> <input
					type="text" class="form-control""
					name="name" id="name"
					style="background-color: white;"> <br /> 
					<label for="psd" style="color: white">文章作者</label> 
					<input type="text" class="form-control" name="psd" id="psd" style="background: white;"> <br />
					<label for="auth" style="color: white">文章类别 (校内文章,校外文章,钻石文章)</label>
					<select id="auth"
						style="border-radius: 5px; width: 100%; height: 36px; background-color: white; padding-left: 10px; font-size: 14px;">
						<option selected="selected">----请选择文章类别----</option>
						<option value="0">校内文章</option>
						<option value="1">校外文章</option>
						<option value="2">钻石文章</option>
					</select>
					 <br /> <br />
					 <label for="mobile" style="color: white">文章内容</label> 
					<textarea style="height: 400px;width: 100%" name="mobile" id="mobile"></textarea>
					<br /> <br /> <br />
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
			var address = $('#psd').val();
			var mobile = $('#mobile').val();
			var auth = $('#auth').val();
			if ("" == name) {
				alert("文章名不能为空!");
				return;
			}
			if ("" == address) {
				alert("文章作者不能为空!");
				return;
			}
			if ("" == mobile) {
				alert("文章内容不能为空!");
				return;
			}
			if ("----请选择文章类别----" == auth) {
				alert("文章类别不能为空!");
				return;
			}
			$
					.ajax({
						type : 'post',
						dataType : 'json',
						data : {
							'name' : name,
							'address' : address,
							'mobile' : mobile,
							'level' : auth
						},
						url : '${pageContext.request.contextPath}/customer/addCustomer.do',
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