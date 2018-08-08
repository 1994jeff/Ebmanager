<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>文章查询</title>
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
						<span>文章查询</span>
					</div>
					<div class="panel-body">
						<div class="table-responsive" style="text-align: center;">
							<div style="width: 100%; text-align: left; margin-bottom: 20px;">
								<input id="seacher" type="text" placeholder="请输入要查询的文章名"/><span class="btn-style btn">搜索</span>
							</div>
							<table
								class="table table-striped table-bordered table-hover table-condensed">
								<tbody class="appendHtml">
									<tr class="addAfter">
										<td>#</td>
										<td>文章编号</td>
										<td>文章名</td>
										<td>文章作者</td>
										<td>文章类型</td>
										<td>文章内容</td>
<!-- 										<td>创建时间</td> -->
									</tr>
<%-- 									<c:forEach items="${list}" begin="0" end="${list.size()}" --%>
<%--  										var="bcDto" varStatus="v"> --%>
<%-- 										<tr onclick="toDetails('${bcDto.cNo}')"> --%>
<%-- 											<td>${v.index+1}</td> --%>
<%-- 											<td>${bcDto.cName}</td> --%>
<%-- 											<td>${bcDto.cMobile}</td> --%>
<%-- 											<td>${bcDto.bName}</td> --%>
<%-- 											<td>${bcDto.phone}</td> --%>
<%-- 											<td>${bcDto.cAddress}</td> --%>
<%-- 											<td>${bcDto.bType}</td> --%>
<%-- 											<td>${bcDto.num}</td> --%>
<%-- 											<td>${bcDto.money}</td> --%>
<%-- 											<td><fmt:formatDate value="${bcDto.createTime}" --%>
<%-- 													pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
<!-- 										</tr> -->
<%-- 									</c:forEach> --%>
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
		$(function(){
			$('.btn-style').on('click',(function(){
				var name = $('#seacher').val();
				if(name==''){
					alert('文章名不能为空！');
					return ;
				}
				$('.result').remove();
				postAjax(name);
			}));
		});
		
		function postAjax(name){
			$.ajax({
				type : 'post',
				dataType : 'json',
				data : {
					'name':name
				},
				url : '${pageContext.request.contextPath}/customer/queryCustomer.do',
				success : function(data) {
					var obj = $.parseJSON(data);
					var retCode = obj.retCode;
					var retData = obj.retData;
					var retMsg = obj.retMsg;
					if (retCode == 'success') {
						var result = appendHtml(retData[0]);
						console.log(result);
						$('.addAfter').after(result);
					} else {
						alert(retMsg);
					}
				}
			});
		}
		
		function appendHtml(customer){
			var html = "";
			html += "<tr class='result'>";
			html += "<td>1</td>";
			html += "<td>"+customer.no+"</td>";
			html += "<td>"+customer.name+"</td>";
			html += "<td>"+customer.address+"</td>";
			if(customer.level==0)
			{
				html += "<td>普通文章</td>";
			}else if(customer.auth==1){
				html += "<td>大文章</td>";
			}else if(customer.auth==2){
				html += "<td>钻石文章</td>";
			}
			html += "<td>"+customer.mobile+"</td>";
// 			html += "<td>"+getFormatDates(customer.createTime,5)+"</td>";
			return html;
		}

		//日期格式化 yyyy-MM-dd HH:mm:ss
		function getFormatDates(timeStamp,flag){
		var date = new Date(parseInt(timeStamp));
		var str = '';
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		console.log(year+','+month+","+date);
		if(month<10){
			month = '0'+month;
		}
		var day = date.getDate();
		if(day<10){
			day = '0'+day;
		}
		var hour = date.getHours();
		if(hour<10){
			hour = '0'+hour;
		}
		var minute = date.getMinutes();
		if(minute<10){
			minute = '0'+minute;
		}
		var second = date.getSeconds();;
		if(second<10){
			second = '0'+second;
		}
		if(flag==5){
			str = year+"-"+month+"-"+day+' '+hour+':'+minute+':'+second;
		}else if(flag==1){
			str = year+"-"+month+"-"+day;
		}else if(flag==2){
			str = hour+':'+minute+':'+second;
		}else if(flag==3){
			str = month+"-"+day;
		}else if(flag==4){
			str = hour+':'+minute;
		}
		return str;
	}

	</script>
</body>
</html>
