//获取当前时间
function nowDate(flag){
	var date = new Date();
	//yyyy-MM-dd HH:mm:ss
	var str = '';
	var year = date.getFullYear();
	var month = date.getMonth()+1;
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
	if(flag==1)
	{
		str = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	}else if(flag==2){
		str = year+"-"+month+"-"+day;
	}else if(flag==3){
		str = hour+":"+minute+":"+second;
	}
	return str;
}

//日期格式化 yyyy-MM-dd HH:mm:ss
function getFormatDateStr(dateStr,flag){
	var date = new Date(Date.parse(dateStr.replace(/-/g,'/')));
	var str = '';
	var year = date.getFullYear();
	var month = date.getMonth()+1;
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
	if(flag==null && flag == ''){
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


//获取周一日期
function getMonDay(){
	var date = new Date();
	var nowtime = date.getTime();
	var oneDayTime = 24*60*60*1000;
	var dayNum = date.getDay();
	var str = '';
	//返回日期串
	if(dayNum==1){
		str = getFormatDateStrs(new Date(),1);
	}else if(dayNum==0){
		var MondayTime = nowtime-oneDayTime*6
		str = getFormatDateStrs(new Date(MondayTime),1);
	}else{
		var MondayTime = nowtime-oneDayTime*(dayNum-1);
		str = getFormatDateStrs(new Date(MondayTime),1);
	}
	return str;
}
//获取周日日期
function getSunDay(){
	var date = new Date();
	var nowtime = date.getTime();
	var oneDayTime = 24*60*60*1000;
	var dayNum = date.getDay();
	var str = '';
	//返回日期串
	if(dayNum==0){
		str = getFormatDateStrs(new Date(),1);
	}else{
		var SunDayTime = nowtime+oneDayTime*(7-dayNum);
		str = getFormatDateStrs(new Date(SunDayTime),1);
	}
	return str;
}

//获取1号日期
function getMonthOne(){
	var date=new Date();
	date.setDate(1);
	return getFormatDateStrs(date,1);
}
//获取最后一天日期
function getMonthEnd(){
	var date=new Date();
	var currentMonth=date.getMonth();
	var nextMonth=++currentMonth;
	var nextMonthFirstDay=new Date(date.getFullYear(),nextMonth,1);
	var oneDay=1000*60*60*24;
	var str = getFormatDateStrs(new Date(nextMonthFirstDay.getTime()-oneDay),1);
	return str;
}

//日期格式化 yyyy-MM-dd HH:mm:ss date类型
function getFormatDate(date,flag){
	var str = '';
	var year = date.getFullYear();
	var month = date.getMonth()+1;
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
	if(flag==null && flag == ''){
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

//日期格式化 yyyy-MM-dd HH:mm:ss date类型
function getFormatDateTimeStamp(timeStamp,flag){
	var date = new Date(timeStamp);
	var str = '';
	var year = date.getFullYear();
	var month = date.getMonth()+1;
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
	if(flag==null && flag == ''){
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

//名字加密 刘*明
function getMdName(str){
	var mid = str.substring(1,2);
	if(str.length>3){
		mid = str.substr(1,str.length-2);
	}
	var ds = '';
	for(var i=0;i<mid.length;i++)
		ds += '*';
	str = str.replace(mid,ds);
	return str;
}