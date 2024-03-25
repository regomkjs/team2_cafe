package kr.kh.app.controller.category;

import java.io.IOException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.CategoryService;
import kr.kh.app.service.CategoryServiceImp;


@WebServlet("/category/insert")
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CategoryService categoryService = new CategoryServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카테고리 리스트를 가져옴
		ArrayList<CategoryVO> categoryList = categoryService.selectCategory();
		
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/WEB-INF/views/admin/page.jsp").forward(request, response);
      
		
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카테고리 리스트를 추가
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		
		if (!"admin".equals(user.getMe_id())) {
			return;
		}
		//화면에서 보낸 카테고리를 가져옴
		String ca_name = request.getParameter("category");
		
		CategoryVO category = new CategoryVO(ca_name);
		
		boolean res = categoryService.insertCategory(ca_name);
		
		if (res) {
			request.setAttribute("msg", "카테고리를 추가했습니다.");
			request.setAttribute("url", "admin/page");
		} else {
			request.setAttribute("msg", "카테고리를 삭제하지못했습니다.");
			request.setAttribute("url", "admin/page?ca_name"+ ca_name);
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);


	}
}
