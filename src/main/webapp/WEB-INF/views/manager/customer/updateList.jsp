<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>文章列表</title>
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

.line-limit-length {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
<body>
	<%@include file="/WEB-INF/common/menu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-default ">
					<div class="panel-heading">
						<span>文章列表</span>
					</div>
					<div class="panel-body">
						<div class="table-responsive" style="text-align: center;">
							<table
								class="table table-striped table-bordered table-hover table-condensed">
								<tbody class="appendHtml">
									<tr>
										<td>#</td>
										<td>文章编号</td>
										<td>文章名</td>
										<td>文章作者</td>
										<td>文章内容</td>
										<td>文章类别</td>
										<td>创建时间</td>
										<td>Operation</td>
									</tr>
									<c:forEach items="${uList}" begin="0" end="${uList.size()}"
										var="customer" varStatus="v">
										<tr>
											<td>${v.index+1}</td>
											<td>${customer.no}</td>
											<td><span id="artile">${customer.name}</span></td>
											<td><span id="author">${customer.address}</span></td>
											<td id=""><span id="content">${customer.mobile}</span></td>
											<td><c:if test="${customer.level==0}">校内文章</c:if> <c:if
													test="${customer.level==1}">校外文章</c:if> <c:if
													test="${customer.level==2}">钻石文章</c:if></td>
											<td><fmt:formatDate value="${customer.createTime}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td><a
												href="${pageContext.request.contextPath}/customer/toUpdateCustomer.do?userNo=${customer.no}"><span
													class="btn-style btn" data="">修改</span></a></td>
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
	<script type="text/javascript">
	$(function() {
		var str = $('#content').text();
		if(str.length>25){
			str = str.substr(0,25) + '...' ;
        }
        $("#content").text(str);
        
        var artile = $('#artile').text();
        if(artile.length>10){
        	artile = artile.substr(0,10) + '...' ;
        }
        $("#artile").text(artile);
        
        var author = $('#author').text();
        if(author.length>5){
        	author = author.substr(0,5) + '...' ;
        }
        $("#author").text(author);
	});
	</script>
</body>
</html>
