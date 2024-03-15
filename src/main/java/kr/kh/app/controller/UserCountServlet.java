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



@WebServlet("/user/count")
public class UserCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int me_num = 0;
		try {
			
			me_num = Integer.parseInt(request.getParameter("meNum"));
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		response.setContentType("text/plain");
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		try {
			boolean resultConut = memberService.countMember(user);
		}catch(Exception e) {
			e.printStackTrace();
			response.getWriter().write("확인할 수 없습니다.");
		}
		
	}


}
