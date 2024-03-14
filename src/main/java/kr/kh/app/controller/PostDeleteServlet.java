package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/delete")
public class PostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		if(user == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스 입니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		boolean res = postService.deletePost(num, user.getMe_id());
		if(res) {
			request.setAttribute("msg", "게시글이 삭제됐습니다.");
		}
		else {
			request.setAttribute("msg", "게시글 삭제에 실패했습니다.");
		}
		request.setAttribute("url", "");
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
