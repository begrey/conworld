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
	    	// GET request: �Խù� ���� form ��û	
	    	PostManager manager = PostManager.getInstance();
			Post post = manager.findPost(postId);	// �����Ϸ��� �Խù� ���� �˻�
			request.setAttribute("post", post);			
			
			return "/posts/updateForm.jsp";   // �˻��� ������ update form���� ����     
		}	*/
	    	
	    // POST request (�Խù� ������ parameter�� ���۵�)
		PostManager manager = PostManager.getInstance();
        Post post = manager.findPost(postId);   // �����Ϸ��� Ŀ�´�Ƽ ���� �˻�
        request.setAttribute("post", post);
		
	   	log.debug("Delete Post : {}", post);
		manager.removePost(postId);	
		
		return "redirect:/posts/list";			
	}
}