package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;

@WebServlet("/id/check/dup")
public class IdCheckDupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService memberService = new MemberServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		boolean res = memberService.idCheckDup(id);
		System.out.println(id);
		System.out.println(res);
		JSONObject jobj = new JSONObject();	
		jobj.put("result", res);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
