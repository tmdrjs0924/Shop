package kr.co.shop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.ProductService;
import kr.co.shop.vo.BoardVo;

@Controller
public class ProductController {
	
	@Autowired
	@Qualifier("ps")
	private ProductService service;
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/main/main";
	}
	@RequestMapping("/main/main")
	public String main(HttpServletRequest request, HttpSession session, Model model) {
		return service.main(request, session, model);
	}
	
	@RequestMapping("/product/cart_add2")
	public void cart_add2(HttpSession session, HttpServletRequest request, PrintWriter out) {
		service.cart_add2(session, request, out);
	}
	
	@RequestMapping("/product/wish_add2")
	public void wish_add2(HttpSession session, HttpServletRequest request, PrintWriter out) {
		service.wish_add2(session, request, out);
	}
	
	@RequestMapping("/product/list")
	public String list(HttpServletRequest request, Model model, HttpSession session) {
		return service.list(request, model, session);
	}
	
	@RequestMapping("/product/display_list")
	public String display_list(HttpServletRequest request, Model model, HttpSession session) {
		return service.display_list(request, model, session);
	}
	
	@RequestMapping("/product/dc_list")
	public String dc_list(HttpServletRequest request, Model model, HttpSession session) {
		return service.dc_list(request, model, session);
	}
	
	@GetMapping("/product/content")
	public String content(HttpServletResponse response, HttpServletRequest request, Model model,HttpSession session) {
		return service.content(response, request, model,session);
	}
	
	@RequestMapping("/product/wish_add")
	public void wish_add(HttpSession session,HttpServletRequest request,PrintWriter out) {
		service.wish_add(request,session,out);
	}
	
	@RequestMapping("/product/product_search")
	public String product_search(HttpServletRequest request, Model model, HttpSession session) {
		return service.product_search(request, model, session);
	}
	
	@RequestMapping("/product/membership")
	public String membership() {
		return "/product/membership";
	}
	
	@RequestMapping("/product/qna_write")
	public String qna_write(HttpSession session, HttpServletRequest request, Model model) {
		return service.qna_write(session, request, model);
	}
	
	@RequestMapping("/product/qna_write_ok")
	public void qna_write_ok(BoardVo bvo, HttpServletRequest request, HttpSession session, PrintWriter out) {
		service.qna_write_ok(bvo, request, session, out);
	}
	
	@RequestMapping("/product/qna_update")
	public String qna_update(HttpServletRequest request, Model model, BoardVo bvo) {
		return service.qna_update(request, model, bvo);
	}
	
	@RequestMapping("/product/qna_update_ok")
	public void qna_update_ok(HttpServletRequest request, BoardVo bvo) {
		service.qna_update_ok(request, bvo);
	}
	
	@RequestMapping("/product/qna_delete")
	public void qna_delete(BoardVo bvo) {
		service.qna_delete(bvo);
	}
	
	@RequestMapping("/product/user_check2")
	public void user_check2(HttpServletRequest request, HttpSession session, PrintWriter out) {
		service.user_check2(request, session, out);
	}
	
	@RequestMapping("/product/view_recent")
	public String view_recent(HttpServletRequest request, Model model) {
		return service.view_recent(request, model);
	}
}
