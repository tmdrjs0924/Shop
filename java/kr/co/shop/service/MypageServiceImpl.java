package kr.co.shop.service;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.MypageMapper;
import kr.co.shop.mapper.ProductMapper;
import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.OrderVo;
import kr.co.shop.vo.ProductVo;
import kr.co.shop.vo.ReviewVo;

@Service
@Qualifier("cm")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageMapper mapper;
	
	@Override
	public void counsel_input(HttpSession session, CounselVo cvo, PrintWriter out, Model model) {
		if(session.getAttribute("userid")==null)
			out.print("0");
		else {
			String userid=session.getAttribute("userid").toString();
			cvo.setUserid(userid);
			mapper.counsel_input(cvo);
			out.print("1");
		}
	}
	
	@Override
	public String order_history(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "redirect:/member/login?chk=9";
		else {
			String userid=session.getAttribute("userid").toString();
			String orderNumber="";
			
			ArrayList<OrderVo> olist=mapper.orderInfo(userid, orderNumber);
			for(int i=0;i<olist.size();i++) {
				String[] code=olist.get(i).getOrderCode().split(",");
				String[] amount=olist.get(i).getOrderAmount().split(",");
				String[] size=olist.get(i).getOrderSize().split(",");
				String[] orderPnumber=olist.get(i).getOrderPnumber().split(",");
				
				ArrayList<ProductVo> plist=new ArrayList<ProductVo>();
				for(int j=0;j<code.length;j++) {
					ProductVo pvo=new ProductVo();
					pvo=mapper.productInfo(code[j]);
					pvo.setAmount(amount[j]);
					pvo.setpSize(size[j]);
					int rchk=mapper.check_review(olist.get(i).getId(), orderPnumber[j]);
					pvo.setRchk(rchk);
					
					plist.add(pvo);
				}
				olist.get(i).setPlist(plist);
			}
			
			model.addAttribute("olist", olist);
			
			return "/mypage/order_history";
		}
	}
	
	@Override
	public String order_detail(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "../member/login?chk=9";
		else {
			String userid=session.getAttribute("userid").toString();
			String orderNumber=request.getParameter("orderNumber");
			
			ArrayList<OrderVo> olist=mapper.orderInfo(userid, orderNumber);
			for(int i=0;i<olist.size();i++) {
				String[] code=olist.get(i).getOrderCode().split(",");
				String[] amount=olist.get(i).getOrderAmount().split(",");
				String[] size=olist.get(i).getOrderSize().split(",");
				
				int originPrice=0;
				int originDc=0;
				for(int j=0;j<code.length;j++) {
					int price=mapper.productInfo(code[j]).getpPrice();
					int dc=mapper.productInfo(code[j]).getpDc();
					originPrice=originPrice+price*Integer.parseInt(amount[j]);
					originDc=originDc+(price*dc/100)*Integer.parseInt(amount[j]);
				}
				olist.get(i).setOriginPrice(originPrice);
				olist.get(i).setOriginDc(originDc);
				
				ArrayList<ProductVo> plist=new ArrayList<ProductVo>();
				for(int j=0;j<code.length;j++) {
					ProductVo pvo=new ProductVo();
					pvo=mapper.productInfo(code[j]);
					pvo.setAmount(amount[j]);
					pvo.setpSize(size[j]);
					
					plist.add(pvo);
				}
				olist.get(i).setPlist(plist);
			}
			model.addAttribute("olist", olist);
			
			return "/mypage/order_detail";
		}
	}
	
	@Override
	public String state_change(HttpServletRequest request) {
		String id=request.getParameter("id");
		String orderState=request.getParameter("orderState");
		mapper.state_change(orderState, id);
		
		return "redirect:/mypage/order_history";
	}
	
	@Override
	public String review(HttpServletRequest request, ProductVo pvo, Model model) {
		model.addAttribute("index", request.getParameter("index"));
		model.addAttribute("orderId", request.getParameter("id"));
		model.addAttribute("pvo", pvo);
		return "/mypage/review";
	}
	
	@Override
	public String review_ok(HttpServletRequest request, HttpSession session, ReviewVo rvo) throws Exception {
		String path=request.getRealPath("/resources/upload");
		String userid=session.getAttribute("userid").toString();
		String image="", pCode="", content="";
		int index=0, star=0, orderId=0;
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(0);
		
		ServletFileUpload upload=new ServletFileUpload(factory);
		upload.setFileSizeMax(1024*1024*10);
		
		try {
			List<FileItem> items=upload.parseRequest(request);
			for (FileItem item:items) {
				if (!item.isFormField()) {
					if(item.getSize()==0) {
						continue;
					}
					String fileName=item.getName();
					String newName="";
                    File filePath=new File(path+"/"+fileName);
                    int n=1;
                    while(filePath.exists()) {
                    	newName=fileName.replace(".", n+".");
                    	filePath=new File(path+"/"+newName);
                    	n++;
                    }
                    item.write(filePath);
                    int len=filePath.toString().lastIndexOf("\\");
                    image=image+filePath.toString().substring(len+1)+",";
				}
				else {
					String name=item.getFieldName();
					String value=item.getString("UTF-8");
					if(name.equals("orderId")) {
						orderId=Integer.parseInt(value);
					}
 					if(name.equals("star")) {
						star=Integer.parseInt(value);
					}
					if(name.equals("pCode")) {
						pCode=value;
					}
					if(name.equals("content")) {
						content=value;
					}
					if(name.equals("index")) {
						index=Integer.parseInt(value);
					}
				}
			}
		}
		catch(FileUploadException e) {
			e.printStackTrace();
		}
		String[] orderPnumber=mapper.before_review(orderId).split(",");
		String Pnumber=orderPnumber[index];
		
		rvo.setUserid(userid);
		rvo.setContent(content);
		rvo.setImage(image);
		rvo.setStar(star);
		rvo.setpCode(pCode);
		rvo.setOrderId(orderId);
		rvo.setPnumber(Pnumber);
		mapper.review_ok(rvo);
		
		return "redirect:/mypage/order_history";
	}
	
	@Override
	public String review_history(HttpServletRequest request, HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		
		int page, index, rnum, pstart, pend, total;
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
		total=mapper.reviewTotal(rnum, userid);
		if(pend>total)
			pend=total;

		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		
		ArrayList<ReviewVo> rlist=mapper.review_history(userid, index, rnum);
		for(int i=0;i<rlist.size();i++) {
			rlist.get(i).setpName(mapper.productInfo(rlist.get(i).getpCode()).getpName());
			rlist.get(i).setImages(rlist.get(i).getImage().split(","));
			rlist.get(i).setContent(rlist.get(i).getContent().replace("\r\n", "<br>"));
		}
		model.addAttribute("rlist", rlist);
		
		return "/mypage/review_history";
	}
	
	@Override
	public String qna_history(HttpServletRequest request, HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();

		int page, index, rnum, pstart, pend, total;
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
		total=mapper.qnaTotal(rnum, userid);
		if(pend>total)
			pend=total;

		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		
		ArrayList<CounselVo> qlist=mapper.qna_history(userid, index, rnum);
		for(int i=0;i<qlist.size();i++) {
			qlist.get(i).setContent(qlist.get(i).getContent().replace("\r\n", "<br>"));
		}
		model.addAttribute("qlist", qlist);
		
		return "/mypage/qna_history";
	}
}
