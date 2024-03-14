package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/insert")
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PostService postService = new PostServiceImp();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int po_he_num = 0;
		try {
			po_he_num = Integer.parseInt(request.getParameter("head"));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		String po_title = request.getParameter("title");
		String po_content = request.getParameter("content");
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		String po_me_id = user.getMe_id();
		String po_writer;
		if(user.getMe_nick() == null || user.getMe_nick().length() == 0) {
			po_writer = user.getMe_id();
		}else {
			po_writer = user.getMe_nick();
		}
		PostVO post = new PostVO(po_title, po_content, po_writer, po_he_num, po_me_id);
		boolean res = postService.insertPost(post);
		response.getWriter().write(""+res);
	}

}
