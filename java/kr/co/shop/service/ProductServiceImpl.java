package kr.co.shop.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.cookie;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mysql.fabric.xmlrpc.base.Array;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.shop.mapper.ProductMapper;
import kr.co.shop.vo.BoardVo;
import kr.co.shop.vo.ProductVo;
import kr.co.shop.vo.ReviewVo;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	@Override
	public String list(HttpServletRequest request, Model model, HttpSession session) {
		String pCode="";
		if(request.getParameter("pCode")!=null)
			pCode=request.getParameter("pCode");
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("userid", userid);
			model.addAttribute("wchk", mapper.wish_check(userid));
			model.addAttribute("cchk", mapper.cart_check(userid));
		}
		int page, index, rnum, pstart, pend, total;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		total=mapper.listTotal(rnum, pCode);
		if(pend>total)
			pend=total;

		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("pCode", pCode);
		model.addAttribute("list", mapper.list(pCode, index, rnum));
		
		return "/product/list";
	}
	
	@Override
	public String display_list(HttpServletRequest request, Model model, HttpSession session) {
		int pShow=Integer.parseInt(request.getParameter("pShow"));
		String pCode="";
		if(request.getParameter("pCode")!=null)
			pCode=request.getParameter("pCode");
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("userid", userid);
			model.addAttribute("wchk", mapper.wish_check(userid));
			model.addAttribute("cchk", mapper.cart_check(userid));
		}
		
		int page, index, rnum, pstart, pend, total;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		total=mapper.displayTotal(rnum, pShow, pCode);
		if(pend>total)
			pend=total;

		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("pShow", pShow);
		model.addAttribute("pCode", pCode);
		model.addAttribute("display_list", mapper.display_list(pCode, pShow, index, rnum));
		
		return "/product/display_list";
	}
	
	@Override
	public String dc_list(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("userid", userid);
			model.addAttribute("wchk", mapper.wish_check(userid));
			model.addAttribute("cchk", mapper.cart_check(userid));
		}
		
		int page, index, rnum, pstart, pend, total;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		total=mapper.dcTotal(rnum);
		if(pend>total)
			pend=total;
		
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("dc_list", mapper.dc_list(index, rnum));
		
		return "/product/dc_list";
	}
	
	@Override
	public void cart_add2(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String pCode=request.getParameter("pCode");
		if(session.getAttribute("userid")==null) {
			out.print("2");
		}
		else {
			String userid=session.getAttribute("userid").toString();
			boolean cchk=mapper.getCart(pCode, userid);
			if(cchk==true)
				out.print("1");
			else {
				String size=mapper.getSize(pCode).split(",")[0];
				mapper.cart_add2(pCode, userid, size);
				out.print("0");
			}
		}
	}
	
	@Override
	public void wish_add2(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String pCode=request.getParameter("pCode");
		if(session.getAttribute("userid")==null) {
			out.print("2");
		}
		else {
			String userid=session.getAttribute("userid").toString();
			boolean wchk=mapper.getWish(pCode, userid);
			if(wchk==true) {
				mapper.wish_del2(pCode, userid);
				out.print("1");
			}
			else {
				mapper.wish_add2(pCode, userid);
				out.print("0");
			}
		}
	}

	@Override
	public String content(HttpServletResponse response, HttpServletRequest request, Model model,HttpSession session) {
		String pCode = request.getParameter("pCode");
		ProductVo pvo = mapper.content(pCode);
		String[] pSize = pvo.getpSize().split(",");
		pvo.setpSize2(pSize);
		model.addAttribute("pvo", pvo);
		
		//쿠키생성
		Cookie cookie3=new Cookie("recent", pCode);
		cookie3.setMaxAge(600);
		response.addCookie(cookie3);
		
		//사용자로부터 쿠키를 읽어옴
		Cookie[] cookie=request.getCookies();

		//읽어 온 쿠키 중에 작업할 쿠키변수 => recent
		String recent="";
		for(int i=0;i<cookie.length;i++) {
		
			//Cookie[] 의 모든 값을 다 호출한 후 getName(), getValue() 출력
			//getName()이 recent인 쿠기의 getValue() 
			if(cookie[i].getName().equals("recent")) {
				recent=cookie[i].getValue();
			
				//현재 열람한 상품의 recent를 쿠키에 저장
				if(recent.indexOf(pCode)==-1) {	//현재 열람 중인 상품이 기존에 쿠키에 저장되어 있다면 추가x
					recent=recent+pCode+"/";
				}
				
				//하나의 상품을 추가했다면 => recent를 배열로 변경
				int len=recent.split("/").length;
				if(len>3) {	//상품이 4개가 됐을 때
					int n=recent.indexOf("/");
					recent=recent.substring(n+1);	//기존의 상품 + 현재 열람 중인 상품으로 3개 이하의 상품코드를 저장
				}
				
				//변경한 recent를 쿠키변수 recent에 저장
				Cookie cookie2=new Cookie("recent", recent);
				cookie2.setMaxAge(600);
				response.addCookie(cookie2);
			}
		}
		
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			int wcnt=mapper.getWish_w(pCode, userid);
			model.addAttribute("wcnt", wcnt);
			model.addAttribute("userid", userid);
		}
		
		//리뷰의 평균 별점
		int star=mapper.avgStar(pCode);
		model.addAttribute("star", star);
		//리뷰수
		int rcnt=mapper.countStar(pCode);
		model.addAttribute("rcnt", rcnt);
		
		int page, rnum, index, pstart, pend, chong;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=10;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		chong=mapper.getChong(rnum, pCode);
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		ArrayList<BoardVo> blist=mapper.blist(pCode, index, rnum);
		for(int i=0;i<blist.size();i++) {
			blist.get(i).setOrder(i);
		}
		
		for(int i=0;i<blist.size();i++) {
			blist.get(i).setUserid2(blist.get(i).getUserid().substring(0, 2)+"***");
		}
		String content="";
		for(int i=0;i<blist.size();i++) {
			content=blist.get(i).getContent().replace("\r\n", "<br>");
			blist.get(i).setContent(content);
		}
		String answer="";
		for(int i=0;i<blist.size();i++) {
			if(blist.get(i).getAnswer()!=null)
				answer=blist.get(i).getAnswer().replace("\r\n", "<br>");
			blist.get(i).setAnswer(answer);
		}
		model.addAttribute("blist", blist);
		
		int page2, index2, rnum2, pstart2, pend2, chong2;
		if(request.getParameter("page2")==null)
			page2=1;
		else
			page2=Integer.parseInt(request.getParameter("page2"));
		if(request.getParameter("rnum2")==null)
			rnum2=10;
		else
			rnum2=Integer.parseInt(request.getParameter("rnum2"));
		index2=(page2-1)*rnum2;
		pstart2=page2/5;
		if(page2%5==0)
			pstart2--;
		pstart2=pstart2*5+1;
		pend2=pstart2+4;
		chong2=mapper.getChong2(rnum2, pCode);
		if(pend2>chong2)
			pend2=chong2;
		
		model.addAttribute("page2", page2);
		model.addAttribute("rnum2", rnum2);
		model.addAttribute("pstart2", pstart2);
		model.addAttribute("pend2", pend2);
		model.addAttribute("chong2", chong2);
		
		ArrayList<ReviewVo> rlist=mapper.review_list(pCode, index2, rnum2);
		for(int i=0;i<rlist.size();i++) {
			rlist.get(i).setUserid(rlist.get(i).getUserid().substring(0,2)+"**");
			rlist.get(i).setImages(rlist.get(i).getImage().split(","));
			rlist.get(i).setContent(rlist.get(i).getContent().replace("\r\n", "<br>"));
			rlist.get(i).setpName(mapper.getProductqna(pCode).getpName());
		}
		model.addAttribute("rlist", rlist);
		
		String image="";
		ArrayList<ReviewVo> ilist=mapper.getImage(pCode);
		for(int i=0;i<ilist.size();i++) {
			image=image+ilist.get(i).getImage()+",";
		}
		String[] images=image.split(",");
		model.addAttribute("allimages", images);
		
		String image2="";
		ArrayList<ReviewVo> ilist2=mapper.getImage(pCode);
		for(int i=0;i<ilist2.size();i++) {
			image2=image2+ilist2.get(i).getImage()+",";
		}
		String[] images2=image2.split(",");
		model.addAttribute("title_img", images2);
		
		return "/product/content";
	}
	@Override
	public void wish_add(HttpServletRequest request, HttpSession session, PrintWriter out) {
		String pCode=request.getParameter("pCode");
		String userid=session.getAttribute("userid").toString();
		int ck=Integer.parseInt(request.getParameter("ck"));
		
		if(ck==1) {
			try {
				mapper.wish_del(pCode, userid);
				out.print("0");
			}
			catch(Exception e) {
				out.print("1");
			}
		} 
		else {
			try {
				mapper.wish_add(pCode, userid);
				out.print("0");
			}
			catch(Exception e) {
				out.print("1");
			}
		}
	}
	
	@Override
	public String main(HttpServletRequest request, HttpSession session, Model model) {
		String pCode="";
		if(request.getParameter("pCode")!=null)
			pCode=request.getParameter("pCode");
		
		model.addAttribute("new_list", mapper.mainList("p", "1"));
		model.addAttribute("best_list", mapper.mainList(pCode, "2"));
		
		return "/main/main";
	}
	
	@Override
	public String product_search(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("userid", userid);
			model.addAttribute("wchk", mapper.wish_check(userid));
			model.addAttribute("cchk", mapper.cart_check(userid));
		}

		
		String keyword="";
		if(request.getParameter("keyword")!=null)
			keyword=request.getParameter("keyword");
		String color="";
		if(request.getParameter("color")!=null)
			color=request.getParameter("color");
		String sprice="";
		if(request.getParameter("sprice")!=null)
			sprice=request.getParameter("sprice");
		String eprice="";
		if(request.getParameter("eprice")!=null)
			eprice=request.getParameter("eprice");
		
		int page, index, rnum, pstart, pend, total;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		total=mapper.search_total(rnum, keyword, color, sprice, eprice);
		if(pend>total)
			pend=total;

		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("keyword", keyword);
		model.addAttribute("color", color);
		model.addAttribute("sprice", sprice);
		model.addAttribute("eprice", eprice);
		model.addAttribute("search_list", mapper.search_list(keyword, color, sprice, eprice, index, rnum));

		return "/product/product_search";
	}
	
	@Override
	public String qna_write(HttpSession session, HttpServletRequest request, Model model) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login?chk=9";
		else {
			String pCode=request.getParameter("pCode");
			model.addAttribute("pvo", mapper.getProductqna(pCode));
			model.addAttribute("pCode", pCode);
			return "/product/qna_write";
		}
	}
	
	@Override
	public void qna_write_ok(BoardVo bvo, HttpServletRequest request, HttpSession session, PrintWriter out) {
		String userid=session.getAttribute("userid").toString();
		String pCode=request.getParameter("pCode");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int sort=Integer.parseInt(request.getParameter("sort"));
		int bimil=Integer.parseInt(request.getParameter("bimil"));
		bvo.setpCode(pCode);
		bvo.setUserid(userid);
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setSort(sort);
		bvo.setBimil(bimil);
		mapper.qna_write_ok(bvo);
	}
	
	@Override
	public String qna_update(HttpServletRequest request, Model model, BoardVo bvo) {
		String pCode=request.getParameter("pCode");
		BoardVo bvo2=mapper.qna_update(bvo);
		model.addAttribute("bvo", bvo2);
		model.addAttribute("pvo", mapper.getProductqna(pCode));
		
		return "/product/qna_update";
	}
	
	@Override
	public void qna_update_ok(HttpServletRequest request, BoardVo bvo) {
		int id=Integer.parseInt(request.getParameter("id"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int sort=Integer.parseInt(request.getParameter("sort"));
		int bimil=Integer.parseInt(request.getParameter("bimil"));
		
		bvo.setId(id);
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setSort(sort);
		bvo.setBimil(bimil);
		mapper.qna_update_ok(bvo);
	}
	
	@Override
	public void qna_delete(BoardVo bvo) {
		mapper.qna_delete(bvo);
	}
	
	@Override
	public void user_check2(HttpServletRequest request, HttpSession session, PrintWriter out) {
		try {
			if(session.getAttribute("userid")==null)
				out.print("2");
			else {
				String userid=session.getAttribute("userid").toString();
				String id=request.getParameter("id");
				
				int chk=mapper.user_check2(id, userid);
				if(chk==0)
					out.print("0");
				else
					out.print("1");
			}
		}
		catch(Exception e) {
		}
	}

	@Override
	public String view_recent(HttpServletRequest request, Model model) {
		String recent="";
		Cookie[] cookie=request.getCookies();
		for(int i=0;i<cookie.length;i++) {
			if(cookie[i].getName().equals("recent")) {
				recent=cookie[i].getValue();
			}
		}
		String[] recent2=recent.split("/");
		ArrayList<ProductVo> plist=new ArrayList<ProductVo>();
		for(int i=0;i<recent2.length;i++) {
			ProductVo pvo=new ProductVo();
			pvo=mapper.getProductqna(recent2[i]);
			plist.add(pvo);
		}
		model.addAttribute("plist", plist);
		
		return "/product/view_recent";
	}
}
