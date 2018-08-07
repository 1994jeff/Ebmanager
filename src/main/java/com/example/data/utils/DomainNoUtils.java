package com.example.data.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DomainNoUtils {

	public static final String WIFI_NO = "WN";
	public static final String USER_NO = "UN";
	public static final String SIGNED_NO = "SN";
	public static final String USERAUTH_NO = "UA";
	public static final String AUTH_NO = "AN";
	public static final String BC_NO = "BCN";

	public static final int bitlength = 5;
	
	private static String dayStr = "";
	private static Integer userNum=1;
	private static Integer wifiNum=1;
	private static Integer signedNum=1;
	private static Integer userAuthNum=1;
	private static Integer authNum=1;
	private static Integer bcNum=1;
	
	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	private static SimpleDateFormat timeFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	
	public static String getNoByPreStr(String string) {
		String timeStr = timeFormat.format(new Date());
		String str = "";
		switch (string) {
		case USER_NO:
			str = getUserNo(timeStr);
			break;
		case WIFI_NO:
			str = getWiFiNo(timeStr);
			break;
		case SIGNED_NO:
			str = getSignedNo(timeStr);
			break;
		case USERAUTH_NO:
			str = getUserAuthNo(timeStr);
			break;
		case AUTH_NO:
			str = getAuthNo(timeStr);
			break;
		case BC_NO:
			str = getBCNo(timeStr);
			break;
		default:
			break;
		}
		return str;
	}

	private static String getBCNo(String timeStr) {
		String dateStr = getDateStr();
		if(dateStr.equals(dayStr)){
			bcNum++;
		}else{
			bcNum=1;
			dayStr=dateStr;
		}
		return BC_NO+timeStr+FormatNumBits(String.valueOf(bcNum));
	}

	private static String getUserAuthNo(String timeStr) {
		String dateStr = getDateStr();
		if(dateStr.equals(dayStr)){
			userAuthNum++;
		}else{
			userAuthNum=1;
			dayStr=dateStr;
		}
		return USERAUTH_NO+timeStr+FormatNumBits(String.valueOf(userAuthNum));
	}

	private static String getAuthNo(String timeStr) {
		String dateStr = getDateStr();
		if(dateStr.equals(dayStr)){
			authNum++;
		}else{
			authNum=1;
			dayStr=dateStr;
		}
		return AUTH_NO+timeStr+FormatNumBits(String.valueOf(authNum));
	}

	private static String getSignedNo(String timeStr) {
		String dateStr = getDateStr();
		if(dateStr.equals(dayStr)){
			signedNum++;
		}else{
			signedNum=1;
			dayStr=dateStr;
		}
		return SIGNED_NO+timeStr+FormatNumBits(String.valueOf(signedNum));
	}

	private static String getUserNo(String timeStr) {
		String dateStr = getDateStr();
		if(dateStr.equals(dayStr)){
			userNum++;
		}else{
			userNum=1;
			dayStr=dateStr;
		}
		return USER_NO+timeStr+FormatNumBits(String.valueOf(userNum));
	}
	
	private static String getWiFiNo(String timeStr) {
		String dateStr = getDateStr();
		if(dateStr.equals(dayStr)){
			wifiNum++;
		}else{
			wifiNum=1;
			dayStr=dateStr;
		}
		return WIFI_NO+timeStr+FormatNumBits(String.valueOf(wifiNum));
	}

	private static String FormatNumBits(String valueOf) {
		StringBuilder builder = new StringBuilder();
		for(int i=0;i<(5-valueOf.length());i++)
		{
			builder.append("0");
		}
		return builder.toString()+valueOf;
	}

	private static String getDateStr() {
		String nowStr = dateFormat.format(new Date());
		return nowStr;
	}

}
