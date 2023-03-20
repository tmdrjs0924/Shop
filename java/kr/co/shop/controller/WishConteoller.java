package kr.co.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.WishService;

@Controller
public class WishConteoller {
	
	private static final Logger logger = LoggerFactory.getLogger(WishConteoller.class);
	
	@Autowired
	@Qualifier("ws")
	private WishService service;
	
	@RequestMapping("/wish/wish_view")
	public String wish_view(HttpSession session,Model model) {
		logger.info("위시리스트페이지 진입");
		return service.wish_view(session,model);
	}
	
	@RequestMapping("/wish/wish_del")
	public String wish_del(HttpServletRequest request)
	{
		return service.wish_del(request);
	}
	
	@RequestMapping("/wish/add_cart")
	public String add_cart(HttpServletRequest request,HttpSession session)
	{
		return service.add_cart(request,session);
	}
}
