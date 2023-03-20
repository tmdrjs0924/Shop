package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.JusoVo;
import kr.co.shop.vo.OrderVo;

public interface OrderService {
	public String order(OrderVo ovo, Model model, HttpSession session);
	public String orderAction(OrderVo ovo);
	public String list(Model model, HttpServletRequest request);
	//배송지리스트
	public String addressList(Model model, HttpSession session);
	
	public String changeAddress(HttpServletRequest request) throws Exception;
}
