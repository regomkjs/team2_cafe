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
		//전체 게시글 수를 가져옴
		int allPostNum = postService.getAllpostNum();
		request.setAttribute("allPostNum", allPostNum);
		//전체 멤버 수를 가져옴
		int allMemberNum = memberService.getAllmemberNum();
		request.setAttribute("allMemberNum", allMemberNum);
		// 내 게시글 수 & 내 댓글 수
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
		// 내 게시글 수 & 내 댓글 수

		request.getRequestDispatcher("/WEB-INF/views/user/page.jsp").forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		String nick = request.getParameter("name");
		
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		if(pw != null && !user.getMe_pw().equals(pw)) {
			user.setMe_pw(pw);
		}
		if(email != null && !user.getMe_email().equals(email)) {
			user.setMe_email(email);
		}
		if(phone != null && !user.getMe_nick().equals(phone)) {
			user.setMe_phone(phone);
		}
		if(nick != null && !user.getMe_nick().equals(nick)) {
			user.setMe_nick(name);
		}
		request.getSession().setAttribute("user", user);
		boolean res = memberService.updateNickname(user.getMe_id(), name);
		MemberVO member = new MemberVO(user.getMe_id(), pw, email, phone);
		if(memberService.updateMember(member) || res) {
			request.setAttribute("msg", "회원정보가 수정되었습니다.");
			request.setAttribute("url", "/user/page");
			
		} else {
			request.setAttribute("msg", "회원정보 수정에 실패했습니다.");
			request.setAttribute("url", "/user/page");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		
	}

}
