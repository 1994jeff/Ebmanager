<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>500</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
</head>
<body>
    <%@include file="/WEB-INF/common/menu.jsp"%>
	<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default ">
						<div class="panel-heading">
							<span>500</span>
						</div>
						<div class="panel-body">
							<span>${errorMsg}</span>
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