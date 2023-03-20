package kr.co.shop.vo;

import java.util.ArrayList;

public class OrderVo {
	

	//넘어온 상품코드, 수량, 옵션 스플릿 하기 전 데이터
	private String total_code, total_size, total_amount;
	
	//넘어온 합계배송비, 합계 할인금액 
	private String total_delivery,total_price;
	
	//넘어온 수량합계
	private int total_amount2;
	
	//출력될 상품코드, 수량, 옵션 배열 
	private String orderCode, orderAmount, orderSize;
	
	//상품정보 출력
	private String pImg1, pName;
	private int pDelivery, pDc, pPrice, pMile;
	
	
	//테이블에 저장될 정보
	private int id, orderAddressId, orderPayType, orderPaySelection, orderMileage,
	orderTotalPrice, orderTotalAmount, orderTotalDelivery, orderTotalCoupon, orderTotalPoint, orderTotalPayment;

	private String orderNumber,orderUserid,orderDeliver,orderDc,orderPrice, orderMessage, orderDate, orderPayInstallment;
	
	//추가1 (결제수단별 데이터값) 
	private int orderPaySelection2, orderPaySelection3;
	private String orderMessage2, orderPayInstallment2, orderPayInstallment3;
	
	//추가2 (주문상태)
	private int orderState;
	
	//추가3 (주문내역)
	private String orderName, orderPhone, orderAdd;
	private ArrayList<ProductVo> plist;
	private int originPrice, originDc;

	//추가4(상품개별주문번호)
	private String orderPnumber;
	private String orderZip, orderJuso, orderJuso_etc; 
	
	private String[] pName2;
	
	
	public String[] getpName2() {
		return pName2;
	}

	public void setpName2(String[] pName2) {
		this.pName2 = pName2;
	}

	public String getOrderZip() {
		return orderZip;
	}

	public void setOrderZip(String orderZip) {
		this.orderZip = orderZip;
	}

	public String getOrderJuso() {
		return orderJuso;
	}

	public void setOrderJuso(String orderJuso) {
		this.orderJuso = orderJuso;
	}

	public String getOrderJuso_etc() {
		return orderJuso_etc;
	}

	public void setOrderJuso_etc(String orderJuso_etc) {
		this.orderJuso_etc = orderJuso_etc;
	}

	public String getOrderPnumber() {
		return orderPnumber;
	}

	public void setOrderPnumber(String orderPnumber) {
		this.orderPnumber = orderPnumber;
	}

	public int getOriginPrice() {
		return originPrice;
	}

	public void setOriginPrice(int originPrice) {
		this.originPrice = originPrice;
	}

	public int getOriginDc() {
		return originDc;
	}

	public void setOriginDc(int originDc) {
		this.originDc = originDc;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone.replace("-", "");
	}

	public String getOrderAdd() {
		return orderAdd;
	}

	public void setOrderAdd(String orderAdd) {
		this.orderAdd = orderAdd;
	}

	public ArrayList<ProductVo> getPlist() {
		return plist;
	}

	public void setPlist(ArrayList<ProductVo> plist) {
		this.plist = plist;
	}

	public int getOrderState() {
		return orderState;
	}

	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}

	public int getOrderPaySelection2() {
		return orderPaySelection2;
	}

	public void setOrderPaySelection2(int orderPaySelection2) {
		this.orderPaySelection2 = orderPaySelection2;
	}

	public int getOrderPaySelection3() {
		return orderPaySelection3;
	}

	public void setOrderPaySelection3(int orderPaySelection3) {
		this.orderPaySelection3 = orderPaySelection3;
	}

	public String getOrderPayInstallment2() {
		return orderPayInstallment2;
	}

	public void setOrderPayInstallment2(String orderPayInstallment2) {
		this.orderPayInstallment2 = orderPayInstallment2;
	}

	public String getOrderPayInstallment3() {
		return orderPayInstallment3;
	}

	public void setOrderPayInstallment3(String orderPayInstallment3) {
		this.orderPayInstallment3 = orderPayInstallment3;
	}

	public String getOrderMessage2() {
		return orderMessage2;
	}

	public void setOrderMessage2(String orderMessage2) {
		this.orderMessage2 = orderMessage2;
	}

	public String getOrderPayInstallment() {
		return orderPayInstallment;
	}

	public void setOrderPayInstallment(String orderPayInstallment) {
		this.orderPayInstallment = orderPayInstallment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderAddressId() {
		return orderAddressId;
	}

	public void setOrderAddressId(int orderAddressId) {
		this.orderAddressId = orderAddressId;
	}

	public int getOrderPayType() {
		return orderPayType;
	}

	public void setOrderPayType(int orderPayType) {
		this.orderPayType = orderPayType;
	}

	public int getOrderPaySelection() {
		return orderPaySelection;
	}

	public void setOrderPaySelection(int orderPaySelection) {
		this.orderPaySelection = orderPaySelection;
	}

	public int getOrderMileage() {
		return orderMileage;
	}

	public void setOrderMileage(int orderMileage) {
		this.orderMileage = orderMileage;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(String orderTotalPrice) {
		this.orderTotalPrice = Integer.parseInt(orderTotalPrice.replaceAll("원|\\,", ""));
	}

	public int getOrderTotalAmount() {
		return orderTotalAmount;
	}

	public void setOrderTotalAmount(String orderTotalAmount) {
		this.orderTotalAmount = Integer.parseInt(orderTotalAmount.replaceAll("개|\\,", ""));
	}

	public int getOrderTotalDelivery() {
		return orderTotalDelivery;
	}

	public void setOrderTotalDelivery(String orderTotalDelivery) {
		this.orderTotalDelivery = Integer.parseInt(orderTotalDelivery.replaceAll("원|\\,", ""));
	}

	public int getOrderTotalCoupon() {
		return orderTotalCoupon;
	}

	public void setOrderTotalCoupon(String orderTotalCoupon) {
		this.orderTotalCoupon = Integer.parseInt(orderTotalCoupon.replaceAll("원|\\,", ""));
	}

	public int getOrderTotalPoint() {
		return orderTotalPoint;
	}

	public void setOrderTotalPoint(String orderTotalPoint) {
		this.orderTotalPoint = Integer.parseInt(orderTotalPoint.replaceAll("원|\\,", ""));
	}

	public int getOrderTotalPayment() {
		return orderTotalPayment;
	}

	public void setOrderTotalPayment(String orderTotalPayment) {
		this.orderTotalPayment = Integer.parseInt(orderTotalPayment.replaceAll("원|\\,", ""));;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getOrderUserid() {
		return orderUserid;
	}

	public void setOrderUserid(String orderUserid) {
		this.orderUserid = orderUserid;
	}

	public String getOrderDeliver() {
		return orderDeliver;
	}

	public void setOrderDeliver(String orderDeliver) {
		this.orderDeliver = orderDeliver;
	}

	public String getOrderDc() {
		return orderDc;
	}

	public void setOrderDc(String orderDc) {
		this.orderDc = orderDc;
	}

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderMessage() {
		return orderMessage;
	}

	public void setOrderMessage(String orderMessage) {
		this.orderMessage = orderMessage;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getpMile() {
		return pMile;
	}

	public void setpMile(int pMile) {
		this.pMile = pMile;
	}

	public int getTotal_amount2() {
		return total_amount2;
	}

	public void setTotal_amount2(int total_amount2) {
		this.total_amount2 = total_amount2;
	}

	public String getTotal_delivery() {
		return total_delivery;
	}

	public void setTotal_delivery(String total_delivery) {
		this.total_delivery = total_delivery;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
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

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
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

	

	public String getTotal_code() {
		return total_code;
	}

	public void setTotal_code(String total_code) {
		this.total_code = total_code;
	}

	public String getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(String total_amount) {
		this.total_amount = total_amount;
	}

	public String getTotal_size() {
		return total_size;
	}

	public void setTotal_size(String total_size) {
		this.total_size = total_size;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderSize() {
		return orderSize;
	}

	public void setOrderSize(String orderSize) {
		this.orderSize = orderSize;
	}

	
}
