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


@WebServlet("/user/post")
public class UserPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
    public UserPostServlet() {
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = postService.getCaList();
		ArrayList<BoardVO> boardList = postService.getBoList();
		ArrayList<HeadVO> headList = postService.getHeList();
		String userID=null;
		if(request.getParameter("user")!=null) {
			userID = request.getParameter("user");
		} else {
			HttpSession session = request.getSession();
			MemberVO user = (MemberVO)session.getAttribute("user");
			userID = user.getMe_id();
		}
		ArrayList<PostVO> myPostList = postService.getMyPostList(userID);
		request.setAttribute("headList", headList);
		request.setAttribute("postList", myPostList);
		request.setAttribute("caList", categoryList);
		request.setAttribute("boList", boardList);
		
		request.getRequestDispatcher("/WEB-INF/views/user/post.jsp").forward(request, response);
		request.getRequestDispatcher("/WEB-INF/views/sidebar.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
