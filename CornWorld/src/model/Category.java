package model;

import java.util.List;

/**
 * 카테고리 관리를 위해 필요한 도메인 클래스. Categories 테이블과 대응됨
 */

public class Category {
	private int cateId;
	private String catename;
	private List<Category>categoryList;
	
	public Category() { }		// 기본 생성자
	
	public Category(int cateId, String catename) {
		super();
		this.cateId = cateId;
		this.catename = catename;
	}

	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}

	public String getCatename() {
		return catename;
	}

	public void setCatename(String catename) {
		this.catename = catename;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	@Override
	public String toString() {
		return "Category [cateId=" + cateId + ", catename=" + catename + "]";
	}
}
