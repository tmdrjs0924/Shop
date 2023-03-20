package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.CartVo;

public interface CartMapper {
	public void add_cart(CartVo cvo);
	public ArrayList<CartVo> cart(String userid);
	public String getDay(String pCode);
	public void update_amount(String amount, String id);
	public CartVo change_size(String id, String userid);
	public void change_size_ok(String size, String id);
	public void delete_cart(String id);
}
