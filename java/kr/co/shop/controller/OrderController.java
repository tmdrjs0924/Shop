package kr.co.shop.controller;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.shop.service.OrderService;
import kr.co.shop.vo.JusoVo;
import kr.co.shop.vo.OrderVo;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderservice;
	
	@RequestMapping("/order/order")
	public String order(OrderVo ovo, Model model, HttpSession session) {
		return orderservice.order(ovo, model, session);
	}
	
	@PostMapping("/order/orderAction")
	public String orderAction(OrderVo ovo) {
		return orderservice.orderAction(ovo);
	}
	
	@GetMapping("/order/list")
	public String list(Model model, HttpServletRequest request) {
		return orderservice.list(model, request);
	}
	
	//배송지리스트
	@RequestMapping("/order/addressList")
	public String addressList(Model model, HttpSession session) {
		return orderservice.addressList(model,session);
	}
	
	@ResponseBody
	@RequestMapping(value ="/order/changeAddress", produces = "application/text; charset=UTF-8")
	public String changeAddress(HttpServletRequest request) throws Exception {
		return orderservice.changeAddress(request);
	}

}
