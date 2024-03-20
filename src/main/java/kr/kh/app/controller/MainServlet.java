package kr.kh.app.controller;

import java.io.IOException;

import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;

import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;

import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	private PostService postService = new PostServiceImp();
    private MemberService memberService = new MemberServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<CategoryVO> caList = postService.getCaList();
		request.setAttribute("caList", caList);
		ArrayList<BoardVO> boList = postService.getBoList();
		request.setAttribute("boList", boList);


		String data = request.getParameter("");
		String id = request.getParameter("id");
		//전체 게시판 수를 가져옴
		int allPostNum = postService.getAllpostNum();
		request.setAttribute("allPostNum", allPostNum);
		//전체 멤버 수를 가져옴
		int allMemberNum = memberService.getAllmemberNum();
		request.setAttribute("allMemberNum", allMemberNum);
			

		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
		
	}

}
