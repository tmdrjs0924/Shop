package kr.co.shop.controller;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.AdminService;
import kr.co.shop.vo.BoardVo;
import kr.co.shop.vo.Cate1Vo;
import kr.co.shop.vo.Cate2Vo;
import kr.co.shop.vo.Cate3Vo;
import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.Criteria;
import kr.co.shop.vo.MemberVo;
import kr.co.shop.vo.ProductVo;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	//카테고리 페이지
	@RequestMapping("/admin/category")
	public String category(Model model) {
		return service.category(model);
	}
	
	//상품목록 페이지
	@RequestMapping("/admin/productList")
	public String productList(Criteria cri, Model model) {
		return service.productList(cri, model);
	}
	
	//상품등록페이지
	@RequestMapping("/admin/product")
	public String product(Model model) {
		return service.product(model);
	}
	
	//상품등록실행
	@RequestMapping("/admin/productInsertAction")
	public String productInsertAction(HttpServletRequest request) throws Exception {
		return service.productInsertAction(request);
	}
	
	//상품 정보 
	@GetMapping("/admin/productDetail")
	public String productDetail(HttpServletRequest request, Model model) {
		return service.productDetail(request,model);
	}
	
	@RequestMapping("/admin/productModify")
	public String productModify(HttpServletRequest request, ProductVo pvo) throws Exception {
		return service.productModify(request, pvo);
	}
	//상품삭제
	@RequestMapping("/admin/productDelete")
	public String productDelete(HttpServletRequest request) {
		return service.productDelete(request);
	}
	
	//판매함
	@RequestMapping("/admin/productOn")
	public String productOn(HttpServletRequest request) {
		return service.productOn(request);
	}
	//판매중지
	@RequestMapping("/admin/productOff")
	public String productOff(HttpServletRequest request) {
		return service.productOff(request);
	}
	
	//중분류 가져오기
	@RequestMapping("/admin/getcate2")
	public void getCate2(HttpServletRequest request, PrintWriter out) {
		service.getCate2(request, out);
	}
	
	//소분류 가져오기
	@RequestMapping("/admin/getcate3")
	public void getCate3(HttpServletRequest request, PrintWriter out) {
		service.getCate3(request, out);
	}
	//상품코드
	@RequestMapping("/admin/getpcode")
	public void getPcode(HttpServletRequest request, PrintWriter out) {
		service.getPcode(request, out);
	}
	
	//대분류 등록
	@RequestMapping("/admin/cate1_insert")
	public String cate1_insert(Cate1Vo c1vo) {
		return service.cate1_insert(c1vo);
	}
	
	//중분류 등록
	@RequestMapping("/admin/cate2_insert")
	public String cate2_insert(Cate2Vo c2vo) {
		return service.cate2_insert(c2vo);
	}
	
	//소분류 등록
	@RequestMapping("/admin/cate3_insert")
	public String cate3_insert(Cate3Vo c3vo) {
		return service.cate3_insert(c3vo);
	}
	
	//관리자홈
	@RequestMapping("/admin/main")
	public String main(Model model, Criteria cri) {
		return service.main(model,cri);
	}
	
	//주문리스트
	@RequestMapping("/admin/orderList")
	public String orderList(Model model,Criteria cri) {
		return service.orderList(model, cri);
	}
		
	//주문상태 변경
	@RequestMapping("/admin/orderModify")
	public String orderModify(HttpServletRequest request) {
		return service.orderModify(request);
	}
	
	//게시판관리
	@RequestMapping("/admin/board")
	public String board(Model model) {
		return service.board(model);
	}
	
	//게시글 목록
	@RequestMapping("/admin/boardList")
	public String boardList(Model model, Criteria cri) {
		return service.boardList(model, cri);
	}
	
	//게시글 답변
	@RequestMapping("/admin/boardAction")
	public String boardAction(BoardVo bvo) {
		return service.boardAction(bvo);
	}
	
	//게시글 삭제
	@RequestMapping("/admin/boardDelete") 
	public String boardDelete(HttpServletRequest request) {
		return service.boardDelete(request);
	}
	
	//1대1문의 목록
	@RequestMapping("/admin/counselList")
	public String counselList(Model model, Criteria cri) {
		return service.counselList(model,cri);
	}
	
	//1대1 답변
	@RequestMapping("/admin/counselAction")
	public String counselAction(CounselVo cvo) {
		return service.counselAction(cvo);
	}
	
	//1대1ㅣ삭제
	@RequestMapping("/admin/counselDelete") 
	public String counselDelete(HttpServletRequest request) {
		return service.counselDelete(request);
	}
	
	//회원리스트
	@RequestMapping("/admin/memberList")
	public String memberList(Model model, Criteria cri) {
		return service.memberList(model, cri);
	}
	
	//회원탈퇴 승인
	@RequestMapping("/admin/memberDelete")
	public String memberDelete(HttpServletRequest request) {
		return service.memberDelete(request);
	}
	
	//진열관리
	@RequestMapping("/admin/exhibition")
	public String exhibition(Model model,Criteria cri) {
		return service.exhibition(model,cri);
	}
	
	@RequestMapping("/admin/exhibition2")
	public String exhibition2(Model model,Criteria cri) {
		return service.exhibition2(model,cri);
	}
	
	//진열상태 변경
	@RequestMapping("/admin/changeShow")
	public String changeShow(HttpServletRequest request) {
		return service.changeShow(request);
	}
	
	//회원상세정보
	@RequestMapping("/admin/memberDetail")
	public String memberDetail(HttpServletRequest request, Model model) {
		return service.memberDetail(request,model);
	}
	
	//회원정보 수정
	@RequestMapping("/admin/memberUpdate")
	public String memberUpdate(MemberVo mvo) {
		return service.memberUpdate(mvo);
	}
	
}
