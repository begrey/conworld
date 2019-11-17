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
          // GET request: �Խù� ���� form ��û   
          PostManager manager = PostManager.getInstance();
         Post post = manager.findPost(postId);   // �����Ϸ��� Ŀ�´�Ƽ ���� �˻�
         request.setAttribute("post", post);         
         
         return "/posts/updateForm.jsp";   // �˻��� ������ update form���� ����     
      }   
      HttpSession session = request.getSession();
      String userId = (String)session.getAttribute(UserSessionUtils.USER_SESSION_KEY);
      
       // POST request (Ŀ�´�Ƽ ������ parameter�� ���۵�)
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