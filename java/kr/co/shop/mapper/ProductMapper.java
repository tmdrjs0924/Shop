package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.BoardVo;
import kr.co.shop.vo.ProductVo;
import kr.co.shop.vo.ReviewVo;

public interface ProductMapper {
	public ArrayList<ProductVo> list(String pCode, int index, int rnum);
	public ArrayList<ProductVo> display_list(String pCode, int pShow, int index, int rnum);
	public ArrayList<ProductVo> dc_list(int index, int rnum);
	public int listTotal(int rnum, String pCode);
	public int displayTotal(int rnum, int pShow, String pCode);
	public int dcTotal(int rnum);
	public ArrayList<ProductVo> mainList(String pCode, String pShow);
	public boolean getWish(String pCode, String userid);
	public boolean getCart(String pCode, String userid);
	public ProductVo content(String pCode);
	public void wish_add(String pCode,String userid);
	public void wish_del(String pCode,String userid);
	public int getWish_w(String pCode,String userid);
	public String getSize(String pCode);
	public void cart_add2(String pCode, String userid, String size);
	public void wish_add2(String pcode, String userid);
	public void wish_del2(String pcode, String userid);
	public ArrayList<String> wish_check(String userid);
	public ArrayList<String> cart_check(String userid);
	public ArrayList<ProductVo> search_list(String keyword, String color, String sprice, String eprice, int index, int rnum);
	public int search_total(int rnum, String keyword, String color, String sprice, String eprice);
	public void qna_write_ok(BoardVo bvo);
	public ArrayList<BoardVo> blist(String pCode, int index, int rnum);
	public BoardVo qna_update(BoardVo bvo);
	public void qna_update_ok(BoardVo bvo);
	public void qna_delete(BoardVo bvo);
	public int getChong(int rnum, String pCode);
	public int user_check2(String id, String userid);
	public ProductVo getProductqna(String pCode);
	public int avgStar(String pCode);
	public int countStar(String pCode);
	public ArrayList<ReviewVo> review_list(String pCode, int index, int rnum);
	public int getChong2(int rnum, String pCode);
	public ArrayList<ReviewVo> getImage(String pCode);
}
