package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/reply/insert")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private PostService postService = new PostServiceImp();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int po_num = 0;
		try {
			po_num = Integer.parseInt(request.getParameter("poNum"));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		int ori = 0;
		try {
			ori = Integer.parseInt(request.getParameter("ori"));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		String content = request.getParameter("content");
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		String writer;
		if(user.getMe_nick() == null) {
			writer = user.getMe_id();
		}else {
			writer = user.getMe_nick();
		}
		
		CommentVO comment = new CommentVO(po_num, user.getMe_id(), content, writer, ori);
		
		boolean res = postService.insertComment(comment);
		
		response.getWriter().write(""+res);
		
	}

}
