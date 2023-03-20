package kr.co.shop.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Optional;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import kr.co.shop.mapper.MemberMapper;
import kr.co.shop.vo.JusoVo;
import kr.co.shop.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper membermapper;

	//메일인증
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public String join_ok(MemberVo member) throws Exception {
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		System.out.println("암호화 전 비밀번호:"+member.getPwd());
		
		String securePwd=encoder.encode(member.getPwd());
		
		member.setPwd(securePwd);
		System.out.println("암호화 후 비밀번호:"+member.getPwd());
		
		membermapper.join_ok(member);
		return "redirect:/member/login?chk=2";
	}

	@Override
	public void userid_check(HttpServletRequest request, PrintWriter out) {
		String userid=request.getParameter("userid");
		out.print( membermapper.userid_check(userid) );
	}

	@Override
	public String login_ok(MemberVo mvo, HttpSession session) {
		
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();

		MemberVo mvo2=membermapper.login_ok(mvo);
		
		if(mvo2!=null)
		{
			boolean passMatch=encoder.matches(mvo.getPwd(), mvo2.getPwd());
			
			if(passMatch)
			{
			session.setAttribute("userid", mvo2.getUserid());
			session.setAttribute("name", mvo2.getName());
			
			//회원등급 업데이트
			String userid = mvo2.getUserid();
			int memberTotalPrice = membermapper.memberTotalPrice(userid);
			
			int rank=0;
			if(memberTotalPrice < 100000)
				rank=0;
			else if(memberTotalPrice < 500000) 
				rank=1;
			else if(memberTotalPrice < 1000000) 
				rank=2;
			else 
				rank=3;
			membermapper.rankUpdate(rank, userid);
			
			
			return "redirect:/main/main";
			}
			else
			{
				return "redirect:/member/login?chk=1";
			}
		}
		else
		{
			return "redirect:/member/login?chk=1";
		}
	}

	@Override
	public String login(HttpServletRequest request, Model model) {
		String chk=request.getParameter("chk");
		model.addAttribute("chk", chk);
		
		
		return "/member/login";
	}

	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main";
	}

	@Override
	public void userid_search(HttpServletRequest request, PrintWriter out) {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String userid=membermapper.userid_search(name, email);
		
		if(userid==null)
		{
			out.print("1");
		}
		else
		{
			out.print(userid);
		}
	}

	@Override
	public void pwd_search(HttpServletRequest request, PrintWriter out) {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String userid=request.getParameter("userid");
		String pwd=membermapper.pwd_search(name, email, userid);
		
		if(pwd==null)
		{
			out.print("1");
		}
		else
		{
			out.print(pwd);
		}
	}

	@Override
	public String member_view(HttpSession session, Model model) {
		
		if(session.getAttribute("userid")==null)
		{
			return "redirect:/member/login";
		}
			String userid=session.getAttribute("userid").toString();
			MemberVo mvo=membermapper.member_view(userid);
			String phone1=mvo.getPhone().substring(0, 2)+"*";
			String phone2=mvo.getPhone().substring(3, 5)+"**";
			String phone3=mvo.getPhone().substring(7, 9)+"**";
			String email1=mvo.getEmail().substring(0, 3)+"*****";
			int email_len1=mvo.getEmail().indexOf("@");
			String email2=mvo.getEmail().substring(email_len1, email_len1+3)+"*****";
			int email_len2=mvo.getEmail().lastIndexOf(".");
			String email3=mvo.getEmail().substring(email_len2);
			mvo.setPhone(phone1+phone2+phone3);
			mvo.setEmail(email1+email2+email3);
			model.addAttribute("mvo", mvo);
			
			int reviewCount=membermapper.reviewCount(userid);
			int qnaCount=membermapper.qnaCount(userid);
			model.addAttribute("rcnt", reviewCount);
			model.addAttribute("qcnt", qnaCount);
			
			model.addAttribute("orderState2count", membermapper.orderStateCount(2, userid));
			model.addAttribute("orderState3count", membermapper.orderStateCount(3, userid));
			model.addAttribute("orderState5count", membermapper.orderStateCount(5, userid));
			model.addAttribute("orderState7count", membermapper.orderStateCount(7, userid));
			model.addAttribute("orderState9count", membermapper.orderStateCount(9, userid));
			model.addAttribute("orderState10count", membermapper.orderStateCount(10, userid));
			
			return "/member/member_view";
	}

	@Override
	public String member_edit(HttpSession session,Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("mvo",membermapper.member_edit(userid));
		return "/member/member_edit";
	}

	@Override
	public String member_edit_ok(MemberVo mvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		mvo.setUserid(userid);
		membermapper.member_edit_ok(mvo);
		return "redirect:/member/member_view";
	}
	
	@Override
	public String member_delete(HttpSession session, Model model) {
		
		if(session.getAttribute("userid")==null) {
			return "redirect:/member/login";
		}
		
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("mvo", membermapper.member_delete(userid));
		
		return "/member/member_delete";
	}
	
	@Override
	public String memberDelete(HttpSession session) {
		
		String userid=session.getAttribute("userid").toString();
		membermapper.memberDelete(userid);
		
		return "redirect:../member/member_view";
	}

	@Override
	public String mem_state_update(HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		membermapper.mem_state_update(userid);
		
		return "redirect:/member/member_view";
	}
	
	@Override
	public MemberVo checkMemberId(String userid) {
		return membermapper.checkMemberId(userid);
	}
	
	//이메일 체크
	@Override
	public String mailCheck(String email) {
    	/* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        
        /* 이메일 보내기 */
        String setFrom = "";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        } 
        String num = Integer.toString(checkNum);
        return num;
	}

	@Override
	public String pwd_edit(HttpSession session, Model model) {
		
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("mvo", membermapper.pwd_edit(userid));
		
		return "/member/pwd_edit";
	}

	@Override
	public String pwd_edit_ok(MemberVo mvo, HttpSession session) {
		
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		
		String securePwd=encoder.encode(mvo.getNpwd());
		
		mvo.setPwd(securePwd);
		
		String userid=session.getAttribute("userid").toString();
		mvo.setUserid(userid);
		membermapper.pwd_edit_ok(mvo);
		return "redirect:/member/member_view";
	}

	@Override
	public String pwd_find_ok(String email) {
		Random random=new Random();
		int checkNum=random.nextInt(888888) + 111111;
		
		String setFrom="";
		String toMail=email;
		String title="비밀번호변경 인증번호 이메일 입니다";
		String content=
				"인증번호는 " + checkNum + "입니다" +
		        "<br>" +
				"인증 후 비밀번호를 변경해주시기 바랍니다";
		try {
			
			MimeMessage message=mailSender.createMimeMessage();
			MimeMessageHelper helper=new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
		String num=Integer.toString(checkNum);
		
		return num;
	}

	@Override
	public String pwd_change(HttpServletRequest request, Model model) {
		model.addAttribute("userid", request.getParameter("userid"));
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("email", request.getParameter("email"));
		return "/member/pwd_change";
	}
	
	@Override
	public String pwd_change_ok(MemberVo mvo, HttpSession session) {
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String securePwd=encoder.encode(mvo.getNpwd());
		
		mvo.setPwd(securePwd);
		membermapper.pwd_change_ok(mvo);
		
		
		return "redirect:/member/login";
	}

	@Override
	public String juso_edit_ok(JusoVo jvo) throws Exception {
		
		membermapper.juso_edit_ok(jvo);
		
		return "redirect:/member/juso_list";
	}

	@Override
	public String juso_list(HttpSession session,Model model) {
		
		if(session.getAttribute("userid")==null) {
			
			return "redirect:/member/login";
		} else {
			
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("jlist", membermapper.juso_list(userid));
			
			return "/member/juso_list";
		}
	}

	@Override
	public String juso_delete(HttpServletRequest request, HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		String[] id=request.getParameter("id").split(",");
		for(int i=0;i<id.length;i++) {
			String imsi = membermapper.juso_gibonsearch(userid) +"";
			if(!imsi.equals(id[i]))
			membermapper.juso_delete(id[i]);
		}
		return "redirect:/member/juso_list";
		
	}

	@Override
	public String juso_gibon(HttpServletRequest request, HttpSession session) {
		String id=request.getParameter("id");

		String userid = session.getAttribute("userid").toString();
		membermapper.juso_gibonoff(membermapper.juso_gibonsearch(userid));
		membermapper.juso_gibon(id);
		return "redirect:/member/juso_list";
	}

}
