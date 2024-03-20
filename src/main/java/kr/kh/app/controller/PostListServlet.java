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

import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

import kr.kh.app.pagination.PageMaker;
import kr.kh.app.pagination.PostCriteria;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;



import kr.kh.app.model.vo.HeadVO;

@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> caList = postService.getCaList();
		request.setAttribute("caList", caList);
	
		ArrayList<BoardVO> boList = postService.getBoList();
		request.setAttribute("boList", boList);
		

		int bo_num;
		try {
			bo_num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
			bo_num = 0;
		}
		request.setAttribute("bo_num", bo_num);
	
	/*

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

		*/
		
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));

		}catch (Exception e) {
			page = 1;
		}
		
		String type = request.getParameter("type");
		String search = request.getParameter("search");
		//type과 search와 page를 이용해서 Criteria 객체를 생성
		PostCriteria cri = new PostCriteria(bo_num,page, 10,  type, search);
		//서비스에게 현재 페이지 정보를 주면서 현재 페이지 정보에 맞는 게시글 수를 가져오라고 시킴: getTotalCount
		int totalCount = postService.getTotalCount(cri);
		//현재 페이지 정보, 게시글수, 한 페이지네이션에서 페이지 갯수를 이용하여 PageMaker 객체를 생성
		PageMaker pm = new PageMaker(5, cri, totalCount);
		//생성한 객체를 화면에 전달
		request.setAttribute("pm", pm);
		ArrayList<PostVO> postList = postService.getPostByBoNum(cri);
		request.setAttribute("postList", postList);
	}
}
	
//		int bo_num = 0;
//		
//		if(request.getParameter("num")!=null) {
//			try {
//				bo_num = Integer.parseInt(request.getParameter("num"));
//			} catch (Exception e) {
//				e.printStackTrace();
//				bo_num = 0;
//			}
//		}
//		
//		ArrayList<PostVO> postList = postService.getPostByBoNum(bo_num);
//		ArrayList<HeadVO> heList = postService.getHeadListByBoNum(bo_num);
//		request.setAttribute("postList", postList);
//		request.setAttribute("bo_num", bo_num);
//		request.setAttribute("heList", heList);
//		
//		String inputHead = request.getParameter("inputHead");
//		String selectHead = request.getParameter("selectHead"); //he_num
//		String updateHead = request.getParameter("updateHead");
//		String deleteHead = request.getParameter("deleteHead");
//		
//		if(postService.manageHead(inputHead, selectHead, updateHead, deleteHead, bo_num)) {
//			response.sendRedirect(request.getContextPath() + "/post/list?num="+bo_num);
//			return;
//		}
//		
//	
//		request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
//		}
//
//		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int num = 0;
//		try {
//			num = Integer.parseInt(request.getParameter("board"));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		request.setAttribute("msg", "");
//		request.setAttribute("url", "post/list?num="+num);
//		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
//		}
//	
//	*/
//	
//
//	
//
//		}catch(Exception e) {
//			page = 1;
//		}
//		String type = request.getParameter("type");
//		String search = request.getParameter("search");
//		//검색어, 검색 타입, 현재 페이지, 한 페이지 컨텐츠 개수를 이용하여 현재 페이지 정보 객체를 생성 
//		PostCriteria cri = new PostCriteria(boNum, page, 2, type, search);
//		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴 
//		int totalCount = postService.getTotalCount(cri);
//		PageMaker pm = new PageMaker(5, cri, totalCount);
//		request.setAttribute("pm", pm);
//		//현재 페이지 정보에 맞는 게시글 리스트를 가져옴
//		ArrayList<PostVO> postlist = postService.getPostList(cri);
//		request.setAttribute("postlist", postlist);//화면에 전송
//		System.out.println(postlist);
//		request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
//	}
//		
//	
//}
//
//


