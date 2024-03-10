package kr.kh.app.controller.Category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/category/insert")
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카테고리 리스트를 불러옴
		
		ArrayList<CategoryVO> categoryList = postService.getCommunityList();
			
		  if (categoryList == null) {
	          response.sendRedirect(request.getContextPath()+"/category/list");
	        }
		  if(postService.insertPost(ca_name)) {
			  response.sendRedirect(request.getContextPath()+"/category");
		  }else {
			  response.sendRedirect(request.getContextPath()+"/sidebar");
		  }
		  	
		  
		  // 추가한 후에 다시 카테고리 페이지로 리다이렉트
	       response.sendRedirect(request.getContextPath() + "/category");
	       
	}

}
