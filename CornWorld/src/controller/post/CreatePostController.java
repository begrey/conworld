package controller.post;

import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Post;
import model.service.PostManager;

public class CreatePostController implements Controller {
   private static final Logger log = LoggerFactory.getLogger(CreatePostController.class);
   
   @Override 
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      //SimpleDateFormat fmt = new SimpleDateFormat("YYYY-MM-DD"); 
      //java.util.Date mydate = (java.util.Date) fmt.parse(request.getParameter("expiry")); //
      HttpSession session = request.getSession();
      String userId = (String)session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
      System.out.println(userId);
      String i = request.getParameter("price");
      int price = Integer.parseInt(i);
      Post post = new Post(
             1, request.getParameter("pname"),
            price,
            request.getParameter("expiry"),
            0,
            request.getParameter("menu1"),
            request.getParameter("menu2"),
            userId);      
           
         try {
            PostManager manager = PostManager.getInstance();
            manager.createPost(post);
            
             log.debug("Create Post : {}", post);
              return "redirect:/posts/list";   // 성공 시 커뮤니티 리스트 화면으로 redirect
              
         } catch (Exception e) {      // 예외 발생 시 입력 form으로 forwarding
               request.setAttribute("creationFailed", true);
            request.setAttribute("exception", e);
            request.setAttribute("post", post);
            return "/posts/createForm.jsp";
         }
       }
}