package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/write")
public class PostWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> caList = postService.getCaList();
		request.setAttribute("caList", caList);
		ArrayList<BoardVO> boList = postService.getBoList();
		request.setAttribute("boList", boList);
		
		request.getRequestDispatcher("/WEB-INF/views/post/write.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bo_num = 0;
		try {
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<HeadVO> headList = postService.getHeadListByBoNum(bo_num);
		
		JSONObject jobj = new JSONObject();
		// ObjectMapper om = new ObjectMapper();
		
		
		jobj.put("bo_num", bo_num);
		jobj.put("headList", headList);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
