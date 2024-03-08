package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService memberService = new MemberServiceImp();
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		LoginDTO loginUser = new LoginDTO(id, pw);
		
		MemberVO user = memberService.getMember(loginUser.getId());
		
		if(user == null 
				|| user.getMe_id() == null
				|| user.getMe_id().length() == 0) {
			//로그인 실패 알림 후 메인으로
			request.setAttribute("msg", "등록되지 않은 회원입니다.");
			request.setAttribute("url", "login");
		}
		else if(!user.getMe_pw().equals(loginUser.getPw())) {
			request.setAttribute("msg", "비밀번호가 잘못됐습니다.");
			request.setAttribute("url", "login");
		}
		else {
			//로그인 성공 알림 후 세션에 유저 등록 메인으로
			request.setAttribute("msg", "로그인 성공");
			request.getSession().setAttribute("user", user);
			request.setAttribute("url", "");
		}
		if("admin".equals(user.getMe_id())) {
			request.setAttribute("msg", "관리자입니다.");
			request.setAttribute("url", "");
		}
		//전송
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
