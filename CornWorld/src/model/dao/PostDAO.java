package model.dao;

import model.Post;
 
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * �Խù� ������ ���� �����ͺ��̽� �۾��� �����ϴ� DAO Ŭ����
 * Post ���̺� �Խ� ������ �߰�, ����, ����, �˻� ���� 
 */
public class PostDAO {
   private JDBCUtil jdbcUtil = null;
   
   public PostDAO() {         
      jdbcUtil = new JDBCUtil();   // JDBCUtil ��ü ����
   }
   
   /**
    * �Խù� ���� ���̺� ���ο� �Խù� ����.
    */
   public int create(Post post) throws SQLException {
      String sql = "INSERT INTO POST VALUES (post_seq.nextval, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), (TRUNC(TO_DATE(?,'YYYY-MM-DD') - SYSDATE)), ?, ?, ?)";      
      Object[] param = new Object[] {post.getPname(), post.getPrice(),  post.getExpiry(), post.getExpiry(), post.getCategory(), post.getShop(), post.getUserid()};         
      //jdbcUtil.setSql(sql);   // JDBCUtil �� insert���� �Ű� ���� ����
      jdbcUtil.setSqlAndParameters(sql, param);
      try {            
         int result = jdbcUtil.executeUpdate();   // insert �� ����
         return result;
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      } finally {      
         jdbcUtil.commit();
         jdbcUtil.close();   // resource ��ȯ
      }      
      return 0;         
   }

   /**
    * ������ �Խù� ������ ����.
    */
   public int update(Post post) throws SQLException {
      String sql = "UPDATE Post SET pname=?, price=?, expiry=?, period=(TRUNC(TO_DATE(?,'YYYY-MM-DD') - SYSDATE)), category=?, shop=?, userid=? WHERE postId=? ";
      Object[] param = new Object[] {post.getPname(), post.getPrice(),  post.getExpiry(), post.getExpiry(), post.getCategory(), post.getShop(), post.getUserid(), post.getPostId()};            
      jdbcUtil.setSqlAndParameters(sql, param);   // JDBCUtil�� update���� �Ű� ���� ����
         
      try {            
         int result = jdbcUtil.executeUpdate();   // update �� ����
         return result;
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      }
      finally {
         jdbcUtil.commit();
         jdbcUtil.close();   // resource ��ȯ
      }      
      return 0;
   }

   /**
    * Post ID�� �ش��ϴ� �Խù��� ����.
    */
   public int remove(int postId) throws SQLException {
      String sql = "DELETE FROM POST WHERE postid=?";      
      jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});   // JDBCUtil�� delete���� �Ű� ���� ����

      try {            
         int result = jdbcUtil.executeUpdate();   // delete �� ����
         return result;
      } catch (Exception ex) {
         jdbcUtil.rollback();
         ex.printStackTrace();
      }
      finally {
         jdbcUtil.commit();
         jdbcUtil.close();   // resource ��ȯ
      }      
      return 0;
   }


   /**
    * �־��� Post ID�� �ش��ϴ� �Խù� ������ �����ͺ��̽����� ã�� Post ������ Ŭ������ 
    * �����Ͽ� ��ȯ.
    */
   public Post findPost(int postId) throws SQLException {
        String sql = "SELECT pname, price, expiry, period, category, shop, userid FROM POST WHERE postId=? ";              
      jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});   // JDBCUtil�� query���� �Ű� ���� ����

      try {
         ResultSet rs = jdbcUtil.executeQuery();      // query ����
         if (rs.next()) {    // �Խù� ���� �߰�
        	 Post post = new Post(      // Post ��ü�� �����Ͽ� �Խù� ������ ����
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
         jdbcUtil.close();      // resource ��ȯ
      }
      return null;
   }
   
   /**
    * ��ü �Խù� ������ �˻��Ͽ� List�� ���� �� ��ȯ
    */
   public List<Post> findPostList() throws SQLException {
        String sql = "SELECT postId, pname, price, expiry, period, category, shop, userid FROM Post ORDER BY postId DESC";
      jdbcUtil.setSqlAndParameters(sql, null);      // JDBCUtil�� query�� ����
               
      try {
         ResultSet rs = jdbcUtil.executeQuery();         // query ����         
         List<Post> postList = new ArrayList<Post>();   // Post���� ����Ʈ ����
         while (rs.next()) {
            Post post = new Post(         // Post ��ü�� �����Ͽ� ���� ���� ������ ����
               rs.getInt("postId"),
               rs.getString("pname"),
               rs.getInt("price"),
               rs.getString("expiry"),
               rs.getInt("period"),
               rs.getString("category"),
               rs.getString("shop"),
               rs.getString("userid"));
            postList.add(post);            // List�� Post ��ü ����
         }      
         return postList;               
         
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close();      // resource ��ȯ
      }
      return null;
   }
   
   /**
    * �־��� �Խù� ID�� �ش��ϴ� �Խù��� �����ϴ��� �˻� 
    */
   public boolean existingPost(int postId) throws SQLException {
      String sql = "SELECT count(*) FROM POST WHERE postid=?";      
      jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});   // JDBCUtil�� query���� �Ű� ���� ����

      try {
         ResultSet rs = jdbcUtil.executeQuery();      // query ����
         if (rs.next()) {
            int count = rs.getInt(1);
            return (count == 1 ? true : false);
         }
      } catch (Exception ex) {
         ex.printStackTrace();
      } finally {
         jdbcUtil.close();      // resource ��ȯ
      }
      return false;
   }

}