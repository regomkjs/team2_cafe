package kr.kh.app.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/board/update")
public class UpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 카테고리 정보를 가져옴
		 List<Category> category = categoryService.getAllCategory(); // 카테고리 정보를 DB에서 가져오는 메서드
		 
		// JSP에 카테고리 정보 전달
        request.setAttribute("category", category);
        request.getRequestDispatcher("/WEB-INF/views/board/update.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 수정된 카테고리 정보를 처리하는 로직
        String categoryId = request.getParameter("categoryId");
        String categoryName = request.getParameter("categoryName");
        
        // DB에서 카테고리 정보 수정하는 메서드 호출
        categoryService.updateCategory(categoryId, categoryName);
        
        // 수정 후 결과 페이지로 이동
        //response.sendRedirect(request.getContextPath() + "/category/list"); // 수정 후 카테고리 목록 페이지로 이동
        request.getRequestDispatcher("/WEB-INF/views/board/update.jsp").forward(request, response);
	}

}
