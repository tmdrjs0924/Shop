package kr.co.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;


public class AdminInterceptor implements HandlerInterceptor {
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
		 
		HttpSession session = request.getSession();
        if(session.getAttribute("userid")==null || !session.getAttribute("userid").toString().equals("admin")  ) {    // 관리자 계정 아닌 경우
        	response.sendRedirect("../main/main");    // 메인페이지로 리다이렉트
            return false;
        }
        return true;    
		 
    }
}
