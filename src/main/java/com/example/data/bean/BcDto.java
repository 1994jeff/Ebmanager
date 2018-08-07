package com.example.data.bean;

public class BcDto extends Bc {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String bName;
	private String bType;
	private String phone;
	private String cAddress;
	private String cName;
	private String cMobile;
	private String cNo;
	private String bNo;
	
	public String getcNo() {
		return cNo;
	}
	public String getbNo() {
		return bNo;
	}
	public void setcNo(String cNo) {
		this.cNo = cNo;
	}
	public void setbNo(String bNo) {
		this.bNo = bNo;
	}
	public String getcAddress() {
		return cAddress;
	}
	public String getcName() {
		return cName;
	}
	public String getcMobile() {
		return cMobile;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public void setcMobile(String cMobile) {
		this.cMobile = cMobile;
	}
	public String getbName() {
		return bName;
	}
	public String getbType() {
		return bType;
	}
	public String getPhone() {
		return phone;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public void setbType(String bType) {
		this.bType = bType;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BcDto [bName=");
		builder.append(bName);
		builder.append(", bType=");
		builder.append(bType);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", cAddress=");
		builder.append(cAddress);
		builder.append(", cName=");
		builder.append(cName);
		builder.append(", cMobile=");
		builder.append(cMobile);
		builder.append(", cNo=");
		builder.append(cNo);
		builder.append(", bNo=");
		builder.append(bNo);
		builder.append("]");
		return builder.toString();
	}
}
