package kr.kh.app.controller.Category;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/category/insert")
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카테고리 리스트를 불러옴
		String[]categories = request.getParameterValues("category");
		
		//카테고리ㅣ 목록을 리스트로 변환
		List<String> categoryList = new ArrayList<>();
			
		  if (categories != null) {
	            for (String category : categories) {
	                categoryList.add(category);
	            }
	        }
		  
		  // 추가한 후에 다시 카테고리 페이지로 리다이렉트
	        response.sendRedirect(request.getContextPath() + "/category");
	
	}

}
