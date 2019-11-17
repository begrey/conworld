package model.dao;

import model.Post;
 
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 게시물 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * Post 테이블에 게시 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class PostDAO {
   private JDBCUtil jdbcUtil = null;
   
   public PostDAO() {         
      jdbcUtil = new JDBCUtil();   // JDBCUtil 객체 생성
   }
   
   /**
    * 게시물 관리 테이블에 새로운 게시물 생성.
    */
   public int create(Post post) throws SQLException {
      String sql = "INSERT INTO POST VALUES (post_seq.nextval, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), (TRUNC(TO_DATE(?,'YYYY-MM-DD') - SYSDATE)), ?, ?, ?)";      
      Object[] param = new Object[] {post.getPname(), post.getPrice(),  post.getExpiry(), post.getExpiry(), post.getCategory(), post.getShop(), post.getUserid()};         
      //jdbcUtil.setSql(sql);   // JDBCUtil 에 insert문과 매개 변수 설정
      jdbcUtil.setSqlAndParameters(sql, param);
      try {            
         int result = jdbcUtil.executeUpdate();   // insert 문 실행
         return result;
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      } finally {      
         jdbcUtil.commit();
         jdbcUtil.close();   // resource 반환
      }      
      return 0;         
   }

   /**
    * 기존의 게시물 정보를 수정.
    */
   public int update(Post post) throws SQLException {
      String sql = "UPDATE Post SET pname=?, price=?, expiry=?, period=(TRUNC(TO_DATE(?,'YYYY-MM-DD') - SYSDATE)), category=?, shop=?, userid=? WHERE postId=? ";
      Object[] param = new Object[] {post.getPname(), post.getPrice(),  post.getExpiry(), post.getExpiry(), post.getCategory(), post.getShop(), post.getUserid(), post.getPostId()};            
      jdbcUtil.setSqlAndParameters(sql, param);   // JDBCUtil에 update문과 매개 변수 설정
         
      try {            
         int result = jdbcUtil.executeUpdate();   // update 문 실행
         return result;
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      }
      finally {
         jdbcUtil.commit();
         jdbcUtil.close();   // resource 반환
      }      
      return 0;
   }

   /**
    * Post ID에 해당하는 게시물을 삭제.
    */
   public int remove(int postId) throws SQLException {
      String sql = "DELETE FROM POST WHERE postid=?";      
      jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});   // JDBCUtil에 delete문과 매개 변수 설정

      try {            
         int result = jdbcUtil.executeUpdate();   // delete 문 실행
         return result;
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      }
      finally {
         jdbcUtil.commit();
         jdbcUtil.close();   // resource 반환
      }      
      return 0;
   }


   /**
    * 주어진 Post ID에 해당하는 게시물 정보를 데이터베이스에서 찾아 Post 도메인 클래스에 
    * 저장하여 반환.
    */
   public Post findPost(int postId) throws SQLException {
        String sql = "SELECT pname, price, expiry, period, category, shop, userid FROM POST WHERE postId=? ";              
      jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});   // JDBCUtil에 query문과 매개 변수 설정

      try {
         ResultSet rs = jdbcUtil.executeQuery();      // query 실행
         if (rs.next()) {    // 게시물 정보 발견
        	 Post post = new Post(      // Post 객체를 생성하여 게시물 정보를 저장
               postId,
               rs.getString("pname"),
               rs.getInt("price"),
               rs.getString("expiry"),
               rs.getInt("period"),
               rs.getString("category"),
               rs.getString("shop"),
               rs.getString("userid"));
            return post;
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close();      // resource 반환
      }
      return null;
   }
   
   /**
    * 전체 게시물 정보를 검색하여 List에 저장 및 반환
    */
   public List<Post> findPostList() throws SQLException {
        String sql = "SELECT postId, pname, price, expiry, period, category, shop, userid FROM Post ORDER BY postId DESC";
      jdbcUtil.setSqlAndParameters(sql, null);      // JDBCUtil에 query문 설정
               
      try {
         ResultSet rs = jdbcUtil.executeQuery();         // query 실행         
         List<Post> postList = new ArrayList<Post>();   // Post들의 리스트 생성
         while (rs.next()) {
            Post post = new Post(         // Post 객체를 생성하여 현재 행의 정보를 저장
               rs.getInt("postId"),
               rs.getString("pname"),
               rs.getInt("price"),
               rs.getString("expiry"),
               rs.getInt("period"),
               rs.getString("category"),
               rs.getString("shop"),
               rs.getString("userid"));
            postList.add(post);            // List에 Post 객체 저장
         }      
         return postList;               
         
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close();      // resource 반환
      }
      return null;
   }
   
   /**
    * 주어진 게시물 ID에 해당하는 게시물이 존재하는지 검사 
    */
   public boolean existingPost(int postId) throws SQLException {
      String sql = "SELECT count(*) FROM POST WHERE postid=?";      
      jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});   // JDBCUtil에 query문과 매개 변수 설정

      try {
         ResultSet rs = jdbcUtil.executeQuery();      // query 실행
         if (rs.next()) {
            int count = rs.getInt(1);
            return (count == 1 ? true : false);
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close();      // resource 반환
      }
      return false;
   }

}