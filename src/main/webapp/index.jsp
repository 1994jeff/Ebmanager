<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
	</head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
    	@media only screen and (min-width: 768px) {
    		.login-width{
    			border-radius: 4px 4px;
    			box-shadow: 1px 1px 1px  1px #337ab7;
    			width: 50%;
    			margin: 0 auto;
    			padding: 20px 40px;
    			background-color: #337ab7;
    			margin-top: 20%;
    			margin-bottom: 80px;
    		}
    	}
    	
    	@media only screen and (max-width: 768px) {
    		.login-width{
    			border-radius: 4px 4px;
    			box-shadow: 1px 1px 1px  1px #337ab7;
    			width: 260px;
    			margin: 0 auto;
    			padding: 20px 40px;
    			background-color: #337ab7;
    			margin-top: 30%;
    			margin-bottom: 30px;
    		}
    	}
    </style>
	<body>
		<div class="login-width">
			<div class="row">
				<form>
				  <div class="form-group">
				    <label for="exampleInputEmail1" style="color: white;">账号</label>
				    <input type="" class="form-control" id="name" name="name" placeholder="please input user name">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1" style="color: white;">密码</label>
				    <input type="password" class="form-control" id="psd" name="psd" placeholder="please input password">
				  </div>
				  <button type="button" class="btn btn-default">登录</button>
				</form>
			</div>
		</div>
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	</body>
	<script type="text/javascript">
	$(function(){
		$('.btn-default').on('click',function(){
			toCheckPsd();
		});
	});
	
	function toCheckPsd(){
		var name = $('#name').val();
		var psd = $('#psd').val();
		if(''==name){
			alert('please input user name！');
			return;
		}
		if(''==psd){
			alert('please input password！');
			return;
		}
		$.ajax({
			type:'post',
			data:{
				'name':name,
				'psd':psd
			},
			dataType:'json',
			url:'${pageContext.request.contextPath}/login/toCheckLogin.do',
			success:function(data){
				var obj = $.parseJSON(data)
				var code = obj.retCode;
				var msg = obj.retMsg;
				if(msg=='success'){
					window.location.href="${pageContext.request.contextPath}/login/toIndex.do";
				}else if(msg=='failed'){
					alert('用户名或密码错误！');
				}else{
					alert('Error, please try again！');
				}
			},
			error:function(){
				alert('Error, please try again！');
			}
		});
	}
	
    </script>
</html>