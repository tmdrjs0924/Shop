package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.ProductVo;
import kr.co.shop.vo.ReviewVo;

public interface MypageService {
	public void counsel_input(HttpSession session, CounselVo cvo, PrintWriter out, Model model);
	public String order_history(HttpSession session, Model model);
	public String order_detail(HttpServletRequest request, HttpSession session, Model model);
	public String state_change(HttpServletRequest request);
	public String review(HttpServletRequest request, ProductVo pvo, Model model);
	public String review_ok(HttpServletRequest request, HttpSession session, ReviewVo rvo) throws Exception;
	public String review_history(HttpServletRequest request, HttpSession session, Model model);
	public String qna_history(HttpServletRequest request, HttpSession session, Model model);
}
