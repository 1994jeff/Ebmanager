package com.example.data.bean;

import java.io.Serializable;
import java.util.Date;

public class Business implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String no;
	private String name;
	private int level;
	private String phone;
	private String type;
	private Date createTime;
	public int getId() {
		return id;
	}
	public String getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public int getLevel() {
		return level;
	}
	public String getPhone() {
		return phone;
	}
	public String getType() {
		return type;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Business [id=");
		builder.append(id);
		builder.append(", no=");
		builder.append(no);
		builder.append(", name=");
		builder.append(name);
		builder.append(", level=");
		builder.append(level);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", type=");
		builder.append(type);
		builder.append(", createTime=");
		builder.append(createTime);
		builder.append("]");
		return builder.toString();
	}
	
}
