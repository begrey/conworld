package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Post;
import model.User;
import model.service.PostManager;
import model.service.UserManager;

public class ViewPostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Post post = null;
		PostManager pmanager = PostManager.getInstance();
		
		User user = null;
		UserManager umanager = UserManager.getInstance();

		int postId = Integer.parseInt(request.getParameter("postId"));
		post = pmanager.findPost(postId);		// �Խ� ���� �˻�	
		
		String userid = post.getUserid();
		user = umanager.findUser(userid);
		request.setAttribute("user", user);
		
		request.setAttribute("post", post);	// �Խù� ���� ����				
		return "/posts/view.jsp";				// �Խù� ���� ȭ������ �̵�
	}

}