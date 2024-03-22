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
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/user/check")
public class UserCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = postService.getCaList();
		ArrayList<BoardVO> boardList = postService.getBoList();
		
		request.setAttribute("caList", categoryList);
		request.setAttribute("boList", boardList);
		
		request.getRequestDispatcher("/WEB-INF/views/user/check.jsp").forward(request, response);
		request.getRequestDispatcher("/WEB-INF/views/sidebar.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		String pwcheck = request.getParameter("pwCheck");
		
		if(pwcheck==null) {
			System.out.println("check test1");
			request.setAttribute("msg", "비밀번호 확인 절차를 거쳐야 합니다.");
			request.setAttribute("url", "");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		
		if(!user.getMe_pw().equals(pwcheck)) {
			System.out.println("check test2");
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", "");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		response.sendRedirect(request.getContextPath()+"/user/page");
	}
}
