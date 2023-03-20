package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.vo.BoardVo;
import kr.co.shop.vo.Cate1Vo;
import kr.co.shop.vo.Cate2Vo;
import kr.co.shop.vo.Cate3Vo;
import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.Criteria;
import kr.co.shop.vo.MemberVo;
import kr.co.shop.vo.ProductVo;

public interface AdminService {
	public String category(Model model);
	public String product(Model model);
	
	//카테고리 관련
	public void getCate2(HttpServletRequest request, PrintWriter out);
	public void getCate3(HttpServletRequest request, PrintWriter out);
	public String cate1_insert(Cate1Vo c1vo);
	public String cate2_insert(Cate2Vo c2vo);
	public String cate3_insert(Cate3Vo c3vo);
	
	//상품코드 관련
	public void getPcode(HttpServletRequest request, PrintWriter out);
	
	//상품 등록
	public String productInsertAction(HttpServletRequest request)throws Exception;
	
	//상품 목록
	public String productList(Criteria cri,Model model);
	
	//상품삭제
	public String productDelete(HttpServletRequest request);

	//판매중
	public String productOn(HttpServletRequest request);
	
	//판매중지
	public String productOff(HttpServletRequest request);
	
	//상품 정보
	public String productDetail(HttpServletRequest request, Model model);
	
	//상품 수정
	public String productModify(HttpServletRequest request, ProductVo pvo) throws Exception;
	
	//관리자홈
	public String main(Model model, Criteria cri);

	//주문리스트
	public String orderList(Model model, Criteria cri);
	
	//주문상태 변경
	public String orderModify(HttpServletRequest request);
	
	//게시판 관리
	public String board(Model model);
	
	//게시글 목록
	public String boardList(Model model, Criteria cri);
	
	//게시글 답변
	public String boardAction(BoardVo bvo);
	
	//게시글 삭제
	public String boardDelete(HttpServletRequest request);
	
	//1대1문의 목록
	public String counselList(Model model, Criteria cri);
	
	//1대1 답변
	public String counselAction(CounselVo cvo);
		
	//1대1 삭제
	public String counselDelete(HttpServletRequest request);
	
	//회원리스트
	public String memberList(Model model, Criteria cri);
	
	//회원탈퇴 승인
	public String memberDelete(HttpServletRequest request);
	
	//진열관리
	public String exhibition(Model model,Criteria cri);
	public String exhibition2(Model model,Criteria cri);
	
	//진열상태변경
	public String changeShow(HttpServletRequest request);
	
	//회원상세정보
	public String memberDetail(HttpServletRequest request, Model model);
	
	//회원정보 수정
	public String memberUpdate(MemberVo mvo);
}
