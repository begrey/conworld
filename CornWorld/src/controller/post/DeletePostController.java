package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.service.PostManager;
import model.Post;

public class DeletePostController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(UpdatePostController.class);
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int postId = Integer.parseInt(request.getParameter("postId"));
		/*if (request.getMethod().equals("GET")) {	
	    	// GET request: 게시물 수정 form 요청	
	    	PostManager manager = PostManager.getInstance();
			Post post = manager.findPost(postId);	// 수정하려는 게시물 정보 검색
			request.setAttribute("post", post);			
			
			return "/posts/updateForm.jsp";   // 검색한 정보를 update form으로 전송     
		}	*/
	    	
	    // POST request (게시물 정보가 parameter로 전송됨)
		PostManager manager = PostManager.getInstance();
        Post post = manager.findPost(postId);   // 수정하려는 커뮤니티 정보 검색
        request.setAttribute("post", post);
		
	   	log.debug("Delete Post : {}", post);
		manager.removePost(postId);	
		
		return "redirect:/posts/list";			
	}
}