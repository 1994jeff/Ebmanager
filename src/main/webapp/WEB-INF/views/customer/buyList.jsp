<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>购买记录</title>
</head>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
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

.btn-style {
	border-radius: 4px;
	padding: 0px 8px;
	border: 1px #CCC solid;
	background-color: #337ab7;
	color: white;
}

.btn-style:HOVER {
	color: white;
	background-color: #2ea2c3;
}

.fenye-style a {
	/* 	    	background-color: #31B0D5 !important; */
	/*     	    border-color: #31B0D5 !important; */
	
}
</style>
<body>
	<%@include file="/WEB-INF/common/menu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-default ">
					<div class="panel-heading">
						<span>购买记录</span>
					</div>
					<div class="panel-body">
						<div class="table-responsive" style="text-align: center;">
							<table
								class="table table-striped table-bordered table-hover table-condensed">
								<tbody class="appendHtml">
									<tr>
										<td>#</td>
										<td>商家名</td>
										<td>商品类别</td>
										<td>商家电话</td>
										<td>购买数量</td>
										<td>花费金额</td>
										<td>购买时间</td>
									</tr>
									<c:forEach items="${list}" begin="0" end="${list.size()}"
										var="bcDto" varStatus="v">
										<tr>
											<td>${v.index+1}</td>
											<td>${bcDto.bName}</td>
											<td>${bcDto.bType}</td>
											<td>${bcDto.phone}</td>
											<td>${bcDto.num}</td>
											<td>${bcDto.money}</td>
											<td><fmt:formatDate value="${bcDto.createTime}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 						<div class="panel-footer"> -->

					<!-- 						</div> -->
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/jeff.js"></script>
</body>
</html>
