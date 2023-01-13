package bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Goods {						//用户类。持久层对象PO

	private Integer userId;
	private String 	username;
	private String 	job;
	private String 	num;
	private Date 	timeRenew;
	private String 	timeRenewString;	//格式化的时间

	public String valueAll() {			//返回所有属性值的字符串
		String msg = "";
		msg += "User: userId = " + userId + ", username = " + username + ", job = " + job; 
		msg += ", phone = " + num + ", timeRenewString = " + timeRenewString;
		return msg;
	}
	
	public String getTimeRenewString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		timeRenewString = sdf.format(timeRenew);	//时间格式化
		
		return timeRenewString;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPhone() {
		return num;
	}
	public void setPhone(String phone) {
		this.num = phone;
	}
	public Date getTimeRenew() {
		return timeRenew;
	}
	public void setTimeRenew(Date timeRenew) {
		this.timeRenew = timeRenew;
	}
	public void setTimeRenewString(String timeRenewString) {
		this.timeRenewString = timeRenewString;
	}	
}

