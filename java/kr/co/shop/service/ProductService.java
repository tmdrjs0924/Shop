package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.BoardVo;

public interface ProductService {
	public String list(HttpServletRequest request, Model model, HttpSession session);
	public String display_list(HttpServletRequest request, Model model, HttpSession session);
	public String dc_list(HttpServletRequest request, Model model, HttpSession session);
	public String content(HttpServletResponse response, HttpServletRequest request, Model model,HttpSession session);
	public void cart_add2(HttpSession session, HttpServletRequest request, PrintWriter out);
	public void wish_add2(HttpSession session, HttpServletRequest request, PrintWriter out);
	public void wish_add(HttpServletRequest request,HttpSession session,PrintWriter out);
	public String main(HttpServletRequest request, HttpSession session, Model model);
	public String product_search(HttpServletRequest request, Model model, HttpSession session);
	public void qna_write_ok(BoardVo bvo, HttpServletRequest request, HttpSession session, PrintWriter out);
	public String qna_update(HttpServletRequest request, Model model, BoardVo bvo);
	public void qna_update_ok(HttpServletRequest request, BoardVo bvo);
	public void qna_delete(BoardVo bvo);
	public String qna_write(HttpSession session, HttpServletRequest request, Model model);
	public void user_check2(HttpServletRequest request, HttpSession session, PrintWriter out);
	public String view_recent(HttpServletRequest request, Model model);
}