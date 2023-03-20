package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.OrderVo;
import kr.co.shop.vo.ProductVo;
import kr.co.shop.vo.ReviewVo;

public interface MypageMapper {
	public void counsel_input(CounselVo cvo);
	public ArrayList<OrderVo> orderInfo(String userid, String orderNumber);
	public ProductVo productInfo(String pCode);
	public void state_change(String orderState, String id);
	public String before_review(int id);
	public void review_ok(ReviewVo rvo);
	public int check_review(int id, String Pnumber);
	public ArrayList<ReviewVo> review_history(String userid, int index, int rnum);
	public ArrayList<CounselVo> qna_history(String userid, int index, int rnum);
	public int reviewTotal(int rnum, String userid);
	public int qnaTotal(int rnum, String userid);
}
