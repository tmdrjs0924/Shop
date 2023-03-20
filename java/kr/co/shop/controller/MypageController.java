package kr.co.shop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.MypageService;
import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.ProductVo;
import kr.co.shop.vo.ReviewVo;

@Controller
public class MypageController {

	@Autowired
	@Qualifier("cm")
	private MypageService service;
	
	@RequestMapping("/mypage/counsel_input")
	public void counsel_input(HttpSession session, CounselVo cvo, PrintWriter out, Model model) {
		service.counsel_input(session, cvo, out, model);
	}
	
	@RequestMapping("/mypage/order_history")
	public String order_history(HttpSession session, Model model) {
		return service.order_history(session, model);
	}
	
	@RequestMapping("/mypage/review")
	public String review(HttpServletRequest request, ProductVo pvo, Model model) {
		return service.review(request, pvo, model);
	}
	
	@RequestMapping("/mypage/review_ok")
	public String review_ok(HttpServletRequest request, HttpSession session, ReviewVo rvo) throws Exception {
		return service.review_ok(request, session, rvo);
	}
	
	@RequestMapping("/mypage/order_detail")
	public String order_detail(HttpServletRequest request, HttpSession session, Model model) {
		return service.order_detail(request, session, model);
	}
	
	@RequestMapping("/mypage/state_change")
	public String state_change(HttpServletRequest request) {
		return service.state_change(request);
	}

	@RequestMapping("/mypage/review_history")
	public String review_history(HttpServletRequest request, HttpSession session, Model model) {
		return service.review_history(request, session, model);
	}
	
	@RequestMapping("/mypage/qna_history")
	public String qna_history(HttpServletRequest request, HttpSession session, Model model) {
		return service.qna_history(request, session, model);
	}
	
}
