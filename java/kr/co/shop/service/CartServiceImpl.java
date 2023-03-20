package kr.co.shop.service;

import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.CartMapper;
import kr.co.shop.vo.CartVo;
import kr.co.shop.vo.OrderVo;

@Service
@Qualifier("cs")
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper mapper;
	
	@Override
	public String add_cart(HttpSession session, OrderVo ovo, CartVo cvo ) {
		if(session.getAttribute("userid")==null) {
			return "../login/login?chk=9";
		}
		else {
			String userid=session.getAttribute("userid").toString();
			cvo.setUserid(userid);
			
			String[] amount=ovo.getTotal_amount().split(",");
			String[] size=ovo.getTotal_size().split(",");
			String[] pCode=ovo.getTotal_code().split(",");
			
			for(int i=0;i<pCode.length;i++) {
					cvo.setpCode(pCode[i]);
					cvo.setAmount(Integer.parseInt(amount[i]));
					cvo.setSize(size[i]);
					mapper.add_cart(cvo);
			}
			return "redirect:/product/cart";
		}
	}

	@Override
	public String cart(Model model, HttpSession session) {
		if(session.getAttribute("userid")==null) {
			return "redirect:/member/login?chk=9";
		}
		else {
			String userid=session.getAttribute("userid").toString();
			
			ArrayList<CartVo> clist=mapper.cart(userid);
			for(int i=0;i<clist.size();i++) {
				// 도착예정일의 월,일 값 '2023-02-22 시 분 초'=> 2, 22
				String xday=mapper.getDay(clist.get(i).getpCode());
				String mm="";
				if(xday.substring(5,6).equals("0"))
					mm=xday.substring(6,7);
				else
					mm=xday.substring(5,7);
				String dd="";
				if(xday.substring(8,9).equals("0"))
					dd=xday.substring(9,10);
				else
					dd=xday.substring(8,10);
				clist.get(i).setMm(mm);
				clist.get(i).setDd(dd);
				
				// 도착예정일의 요일
				LocalDate now=LocalDate.now();
				String day=now.plusDays(clist.get(i).getpDay()).getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREAN);
				clist.get(i).setDay(day);
			}
			// 전체선택 시 상품가격, 배송비, 할인가격을 보여주기 위한 값
			String price="";
			String delivery="";
			String dc="";
			for(int i=0;i<clist.size();i++) {
				price=price+clist.get(i).getpPrice()+",";
				delivery=delivery+clist.get(i).getpDelivery()+",";
				dc=dc+(int)(clist.get(i).getpPrice()*clist.get(i).getpDc()/100.0)+",";
			}
			model.addAttribute("clist", clist);
			model.addAttribute("price", price);
			model.addAttribute("delivery", delivery);
			model.addAttribute("dc", dc);
			
			return "/product/cart";
		}
	}
	
	@Override
	public String update_amount(HttpServletRequest request) {
		String amount=request.getParameter("amount");
		String id=request.getParameter("id");

		mapper.update_amount(amount, id);
		return "redirect:/product/cart";
	}
	
	@Override
	public String change_size(Model model, HttpServletRequest request, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		String id=request.getParameter("id");
		String index=request.getParameter("index");
		CartVo cvo=mapper.change_size(id, userid);

		String[] pSizeList=cvo.getpSize().split(",");
		cvo.setpSizeList(pSizeList);
		
		model.addAttribute("pSizeList", pSizeList);
		model.addAttribute("cvo", cvo);
		model.addAttribute("index", index);
		
		return "/product/change_size";
	}
	
	@Override
	public String change_size_ok(HttpServletRequest request) {
		String id=request.getParameter("id");
		String size=request.getParameter("size");
		
		mapper.change_size_ok(size, id);
		
		return "redirect:/product/cart";
	}
	
	@Override
	public String delete_cart(HttpServletRequest request) {
		String[] id=request.getParameter("id").split(",");
		for(int i=0;i<id.length;i++)
			mapper.delete_cart(id[i]);
		
		return "redirect:/product/cart";
	}
	
}