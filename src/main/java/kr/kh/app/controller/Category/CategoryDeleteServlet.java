package kr.kh.app.controller.Category;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/category/delete")
public class CategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼에서 전송된 카테고리 목록을 읽어옴
        String[] categories = request.getParameterValues("category");
        
        // 카테고리 목록을 리스트로 변환
        List<String> categoryList = new ArrayList<>();
        
        if (categories != null) {
            for (String category : categories) {
                categoryList.add(category);
            }
        }
	
        response.sendRedirect(request.getContextPath() + "/category");
        
	}

}
