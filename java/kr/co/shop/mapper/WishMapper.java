package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.CartVo;
import kr.co.shop.vo.WishVo;

public interface WishMapper {
	
	public ArrayList<WishVo> wish_view(String userid);
	public void wish_del(String id);
	public void add_cart(String pCode,String userid);
	public ArrayList<CartVo> cartview(String userid);
	public int cart_check(String pCode,String userid);
	public void cart_up(String pCode,String userid);
}
