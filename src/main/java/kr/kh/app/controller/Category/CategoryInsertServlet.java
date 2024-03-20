package kr.kh.app.controller.Category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CategoryVO;
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
		request.getRequestDispatcher("/WEB-INF/views/admin/categoryinsert.jsp").forward(request, response);
      
		String categoryName= request.getParameter("category");
		CategoryVO category = new CategoryVO(categoryName);
		
		
	}

}
