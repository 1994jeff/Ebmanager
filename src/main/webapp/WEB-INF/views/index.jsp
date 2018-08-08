<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ @author 邓纪富 98455-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理系统</title>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style type="text/css">
a {
	text-decoration: none !important;
}

.span-style {
	background-color: #337ab7;
	padding: 30px 30px;
	text-align: center;
	font-weight: bold;
	border-radius: 4px;
	color: white;
	margin-top: 10px;
	border: 1px #337ab7 solid;
	text-decoration: none;
}

.span-style:hover {
	background-color: white;
	color: #337ab7;
	text-decoration: none;
}
</style>
<body>

	<%@include file="/WEB-INF/common/menu.jsp"%>
	<div class="container-fluid" style="margin-top: 0px;">
		<div class="row">
			<div class="col-lg-10 col-md-10 col-sm-10">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default ">
							<div class="panel-heading">Service</div>
							<div class="panel-body">
								<div
									class="col-md-3 col-sm-3 col-sm-offset-0 col-xs-10 col-xs-offset-1">
									<a
										href="${pageContext.request.contextPath}/user/toModifyPsd.do">
										<div class="span-style disabled">
											<span>我的密码修改</span>
										</div>
									</a>
								</div>
								<c:if test="${user.auth==0}">
									<div
										class="col-md-3 col-sm-3 col-sm-offset-0 col-xs-10 col-xs-offset-1">
										<a
											href="${pageContext.request.contextPath}/business/toUpdateBusiness.do">
											<div class="span-style">
												<span>我的信息修改</span>
											</div>
										</a>
									</div>
									<div
										class="col-md-3 col-sm-3 col-sm-offset-0 col-xs-10 col-xs-offset-1">
										<a
											href="${pageContext.request.contextPath}/bc/toSaleList.do">
											<div class="span-style">
												<span>我的销售记录</span>
											</div>
										</a>
									</div>
								</c:if>
								<c:if test="${user.auth==1}">
									<%-- <div
										class="col-md-3 col-sm-3 col-sm-offset-0 col-xs-10 col-xs-offset-1">
										<a
											href="${pageContext.request.contextPath}/business/toBusinessManager.do">
											<div class="span-style">
												<span>商家信息管理</span>
											</div>
										</a>
									</div> --%>
									<div
										class="col-md-3 col-sm-3 col-sm-offset-0 col-xs-10 col-xs-offset-1">
										<a
											href="${pageContext.request.contextPath}/customer/toCustomerManager.do">
											<div class="span-style">
												<span>文章信息管理</span>
											</div>
										</a>
									</div>
									<div
										class="col-md-3 col-sm-3 col-sm-offset-0 col-xs-10 col-xs-offset-1">
										<a
											href="${pageContext.request.contextPath}/user/toUserManager.do">
											<div class="span-style">
												<span>用户信息管理</span>
											</div>
										</a>
									</div>
<!-- 									<div -->
<!-- 										class="col-md-3 col-sm-3 col-sm-offset-0 col-xs-10 col-xs-offset-1"> -->
<!-- 										<a -->
<%-- 											href="${pageContext.request.contextPath}/bc/toSaleList.do"> --%>
<!-- 											<div class="span-style"> -->
<!-- 												<span>历史交易信息</span> -->
<!-- 											</div> -->
<!-- 										</a> -->
<!-- 									</div> -->
								</c:if>
								<c:if test="${user.auth==2}">
									<div
										class="col-md-3 col-sm-3 col-sm-offset-0 col-xs-10 col-xs-offset-1">
										<a
											href="${pageContext.request.contextPath}/customer/toBusinessList.do">
											<div class="span-style">
												<span>在线商家列表</span>
											</div>
										</a>
									</div>
									<div
										class="col-md-3 col-sm-3 col-sm-offset-0 col-xs-10 col-xs-offset-1">
										<a
											href="${pageContext.request.contextPath}/bc/toBuyList.do">
											<div class="span-style">
												<span>我的购买记录</span>
											</div>
										</a>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-2">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default ">
							<div class="panel-heading">Other</div>
							<div class="panel-body">
								<div class="col-xs-10 col-xs-offset-1">Not yet open</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>