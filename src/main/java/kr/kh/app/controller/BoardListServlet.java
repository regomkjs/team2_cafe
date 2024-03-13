package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/board/list")
@MultipartConfig
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = postService.getCategoryList();
		ArrayList<BoardVO> boardList = postService.getBoardList();
		
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("boardList", boardList);
		
		ArrayList<HeadVO> headList = postService.getHeadList();
		request.setAttribute("headList", headList);
		
		//말머리 추가
		
		String inputHead = request.getParameter("inputHead");
		String selectHead = request.getParameter("selectHead"); //he_num
		String updateHead = request.getParameter("updateHead");
		String deleteHead = request.getParameter("deleteHead");
		
		if(postService.manageHead(inputHead, selectHead, updateHead, deleteHead)) {
			response.sendRedirect(request.getContextPath() + "/board/list");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
}
