package kr.co.shop.vo;

public class MemberVo {
	   private int id,state,point;
	   private String userid,name,pwd,zip,juso,juso_etc,phone,email,writeday,npwd;
	   private int TotalPrice, rank;
	   
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		TotalPrice = totalPrice;
	}
	public String getNpwd() {
		return npwd;
	}
	public void setNpwd(String npwd) {
		this.npwd = npwd;
	}
	public int getId() {
		return id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getJuso() {
		return juso;
	}
	public void setJuso(String juso) {
		this.juso = juso;
	}
	public String getJuso_etc() {
		return juso_etc;
	}
	public void setJuso_etc(String juso_etc) {
		this.juso_etc = juso_etc;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone.replace("-", "");
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	   
	   
	}
