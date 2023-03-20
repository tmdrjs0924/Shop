package kr.co.shop.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.shop.service.MemberService;
import kr.co.shop.vo.JusoVo;
import kr.co.shop.vo.MemberVo;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private JavaMailSender mailSender;

	//회원 약관 뷰
	@GetMapping("/member/step1")
	public String step1() {
		logger.info("약관동의 상세보기페이지 진입");
		return "/member/step1";
	}
	
	//회원 가입 뷰
	@GetMapping("/member/join")
	public String join() {
		logger.info("회원가입 페이지 진입");
		return "/member/join";
	}
	
	//회원 가입 실행
	@PostMapping("/member/join_ok")
	public String join_ok(MemberVo mvo) throws Exception{
		logger.info("join 진입");
		return memberservice.join_ok(mvo);
	}
	
	//아이디 체크 실행
	@RequestMapping("/member/userid_check")
	public void userid_check(HttpServletRequest request, PrintWriter out) {
		memberservice.userid_check(request,out);
	}
	
	//이메일 인증 실행
	@GetMapping("/member/mailCheck")
	@ResponseBody
    public String mailCheck(String email) throws Exception{
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
        return memberservice.mailCheck(email);
    }
	
	//로그인 뷰
	@RequestMapping("/member/login")
	public String login(HttpServletRequest request, Model model) {
		return memberservice.login(request,model);
    }
	
	//로그인 실행
	@RequestMapping("/member/login_ok")
	public String login_ok(MemberVo mvo,HttpSession session) {
		return memberservice.login_ok(mvo,session);
	}
	
	//로그아웃 실행
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		return memberservice.logout(session);
	}
	
	//아이디 찾기 실행
	@RequestMapping("/member/userid_search")
	public void userid_search(HttpServletRequest request,PrintWriter out) {
		memberservice.userid_search(request,out);
	}
	
	//비밀번호 찾기 실행
	@RequestMapping("/member/pwd_search")
	public void pwd_search(HttpServletRequest request,PrintWriter out) {
		memberservice.pwd_search(request,out);
	}
	
	//회원정보  뷰
	@RequestMapping("/member/member_view")
	public String member_view(HttpSession session,Model model) {
		return memberservice.member_view(session,model);
	}
	
	//회원정보 수정 뷰
	@RequestMapping("/member/member_edit")
	public String member_edit(HttpSession session,Model model) {
		return memberservice.member_edit(session,model);
	}
	
	//회원정보 수정 실행
	@RequestMapping("/member/member_edit_ok")
	public String member_edit_ok(MemberVo mvo,HttpSession session) {
		return memberservice.member_edit_ok(mvo,session);
	}
	
	//회원탈퇴
	@RequestMapping("/member/member_delete")
	public String member_delete(HttpSession session,Model model) {
		
		return memberservice.member_delete(session,model);
	}
	@RequestMapping("/member/memberDelete")
	public String memberDelete(HttpSession session) {
		
		logger.info("회원정보 삭제");
		
		return memberservice.memberDelete(session);
	}
	
	//비밀번호 변경 뷰
	@RequestMapping("/member/pwd_edit")
	public String pwd_edit(HttpSession session,Model model) {
		logger.info("비밀번호 변경페이지 진입");
		
		return "/member/pwd_edit";
	}
	
	@PostMapping("/member/pwd_edit_ok")
	public String pwd_edit_ok(MemberVo mvo,HttpSession session) {
		
		return memberservice.pwd_edit_ok(mvo, session);
	}
	
	@GetMapping("/member/pwd_find")
    public String pwd_find(String email) {
        
        return "/member/pwd_find";
    }
	
	@GetMapping("/member/pwd_find_ok")
	@ResponseBody
    public String pwd_find_ok(String email) {
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
        return memberservice.pwd_find_ok(email);
    }
	
	@RequestMapping("/member/pwd_change")
	public String pwd_change(HttpServletRequest request, Model model) {
		logger.info("비밀번호 변경페이지 진입");
		
		return memberservice.pwd_change(request, model);
	}
	
	@PostMapping("/member/pwd_change_ok")
	public String pwd_change_ok(MemberVo mvo,HttpSession session) {
		
		return memberservice.pwd_change_ok(mvo, session);
	}
	
	@RequestMapping("/member/juso_edit")
	public String juso_edit() {
		
		return "/member/juso_edit";
	}
	
	@RequestMapping("/member/juso_edit_ok")
	public String juso_edit_ok(JusoVo jvo) throws Exception {
		
		return memberservice.juso_edit_ok(jvo);
	}
	
	@RequestMapping("/member/juso_list")
	public String juso_list(HttpSession session,Model model) {
		return memberservice.juso_list(session,model);
	}
	
	@RequestMapping("/member/juso_delete")
	public String juso_delete(HttpServletRequest request, HttpSession session) {
		
		return memberservice.juso_delete(request,session);
	}
	
	@RequestMapping("/member/juso_gibon")
	public String juso_gibon(HttpServletRequest request, HttpSession session) {
		
		return memberservice.juso_gibon(request,session);
	}
	
	@RequestMapping("/member/mem_state_update")
	public String mem_state_update(HttpSession session) {
		return memberservice.mem_state_update(session);
	}
}
