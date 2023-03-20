package kr.co.shop.service;


import java.io.PrintWriter;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.shop.mapper.MemberMapper;
import kr.co.shop.mapper.OrderMapper;
import kr.co.shop.vo.JusoVo;
import kr.co.shop.vo.OrderVo;
import kr.co.shop.vo.ProductVo;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired OrderMapper ordermapper;
	
	@Override
	public String order(OrderVo ovo, Model model, HttpSession session) {
		
		//멤버테이블에서 가져올 userid session
		String userid;
		
		if(session.getAttribute("userid")== null) {
			userid="guest";
		} else {
			userid=session.getAttribute("userid").toString();
		}
		
		//상품컨텐츠 페이지에서 들어온 사이즈, 수량 배열화

		String[] orderCode = ovo.getTotal_code().split(",");
		String[] orderAmount = ovo.getTotal_amount().split(",");
		String[] orderSize = ovo.getTotal_size().split(",");
		
		
		//사이즈, 수량 리스트로 보내줌
		ArrayList<OrderVo> olist = new ArrayList<OrderVo>();
		
		for(int i=0;i<orderCode.length;i++)
		{
			OrderVo ovo2 = new OrderVo();
			
			ovo2.setOrderAmount(orderAmount[i]);
			ovo2.setOrderCode(orderCode[i]);
			ovo2.setOrderSize(orderSize[i]);
			
			ovo2.setpImg1(ordermapper.getProduct(orderCode[i]).getpImg1());
			ovo2.setpName(ordermapper.getProduct(orderCode[i]).getpName());
			
			ovo2.setpDelivery(ordermapper.getProduct(orderCode[i]).getpDelivery());
			ovo2.setpDc(ordermapper.getProduct(orderCode[i]).getpDc());
			ovo2.setpPrice(ordermapper.getProduct(orderCode[i]).getpPrice());
			ovo2.setpMile(ordermapper.getProduct(orderCode[i]).getpMile());
			olist.add(ovo2);
		}
		
		// 뷰페이지에 olist,pvo,mvo전달
		model.addAttribute("olist", olist);
		model.addAttribute("jvo", ordermapper.jusoList(userid));
		model.addAttribute("total_price", ovo.getTotal_price());
		model.addAttribute("total_amount2", ovo.getTotal_amount2());
		model.addAttribute("total_delivery", ovo.getTotal_delivery());
		model.addAttribute("mvo", ordermapper.getMember(userid));
		return "/order/order";
	}
	
	@Override
	public String orderAction(OrderVo ovo) {
		//주문번호 생성
		LocalDate today=LocalDate.now();
		int y=today.getYear();
		int m=today.getMonthValue();
		String mm=m+"";
		if(mm.length()==1)
			mm="0"+mm;
		
		int d=today.getDayOfMonth();
		String dd=d+"";
		if(dd.length()==1)
			dd="0"+dd;
		
		String number=y+mm+dd;
        int num=ordermapper.getNumber(number);
        String imsi=String.format("%04d", num);
        number=number+imsi;
        
        ovo.setOrderNumber(number);
        
        //상품 개수 만큼 상품개별주문코드 생성
        String[] code = ovo.getOrderCode().split(",");
        int size = code.length;
        
        String orderPnumber ="";
        for(int i=0;i<size;i++) {
        	orderPnumber = orderPnumber+(number+i)+",";
        }
        ovo.setOrderPnumber(orderPnumber);
        
        //적립금 사용
        int point = ovo.getOrderTotalPoint();
        String userid = ovo.getOrderUserid();
        ordermapper.useMileage(point, userid);
        
        
		ordermapper.orderAction(ovo);
		return "redirect:/order/list?orderNumber="+ovo.getOrderNumber();
	}
	
	@Override
	public String list(Model model, HttpServletRequest request) {
		String orderNumber = request.getParameter("orderNumber");
		OrderVo ovo = ordermapper.list(orderNumber);
		String userid = ovo.getOrderUserid();
		
		String[] code = ovo.getOrderCode().split(",");
		String[] size = ovo.getOrderSize().split(",");
		String[] amount = ovo.getOrderAmount().split(",");
		
		ArrayList<OrderVo> olist = new ArrayList<OrderVo>();
		
		for(int i=0;i<code.length;i++)
		{
			OrderVo ovo2 = new OrderVo();
			ovo2.setOrderCode(code[i]);
			ovo2.setOrderSize(size[i]);
			ovo2.setOrderAmount(amount[i]);
			
			ovo2.setpImg1(ordermapper.getProduct(ovo2.getOrderCode()).getpImg1());
			ovo2.setpName(ordermapper.getProduct(ovo2.getOrderCode()).getpName());
			ovo2.setpPrice(ordermapper.getProduct(ovo2.getOrderCode()).getpPrice());
			ovo2.setpDc(ordermapper.getProduct(ovo2.getOrderCode()).getpDc());
			olist.add(ovo2);
		}
		
		model.addAttribute("plist",ordermapper.getBestProduct());
		model.addAttribute("mvo", ordermapper.getMember(userid));
		model.addAttribute("ovo", ovo);
		model.addAttribute("olist", olist);
		return "/order/list";
	}
	//배송지리스트
	@Override
	public String addressList(Model model, HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		model.addAttribute("jlist", ordermapper.addressList(userid));
		return "/order/addressList";
	}
	
	@Override
	public String changeAddress(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		JusoVo jvo = ordermapper.changeAddress(id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(jvo);
		return json;
		
		
	}
	


}
