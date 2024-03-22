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
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/user/page")
public class UserPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private MemberService memberService = new MemberServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = postService.getCaList();
		ArrayList<BoardVO> boardList = postService.getBoList();
		
		request.setAttribute("caList", categoryList);
		request.setAttribute("boList", boardList);
		
		request.getRequestDispatcher("/WEB-INF/views/user/page.jsp").forward(request, response);
		request.getRequestDispatcher("/WEB-INF/views/sidebar.jsp").forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		if(!pw.equals(pw2)) {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", "/user/page");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		
		MemberVO member = new MemberVO(user.getMe_id(), pw, email, phone);
		
		if(memberService.updateMember(member)) {
			request.setAttribute("msg", "회원정보가 수정되었습니다.");
			request.setAttribute("url", "/user/page");
		} else {
			request.setAttribute("msg", "회원정보 수정에 실패했습니다.");
			request.setAttribute("url", "/user/page");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		
	}

}
