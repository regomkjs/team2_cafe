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
import kr.kh.app.pagination.PageMaker;
import kr.kh.app.pagination.PostCriteria;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private MemberService memberService = new MemberServiceImp();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> caList = postService.getCaList();
		request.setAttribute("caList", caList);
	
		ArrayList<BoardVO> boList = postService.getBoList();
		request.setAttribute("boList", boList);
		
		//전체 게시판 수를 가져옴
		int allPostNum = postService.getAllpostNum();
		request.setAttribute("allPostNum", allPostNum);
		//전체 멤버 수를 가져옴
		int allMemberNum = memberService.getAllmemberNum();
		request.setAttribute("allMemberNum", allMemberNum);

		//------ 내 게시글 수 & 내 댓글 수
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
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
		
		
		int bo_num;
		try {
			bo_num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			bo_num = 0;
		}
		request.setAttribute("bo_num", bo_num);
		ArrayList<HeadVO> heList = postService.getHeadListByBoNum(bo_num);
		request.setAttribute("heList", heList);

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
		ArrayList<PostVO> postList = postService.getPostList(cri);
		request.setAttribute("postList", postList);
		
		request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("board"));
		request.setAttribute("msg", "");
		request.setAttribute("url", "post/list?num="+num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}


