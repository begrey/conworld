package model;

import java.util.List;

/**
 * 가게 관리를 위해 필요한 도메인 클래스. Shop 테이블과 대응됨
 */

public class Shop {
	private int shopId;
	private String shopname;
	private List<Shop>shopList;
	
	public Shop() { }		// 기본 생성자
	
	public Shop(int shopId, String shopname) {
		super();
		this.shopId = shopId;
		this.shopname = shopname;
	}
 
	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public List<Shop> getShopList() {
		return shopList;
	}

	public void setShopList(List<Shop> shopList) {
		this.shopList = shopList;
	}

	@Override
	public String toString() {
		return "Shop [shopId=" + shopId + ", shopname=" + shopname + "]";
	}

}
