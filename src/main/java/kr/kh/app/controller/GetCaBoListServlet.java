package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/get/cabolist")
public class GetCaBoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> caList = postService.getCaList();
		ArrayList<BoardVO> boList = postService.getBoList();
		JSONObject jobj = new JSONObject();
		jobj.put("caList", caList);
		jobj.put("boList", boList);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
