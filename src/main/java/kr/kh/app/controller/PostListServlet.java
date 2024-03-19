package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.pagination.PostCriteria;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;



@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//List를 불러오는게 아니라 BoardVO 하나를 가져와서 게시판에 넣어야 한다.
		ArrayList<PostVO> poList = postService.getPoList(); 
		request.setAttribute("poList", poList);
		ArrayList<BoardVO> boList = postService.getBoList();
		request.setAttribute("boList", boList);
		int boNum=1;
		int po_num;
		try {
			po_num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
			po_num = 0;
		}
		
		
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page = 1;
		}
		String type = request.getParameter("type");
		String search = request.getParameter("search");
		//검색어, 검색 타입, 현재 페이지, 한 페이지 컨텐츠 개수를 이용하여 현재 페이지 정보 객체를 생성 
		PostCriteria cri = new PostCriteria(boNum, page, 2, type, search);
		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴 
		int totalCount = postService.getTotalCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		//현재 페이지 정보에 맞는 게시글 리스트를 가져옴
		ArrayList<PostVO> postlist = postService.getPostList(cri);
		request.setAttribute("postlist", postlist);//화면에 전송
		System.out.println(postlist);
		request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
	}
		
	
	}

