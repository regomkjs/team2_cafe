package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		MemberVO member = new MemberVO(id, pw, email, phone);
		boolean res = memberService.signupMember(member, pw2);
		if(res) {
			//가입 성공 알림 후 로그인으로
			request.setAttribute("msg",  "ID : "+id + " 가입 성공");
			request.setAttribute("url", "login");
		}
		else {
			//가입 실패 알림 후 메인으로
			request.setAttribute("msg", "회원가입에 실패했습니다.");
			request.setAttribute("url", "");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		doGet(request, response);
	}

}
