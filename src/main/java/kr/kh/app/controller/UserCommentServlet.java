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
import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/user/comment")
public class UserCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private MemberService memberService = new MemberServiceImp();
    public UserCommentServlet() {
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = postService.getCaList();
		ArrayList<BoardVO> boardList = postService.getBoList();
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<CommentVO> myCommentList = postService.getMyCommentList(user.getMe_id());
		ArrayList<PostVO> postList = postService.getPoList();
//		if(myPostList == null) {
//			request.setAttribute("msg", "작성된 게시글이 없습니다.");
//			request.setAttribute("url", "/");
//			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
//		}
		
		//------ 내 게시글 수 & 내 댓글 수
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
				
		request.setAttribute("postList", postList);
		request.setAttribute("myCommentList", myCommentList);
		request.setAttribute("caList", categoryList);
		request.setAttribute("boList", boardList);
		
		request.getRequestDispatcher("/WEB-INF/views/user/comment.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
