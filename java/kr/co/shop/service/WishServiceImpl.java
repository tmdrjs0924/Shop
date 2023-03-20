package kr.co.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.WishMapper;

@Service
@Qualifier("ws")
public class WishServiceImpl implements WishService{
	
	@Autowired
	private WishMapper mapper;

	@Override
	public String wish_view(HttpSession session, Model model) {
		
		if(session.getAttribute("userid")==null)
		{
			return "redirect:/member/login";
		}
		else
		{
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("wlist", mapper.wish_view(userid));
			return "/wish/wish_view";
		}
	}

	@Override
	public String wish_del(HttpServletRequest request) {
		
		String[] id=request.getParameter("id").split(",");
		
		for(int i=0;i<id.length;i++)
		{
			System.out.println(id[i]);
			mapper.wish_del(id[i]);
		}
		
		return "redirect:/wish/wish_view";
	}

	@Override
	public String add_cart(HttpServletRequest request, HttpSession session) {
		
		String pCode=request.getParameter("pCode");
		String userid=session.getAttribute("userid").toString();
		
		int cnt=mapper.cart_check(pCode, userid);
		if(cnt==1) {
			
			mapper.cart_up(pCode, userid);
		} else {
			
			mapper.add_cart(pCode, userid);
		}
		
		return "redirect:/product/cart";
	}
}
