<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品信息</title>
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
				<label for="name" style="color: white">商品名</label> <input
					type="text" class="form-control" value="${business.type}"
					disabled="disabled" name="name" id="name"
					style="background-color: white;"> <br /> <label
					for="mobile" style="color: white">商家电话</label> <input type="text"
					disabled="disabled" class="form-control" maxlength="11"
					value="${business.phone}" name="mobile" id="mobile"
					style="background: white;"> <br /> <label for="psd"
					style="color: white">商品单价</label> <input disabled="disabled"
					type="text" class="form-control" value="${price}" name="psd"
					id="psd" style="background: white;"> <label for="nums"
					style="color: white">请输入购买数量</label> <input type="text"
					class="form-control" value="1" name="nums" id="nums"
					style="background: white;"> <label for="money"
					style="color: white">总价</label> <input disabled="disabled"
					type="text" class="form-control" value="${price}" name="money"
					id="money" style="background: white;"> <br /> <br />
				<button type="button" onclick="checkParam()"
					class="btn btn-default formSub">购买</button>
			</form>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#nums').on('change', function() {
				var n = Number($('#nums').val());
				if (isNaN(n)) {
					alert('数量错误，请重新输入商品数量！！！');
					$('#nums').val();
					return;
				}
				$('#money').val(n * '${price}');
			});
		})

		function checkParam() {
			var n = Number($('#nums').val());
			if (isNaN(n)) {
				alert('数量错误，请重新输入商品数量！！！');
				$('#nums').val();
				return;
			}
			var price = (n * '${price}');
			alert('您将支付' + price + '元人名币');
			var no = '${business.no}';
			$
					.ajax({
						type : 'post',
						dataType : 'json',
						data : {
							'no' : no,
							'price' : price,
							'nums' : n
						},
						url : '${pageContext.request.contextPath}/bc/buyProduct.do',
						success : function(data) {
							var obj = $.parseJSON(data);
							var retCode = obj.retCode;
							var retMsg = obj.retMsg;
							if (retCode == 'success') {
								alert(retMsg);
							} else {
								alert(retMsg);
							}
						}
					});
		}
	</script>
</body>
</html>