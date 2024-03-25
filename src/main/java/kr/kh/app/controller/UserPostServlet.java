package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.pagination.PostCriteria;

import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;

import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/user/post")
public class UserPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private MemberService memberService = new MemberServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = postService.getCaList();
		ArrayList<BoardVO> boardList = postService.getBoList();
		ArrayList<HeadVO> headList = postService.getHeList();
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		int page = 1;
		try {
			page = Integer.parseInt(request.getParameter("page"));  
		}catch (Exception e) {
			page = 1;
		}
		
		
		
		
		//전체 게시글 수를 가져옴
		int allPostNum = postService.getAllpostNum();
		request.setAttribute("allPostNum", allPostNum);
		//전체 멤버 수를 가져옴
		int allMemberNum = memberService.getAllmemberNum();
		request.setAttribute("allMemberNum", allMemberNum);
		
		//------ 내 게시글 수 & 내 댓글 수
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		int myPostNum = 0;
		int myCommentNum = 0;
		String grade = null;
		if(user!=null) {
			myPostNum = memberService.getMyPostNum(user.getMe_id());
			myCommentNum = memberService.getMyCommentNum(user.getMe_id());
			grade = memberService.getMyGrade(user.getMe_id());
		}
		
		request.setAttribute("myPostNum", myPostNum);
		request.setAttribute("myCommentNum", myCommentNum);
				request.setAttribute("grade", grade);
		//------ 내 게시글 수 & 내 댓글 수
		System.out.println(page);
		PostCriteria cri = new PostCriteria(0,page, 10, type, search);
		int totalCount = postService.getTotalCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		ArrayList<PostVO> postList = postService.getPostList(cri);
		request.setAttribute("postList", postList);
		
		request.setAttribute("headList", headList);
		request.setAttribute("caList", categoryList);
		request.setAttribute("boList", boardList);
		
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/user/post.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
