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
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/my/post")
public class MyPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
    public MyPostServlet() {
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = postService.getCategoryList();
		ArrayList<BoardVO> boardList = postService.getBoardList();
		ArrayList<HeadVO> headList = postService.getHeadList();
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		ArrayList<PostVO> myPostList = postService.getMyPostList(user.getMe_id());
//		if(myPostList == null) {
//			request.setAttribute("msg", "작성된 게시글이 없습니다.");
//			request.setAttribute("url", "/");
//			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
//		}
		request.setAttribute("headList", headList);
		request.setAttribute("postList", myPostList);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("boardList", boardList);
		
		request.getRequestDispatcher("/WEB-INF/views/my/post.jsp").forward(request, response);
		request.getRequestDispatcher("/WEB-INF/views/sidebar.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
