package kr.co.shop.vo;

public class ProductVo {
	private int id, pPrice,pState,pDc,pMile,pInven;
	private String pCode,pName,pSize,pImg1,pImg2,pImg3,pReg;
	
	//필드추가
	private int pDay, pShow, pDelivery;
	
	//필드 추가2
	private int pYoil;
	private String pDay2;
	private String[] pSize2;
	
	//필드추가3
	private String amount;
	private int rchk;

	public int getRchk() {
		return rchk;
	}
	public void setRchk(int rchk) {
		this.rchk = rchk;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String[] getpSize2() {
		return pSize2;
	}
	public void setpSize2(String[] pSize2) {
		this.pSize2 = pSize2;
	}
	public int getpYoil() {
		return pYoil;
	}
	public void setpYoil(int pYoil) {
		this.pYoil = pYoil;
	}
	public String getpDay2() {
		return pDay2;
	}
	public void setpDay2(String pDay2) {
		this.pDay2 = pDay2;
	}
	public int getpDay() {
		return pDay;
	}
	public void setpDay(int pDay) {
		this.pDay = pDay;
	}
	public int getpShow() {
		return pShow;
	}
	public void setpShow(int pShow) {
		this.pShow = pShow;
	}
	public int getpDelivery() {
		return pDelivery;
	}
	public void setpDelivery(int pDelivery) {
		this.pDelivery = pDelivery;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpState() {
		return pState;
	}
	public void setpState(int pState) {
		this.pState = pState;
	}
	public int getpDc() {
		return pDc;
	}
	public void setpDc(int pDc) {
		this.pDc = pDc;
	}
	public int getpMile() {
		return pMile;
	}
	public void setpMile(int pMile) {
		this.pMile = pMile;
	}
	public int getpInven() {
		return pInven;
	}
	public void setpInven(int pInven) {
		this.pInven = pInven;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	public String getpImg1() {
		return pImg1;
	}
	public void setpImg1(String pImg1) {
		this.pImg1 = pImg1;
	}
	public String getpImg2() {
		return pImg2;
	}
	public void setpImg2(String pImg2) {
		this.pImg2 = pImg2;
	}
	public String getpImg3() {
		return pImg3;
	}
	public void setpImg3(String pImg3) {
		this.pImg3 = pImg3;
	}
	public String getpReg() {
		return pReg;
	}
	public void setpReg(String pReg) {
		this.pReg = pReg;
	}
	
}
