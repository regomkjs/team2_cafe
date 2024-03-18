package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> caList = postService.getCaList();
		request.setAttribute("caList", caList);
		ArrayList<BoardVO> boList = postService.getBoList();
		request.setAttribute("boList", boList);
		
		int bo_num = 0;
		
		if(request.getParameter("num")!=null) {
			try {
				bo_num = Integer.parseInt(request.getParameter("num"));
			} catch (Exception e) {
				e.printStackTrace();
				bo_num = 0;
			}
		}
		
		ArrayList<PostVO> postList = postService.getPostByBoNum(bo_num);
		ArrayList<HeadVO> heList = postService.getHeadListByBoNum(bo_num);
		request.setAttribute("postList", postList);
		request.setAttribute("bo_num", bo_num);
		request.setAttribute("heList", heList);
		
		String inputHead = request.getParameter("inputHead");
		String selectHead = request.getParameter("selectHead"); //he_num
		String updateHead = request.getParameter("updateHead");
		String deleteHead = request.getParameter("deleteHead");
		
		if(postService.manageHead(inputHead, selectHead, updateHead, deleteHead, bo_num)) {
			response.sendRedirect(request.getContextPath() + "/post/list?num="+bo_num);
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("board"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", "");
		request.setAttribute("url", "post/list?num="+num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
