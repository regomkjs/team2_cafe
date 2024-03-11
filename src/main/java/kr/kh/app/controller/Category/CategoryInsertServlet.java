package kr.kh.app.controller.Category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/category/insert")
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//카테고리는 관리자만 추가 가능하기 때문에 아래 작업을 진행
		//로그인한 관리자 정보를 가져옴 => 세션에서 admin 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("admin");
		
		//회원정보가 없으면 메인으로 이동
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/");
			return;
		}
		
		//카테고리 리스트를 가져옴
		ArrayList<CategoryVO> categoryList = postService.getCategoryList();
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/WEB-INF/views/sidebar.jsp").forward(request, response);
		
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카테고리 리스트를 불러옴
	
	
		/*
		 * if (categoryList == null) {
		 * response.sendRedirect(request.getContextPath()+"/category/list"); }
		 * if(postService.insertCategory(categoryList)) {
		 * response.sendRedirect(request.getContextPath()+"/category"); }else {
		 * response.sendRedirect(request.getContextPath()+"/sidebar"); }
		 * 
		 * // 추가한 후에 다시 카테고리 페이지로 리다이렉트 response.sendRedirect(request.getContextPath() +
		 * "/category");
		 */
	       
	}

}
