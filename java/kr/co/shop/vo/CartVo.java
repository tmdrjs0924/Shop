package kr.co.shop.vo;

public class CartVo {
	private int id, amount;
	private String userid, pCode, writeday, size;
	
	//product테이블에서 가져올 값
	private String pImg1, pName, pSize;
	private int pPrice, pDelivery, pDc, pDay;
	
	//배송예정일의 월,일,요일 담을 값
	private String mm, dd, day;
	
	//pSize를 주문수정 페이지 select option에 나열
	private String[] pSizeList;

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpSize() {
		return pSize;
	}

	public void setpSize(String pSize) {
		this.pSize = pSize;
	}

	public String[] getpSizeList() {
		return pSizeList;
	}

	public void setpSizeList(String[] pSizeList) {
		this.pSizeList = pSizeList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getpImg1() {
		return pImg1;
	}

	public void setpImg1(String pImg1) {
		this.pImg1 = pImg1;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpDelivery() {
		return pDelivery;
	}

	public void setpDelivery(int pDelivery) {
		this.pDelivery = pDelivery;
	}

	public int getpDc() {
		return pDc;
	}

	public void setpDc(int pDc) {
		this.pDc = pDc;
	}

	public int getpDay() {
		return pDay;
	}

	public void setpDay(int pDay) {
		this.pDay = pDay;
	}

	public String getMm() {
		return mm;
	}

	public void setMm(String mm) {
		this.mm = mm;
	}

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

}
