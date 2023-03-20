package kr.co.shop.service;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.shop.vo.JusoVo;
import kr.co.shop.vo.MemberVo;

public interface MemberService {
	
	//회원가입 실행
	public String join_ok(MemberVo mvo) throws Exception;
	
	//아이디 체크
	public void userid_check(HttpServletRequest request,PrintWriter out);
	
	//로그인 실행
    public String login_ok(MemberVo mvo ,HttpSession session);
	
    //로그인 뷰
    public String login(HttpServletRequest request,Model model);
    
    //로그아웃 실행
    public String logout(HttpSession session);
    
    //아이디 검색
    public void userid_search(HttpServletRequest request,PrintWriter out);
    
    //비밀번호 검색
    public void pwd_search(HttpServletRequest request,PrintWriter out);
    
    //회원정보 뷰
    public String member_view(HttpSession session,Model model);
    
    //회원정보 수정 뷰
    public String member_edit(HttpSession session,Model model);
    
    //회원정보 수정 실행
    public String member_edit_ok(MemberVo mvo, HttpSession session);
    
    public String member_delete(HttpSession session,Model model);
    
    //회원탈퇴
    public String memberDelete(HttpSession session);
    
    //아이디 체크
    public MemberVo checkMemberId(String userid);
    
    //이메일 체크
    public String mailCheck(String email);
    
    public String pwd_find_ok(String email);
    
    public String pwd_edit(HttpSession session,Model model);
    
    public String pwd_edit_ok(MemberVo mvo,HttpSession session);
    
    public String pwd_change(HttpServletRequest request, Model model);
    
    public String pwd_change_ok(MemberVo mvo, HttpSession session);
    
    public String juso_edit_ok(JusoVo jvo) throws Exception;
    
    public String juso_list(HttpSession session,Model model);
    
    public String juso_delete(HttpServletRequest request, HttpSession session);
    
    public String juso_gibon(HttpServletRequest request, HttpSession session);
    
    public String mem_state_update(HttpSession session);

}
