<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<style>
.logo_jeff{
	margin-left: 4px;
	padding: 8px;
	background-color: #337ab7;
	color: white;
	border-radius: 6px;
	border: 1px #337ab7 solid;
}
.logo_jeff:HOVER{
	background-color: white;
	color: #337ab7;
}
.ol-bg-color{
	background-color: #F8F8F8;
	padding-bottom: 0px;
}
@media only screen and (min-width: 768px) {
	.menu-padding-top{
	padding-top: 10px;
 }
}
</style>
<div class="navbar navbar-default bar-color-style" role="navigation">
	<div class="container">
		<div class="navbar-header" style="padding: 10px 0px;">
		<a href="${pageContext.request.contextPath}/login/toIndex.do" class="navbar-brand"><span class="logo_jeff">后台管理系统</span></a>
		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-responsive-collapse">
		 <span class="sr-only">Toggle Navigation</span>
		 <span class="icon-bar"></span>
		 <span class="icon-bar"></span>
		 <span class="icon-bar"></span>
		 </button>
	</div>
		<!--
	   	作者：offline
	   	描述：使用collapse navbar-collapse类属性的div块就会在小屏时隐藏
	   -->
	<div class="collapse navbar-collapse navbar-responsive-collapse" style="padding:0px 40px;">
	<ul class="nav navbar-nav menu-padding-top">
<%-- 		<li class="dropdown"><a  class="dropdown-toggle" href="${pageContext.request.contextPath }/manager/toManager.do">Backstage</a> --%>
<!-- 		</li> -->
<!-- 		<li> -->
<!-- 			<a href="##">information -->
<!-- 			<span class="badge"></span> -->
<!-- 			</a> -->
<!-- 		</li> -->
		<li><a href="${pageContext.request.contextPath}/login/toExit.do">退出登录</a></li>
		<!--<li><a href="##">Other</a></li>-->
	</ul>
	<!--<form class="navbar-form navbar-right">
	       <div class="form-group">
	         <input type="text" class="form-control" placeholder="Search">
	       </div>
	       <button type="submit" class="btn btn-default">Submit</button>
	      </form>-->
	</div>
	<!--<div class="right">
	     	<ol class="breadcrumb ol-bg-color">
		  <li><a href="#">登录</a></li>
		  <li><a href="#">注册</a></li>
		  <li class=""><a href="#">反馈</a></li>
		</ol>
	   		</div>-->
	</div>
</div>