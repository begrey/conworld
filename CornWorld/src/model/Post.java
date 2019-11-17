package model;


import java.util.List;

/**
 * 게시물 관리를 위해 필요한 도메인 클래스. Post 테이블과 대응됨
 */

public class Post {
   private int postId;
   private String pname;
   private int price;
   private String expiry;
   private int period;
   private String category;
   private String shop;
   private String userid;
   private List<Post> postList;

   
   
   
   
   
   public Post(int postId, String pname, int price, String expiry, int period, String category, String shop, String userid) {
      super();
      this.postId = postId;
      this.pname = pname;
      this.price = price;
      this.expiry = expiry;
      this.period = period;
      this.category = category;
      this.shop = shop;
      this.userid = userid;
   }


   public String getCategory() {
      return category;
   }


   public void setCategory(String category) {
      this.category = category;
   }


   public String getShop() {
      return shop;
   }


   public void setShop(String shop) {
      this.shop = shop;
   }


   public Post() { }      // 기본 생성자



   public String getPname() {
      return pname;
   }



   public void setPname(String pname) {
      this.pname = pname;
   }



   public int getPrice() {
      return price;
   }



   public void setPrice(int price) {
      this.price = price;
   }



   public String getExpiry() {
      return expiry;
   }



   public void setExpiry(String expiry) {
      this.expiry = expiry;
   }



   public List<Post> getPostList() {
      return postList;
   }



   public void setPostList(List<Post> postList) {
      this.postList = postList;
   }


   public int getPostId() {
      return postId;
   }

   public void setPostId(int postId) {
      this.postId = postId;
   }


   public int getPeriod() {
      return period;
   }


   public void setPeriod(int period) {
      this.period = period;
   }


   public String getUserid() {
	return userid;
}


public void setUserid(String userid) {
	this.userid = userid;
}


@Override
   public String toString() {
      return "Post [postId=" + postId + ", pname=" + pname + ", price=" + price + ", expiry=" + expiry + ", period="
            + period + ", category=" + category + ", shop=" + shop + ", userid=" + userid + ", postList=" + postList + "]";
   }






   

}