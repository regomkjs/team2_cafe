package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/countlike")
public class PostCountLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int po_num;
		try {
			po_num = Integer.parseInt(request.getParameter("po_num"));
		} catch (Exception e) {
			po_num = 0;
		}
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		int totalCountLike = postService.getTotalCountLike(po_num);
		boolean res = postService.getUserLike(user, po_num);
		
		JSONObject jobj = new JSONObject();
		// ObjectMapper om = new ObjectMapper();
		
		
		jobj.put("totalCountLike",totalCountLike);
		jobj.put("result", res);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
		
	}

}
