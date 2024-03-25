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

@WebServlet("/user/findId")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();


protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/user/findId.jsp").forward(request, response);
}
	
protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("me_email");
		String phone = request.getParameter("me_phone");
		System.out.println(email +", "+ phone);
		String userId = memberService.refindMember(email,phone);
		
		/*
		 * // boolean res = memberService.checkId(email); // request.setAttribute("res",
		 * res); System.out.println(user + "두포"); System.out.println(email + "두포");
		 */

		if (userId == null || userId.length() == 0) {
			// 아이디 찾기 실패 알림 후 메인으로
			request.setAttribute("msg", "등록되지 않은 회원입니다.");
			request.setAttribute("url", "signup");
			
		} else {
			// 아이디 찾기 성공 알림 후 세션에 유저 등록 메인으로
			request.setAttribute("msg", "등록하신 아이디는" + userId + "입니다.");
			request.setAttribute("url", "login");
		}

		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		

	}

}
