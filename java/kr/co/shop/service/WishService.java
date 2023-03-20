package kr.co.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface WishService {
	
	public String wish_view(HttpSession session,Model model);
	public String wish_del(HttpServletRequest request);
	public String add_cart(HttpServletRequest request,HttpSession session);
}
