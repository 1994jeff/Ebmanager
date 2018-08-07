package com.example.data.bean;

import java.io.Serializable;
import java.util.Date;

public class Bc implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String bcNo;
	private String bNo;
	private String cNo;
	private int money;//单次购买总金额
	private int num;//单次购买总数量
	private Date createTime;
	
	private int order;//升序或降序
	
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public int getId() {
		return id;
	}
	public String getBcNo() {
		return bcNo;
	}
	public String getbNo() {
		return bNo;
	}
	public String getcNo() {
		return cNo;
	}
	public int getMoney() {
		return money;
	}
	public int getNum() {
		return num;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setBcNo(String bcNo) {
		this.bcNo = bcNo;
	}
	public void setbNo(String bNo) {
		this.bNo = bNo;
	}
	public void setcNo(String cNo) {
		this.cNo = cNo;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Bc [id=");
		builder.append(id);
		builder.append(", bcNo=");
		builder.append(bcNo);
		builder.append(", bNo=");
		builder.append(bNo);
		builder.append(", cNo=");
		builder.append(cNo);
		builder.append(", money=");
		builder.append(money);
		builder.append(", num=");
		builder.append(num);
		builder.append(", createTime=");
		builder.append(createTime);
		builder.append("]");
		return builder.toString();
	}
}
