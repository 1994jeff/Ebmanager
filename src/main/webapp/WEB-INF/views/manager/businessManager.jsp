<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！-->
<meta charset="utf-8">
<title>商家管理</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
</head>
<style type="text/css">
.bgColor:HOVER {
	background-color: #337ab7 !important;
	color: white !important;
}
</style>
<body>
	<%@include file="/WEB-INF/common/menu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-default ">
					<div class="panel-heading">
						<span>商家管理</span>
					</div>
					<div class="panel-body">
						<div class="list-group">
						  <a href="${pageContext.request.contextPath}/business/toAddBusiness.do" class="list-group-item bgColor">
						    <h5 style="font-weight: bold;">添加商家信息</h5>
						    <p></p>
						  </a>
						  <a href="${pageContext.request.contextPath}/business/toBusinessList.do" class="list-group-item bgColor">
						    <h5 style="font-weight: bold;">修改商家信息</h5>
						  	<p></p>
						  </a>
						  <a href="${pageContext.request.contextPath}/business/toDeleteBusiness.do" class="list-group-item bgColor">
						  	<h5 style="font-weight: bold;">删除商家信息</h5>
						  	<p></p>
						  </a>
						  <a href="${pageContext.request.contextPath}/business/toQueryBusiness.do" class="list-group-item bgColor">
						  	<h5 style="font-weight: bold;">查询商家信息</h5>
						  	<p></p>
						  </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>