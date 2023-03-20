package kr.co.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.CartVo;
import kr.co.shop.vo.OrderVo;

public interface CartService {
	public String add_cart(HttpSession session, OrderVo ovo, CartVo cvo);
	public String cart(Model model, HttpSession session);
	public String update_amount(HttpServletRequest request);
	public String change_size(Model model, HttpServletRequest request, HttpSession session);
	public String change_size_ok(HttpServletRequest request);
	public String delete_cart(HttpServletRequest request);
}
