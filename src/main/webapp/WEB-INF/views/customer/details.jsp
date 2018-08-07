<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文章详细信息</title>
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
				<label for="name" style="color: white">文章编号</label> <input
					disabled="disabled" type="text" class="form-control"
					value="${customer.no}" name="name" id="name"
					style="background-color: white;"> <br /> <label for="name"
					style="color: white">文章名</label> <input disabled="disabled"
					type="text" class="form-control" value="${customer.name}"
					name="name" id="name" style="background-color: white;"> <br />
				<label for="psd" style="color: white">发货地址</label> <input
					disabled="disabled" type="text" class="form-control"
					value="${customer.address}" name="psd" id="psd"
					style="background: white;"> <br /> <label for="mobile"
					style="color: white">联系电话</label> <input disabled="disabled"
					type="text" class="form-control" maxlength="11"
					value="${customer.mobile}" name="mobile" id="mobile"
					style="background: white;"> <br /> <label for="auth"
					style="color: white">用户类别 (普通文章,大文章,钻石文章)</label>
				<c:if test="${customer.level==0}">
					<select disabled="disabled" id="auth"
						style="border-radius: 5px; width: 100%; height: 36px; background-color: white; padding-left: 10px; font-size: 14px;">
						<option></option>
						<option selected="selected" value="0">普通文章</option>
						<option value="1">大文章</option>
						<option value="2">钻石文章</option>
					</select>
				</c:if>
				<c:if test="${customer.level==1}">
					<select disabled="disabled" id="auth"
						style="border-radius: 5px; width: 100%; height: 36px; background-color: white; padding-left: 10px; font-size: 14px;">
						<option></option>
						<option value="0">普通文章</option>
						<option selected="selected" value="1">大文章</option>
						<option value="2">钻石文章</option>
					</select>
				</c:if>
				<c:if test="${customer.level==2}">
					<select disabled="disabled" id="auth"
						style="border-radius: 5px; width: 100%; height: 36px; background-color: white; padding-left: 10px; font-size: 14px;">
						<option></option>
						<option value="0">普通文章</option>
						<option value="1">大文章</option>
						<option selected="selected" value="2">钻石文章</option>
					</select>
				</c:if>
				<br /> <br />
				<label for="" style="color: white">创建时间</label> <input
					disabled="disabled" type="text" class="form-control"
					value="<fmt:formatDate value="${customer.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />"
					style="background: white;"> <br /> <br /> <br /> <br />
			</form>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>