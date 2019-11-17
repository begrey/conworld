package controller.post;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.PostManager;
import model.Post;

public class UpdatePostController implements Controller {
   private static final Logger log = LoggerFactory.getLogger(UpdatePostController.class);
   
   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

      int postId = Integer.parseInt(request.getParameter("postId"));
      //SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd"); 
      // Date mydate = (Date) fmt.parse(request.getParameter("expiry"));    
      if (request.getMethod().equals("GET")) {   
          // GET request: 게시물 수정 form 요청   
          PostManager manager = PostManager.getInstance();
         Post post = manager.findPost(postId);   // 수정하려는 커뮤니티 정보 검색
         request.setAttribute("post", post);         
         
         return "/posts/updateForm.jsp";   // 검색한 정보를 update form으로 전송     
      }   
      HttpSession session = request.getSession();
      String userId = (String)session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
      
       // POST request (커뮤니티 정보가 parameter로 전송됨)
      String i = request.getParameter("price");
      int price = Integer.parseInt(i);
      Post post = new Post(
             postId, 
             request.getParameter("pname"),
            price,
            request.getParameter("expiry"),
            0,
            request.getParameter("menu1"),
            request.getParameter("menu2"),
            userId);

         log.debug("Update Post : {}", post);

      PostManager manager = PostManager.getInstance();
      manager.updatePost(post);   
      
      return "redirect:/posts/list";         
   }
}