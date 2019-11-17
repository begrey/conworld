package model;

import java.util.List;

/**
 * ���� ������ ���� �ʿ��� ������ Ŭ����. Shop ���̺�� ������
 */

public class Shop {
	private int shopId;
	private String shopname;
	private List<Shop>shopList;
	
	public Shop() { }		// �⺻ ������
	
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
