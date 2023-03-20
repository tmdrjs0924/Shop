package kr.co.shop.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.CartService;
import kr.co.shop.vo.CartVo;
import kr.co.shop.vo.OrderVo;

@Controller
public class CartController {
	
	@Autowired
	@Qualifier("cs")
	private CartService service;
	
	@RequestMapping("/product/add_cart")
	public String add_cart(HttpSession session, OrderVo ovo, CartVo cvo) {
		return service.add_cart(session, ovo, cvo);
	}
	
	@RequestMapping("/product/cart")
	public String cart(Model model, HttpSession session) {
		return service.cart(model, session);
	}

	@RequestMapping("/product/change_size")
	public String change_size(Model model, HttpServletRequest request, HttpSession session) {
		return service.change_size(model, request, session);
	}
	
	@RequestMapping("/product/update_amount")
	public String update_amount(HttpServletRequest request) {
		return service.update_amount(request);
	}
	
	@RequestMapping("/product/change_size_ok")
	public String change_size_ok(HttpServletRequest request) {
		return service.change_size_ok(request);
	}
	
	@RequestMapping("/product/delete_cart")
	public String delete_cart(HttpServletRequest request) {
		return service.delete_cart(request);
	}

}
