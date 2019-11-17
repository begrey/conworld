package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.post.ListPostController;
import controller.post.ListPostInJsonController;
import controller.post.UpdatePostController;
import controller.post.ViewPostController;
import controller.post.ListPostInJsonController;
import controller.post.UpdatePostController;
import controller.post.CreatePostController;
import controller.post.DeletePostController;
import controller.post.ListPostController;
import controller.user.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // �� ��û uri�� ���� controller ��ü�� ������ HashMap ����
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// �� uri�� �����Ǵ� controller ��ü�� ���� �� ����
        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/list", new ListUserController());
        mappings.put("/user/view", new ViewUserController());
        mappings.put("/user/register/form", new ForwardController("/user/registerForm.jsp"));
        mappings.put("/user/register", new RegisterUserController());
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/update/form", new UpdateUserFormController());
        mappings.put("/user/delete", new DeleteUserController());
        mappings.put("/posts/list", new ListPostController());
        mappings.put("/posts/view", new ViewPostController());
        mappings.put("/posts/create/form", new ForwardController("/posts/createForm.jsp"));
        mappings.put("/posts/create", new CreatePostController());
        mappings.put("/posts/update/form", new UpdatePostController());
        mappings.put("/posts/update", new UpdatePostController());
        mappings.put("/posts/list/json", new ListPostInJsonController());
        mappings.put("/posts/delete", new DeletePostController());
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// �־��� uri�� �����Ǵ� controller ��ü�� ã�� ��ȯ
        return mappings.get(uri);
    }
}