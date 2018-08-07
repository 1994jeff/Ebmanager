<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商家列表</title>
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
						<span>商家列表</span>
					</div>
					<div class="panel-body">
						<div class="table-responsive" style="text-align: center;">
							<table
								class="table table-striped table-bordered table-hover table-condensed">
								<tbody class="appendHtml">
									<tr>
										<td>#</td>
										<td>商家名</td>
										<td>商家级别</td>
										<td>联系电话</td>
										<td>商家类型</td>
										<td>创建时间</td>
										<td>Operation</td>
									</tr>
									<c:forEach items="${uList}" begin="0" end="${uList.size()}"
										var="business" varStatus="v">
										<tr>
											<td>${v.index+1}</td>
											<td>${business.name}</td>
											<td><c:if test="${business.level==0}">一般商户</c:if> <c:if
													test="${business.level==1}">小商户</c:if> <c:if
													test="${business.level==2}">旗舰店</c:if></td>
											<td>${business.phone}</td>
											<td>${business.type}</td>
											<td><fmt:formatDate value="${business.createTime}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td><a
												href="${pageContext.request.contextPath}/bc/toBuyProduct.do?bNo=${business.no}"><span
													class="btn-style btn">购买商家产品</span></a></td>
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
