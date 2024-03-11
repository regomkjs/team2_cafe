package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/board/list")
@MultipartConfig
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HeadVO> headList = postService.getHeadList();
		request.setAttribute("headList", headList);
		
		String inputHead = request.getParameter("inputHead");
		HeadVO head = new HeadVO(inputHead);
		
		if(postService.insertHead(head)) {
			System.out.println("입력 성공");
			response.sendRedirect(request.getContextPath()+"/");
		}
		
		
		int selectHead = Integer.parseInt(request.getParameter("selectHead")); //he_num
		String updateHead = request.getParameter("updateHead");
		
		HeadVO updateHeader = new HeadVO(selectHead, updateHead);
		if(postService.updateHead(updateHeader)) {
			System.out.println("수정 성공");
			response.sendRedirect(request.getContextPath()+"/");
		} else {
			System.out.println("수정 실패");
			response.sendRedirect(request.getContextPath()+"/");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(request, response); //boardList 완성 시 변경

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
}
