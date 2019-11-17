package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Post;
import model.dao.PostDAO;

public class PostManager {
   private static PostManager postMan = new PostManager();
   private PostDAO postDAO;

   private PostManager() {
      try {
         postDAO = new PostDAO();
      } catch (Exception e) {
         e.printStackTrace();
      }         
   }
   
   public static PostManager getInstance() {
      return postMan;
   }
   
   public int createPost(Post post) throws SQLException {
      return postDAO.create(post);      
   }

   public int updatePost(Post post) throws SQLException {
      return postDAO.update(post);            
   }
   
   public int removePost(int postId) throws SQLException {
	   return postDAO.remove(postId);
	   
   }
   
   public Post findPost(int postId) throws SQLException {
      Post post = postDAO.findPost(postId); 
      return post;
   }
   
   public List<Post> findPostList() throws SQLException {
      return postDAO.findPostList();
   } 
   
   public PostDAO getPostDAO() {
      return this.postDAO;
   }
}