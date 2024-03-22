package kr.kh.app.controller.category;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.CategoryService;
import kr.kh.app.service.CategoryServiceImp;


@WebServlet("/category/update")
public class CategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService = new CategoryServiceImp();

	
	protected void doPost(HttpServletRequest request, 
		HttpServletResponse response) throws ServletException, IOException {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		
		if(!"admin".equals(user.getMe_id())) {
			return;
		}
		//화면에서 보낸 카테고리 번호를 가져옴
		String caOriName = request.getParameter("caName");
		String caNewName = request.getParameter("content");
		
		boolean res = categoryService.updateCategory(caOriName,caNewName);
		
		response.getWriter().write(""+res);
	}

}
