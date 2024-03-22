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
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/post/update")
public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private MemberService memberService = new MemberServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> caList = postService.getCaList();
		request.setAttribute("caList", caList);
		ArrayList<BoardVO> boList = postService.getBoList();
		request.setAttribute("boList", boList);
		ArrayList<HeadVO> heList = postService.getHeList();
		request.setAttribute("heList", heList);
		
		//전체 게시판 수를 가져옴
		int allPostNum = postService.getAllpostNum();
		request.setAttribute("allPostNum", allPostNum);
		//전체 멤버 수를 가져옴
		int allMemberNum = memberService.getAllmemberNum();
		request.setAttribute("allMemberNum", allMemberNum);

		
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		PostVO post = postService.getPostbyPoNum(num);
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		if(!post.getPo_me_id().equals(user.getMe_id())) {
			request.setAttribute("msg", "게시글 작성자만 이용할 수 있는 서비스 입니다.");
			request.setAttribute("url", "post/detail?num="+num);
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		request.setAttribute("post", post);
		request.getRequestDispatcher("/WEB-INF/views/post/update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int he_num;
		int po_num;
		try {
			he_num = Integer.parseInt(request.getParameter("head"));
			po_num = Integer.parseInt(request.getParameter("poNum"));
		}
		catch (Exception e) {
			he_num = 0;
			po_num = 0;
			e.printStackTrace();
		}
		String po_title = request.getParameter("title");
		String po_content = request.getParameter("content");
		PostVO post = postService.getPostbyPoNum(po_num);
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		if(post == null || !post.getPo_me_id().equals(user.getMe_id())) {
			request.setAttribute("msg", "수정권한이 없습니다.");
			request.setAttribute("url", "post/detail?num="+po_num);
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		if(user.getMe_nick() != null) {
			post.setPo_writer(user.getMe_nick());
		}
		post.setPo_he_num(he_num);
		post.setPo_title(po_title);
		post.setPo_content(po_content);
		
		boolean res = postService.updatePost(post);
		if(res) {
			request.setAttribute("msg", "게시글이 수정 되었습니다.");
		}
		else {
			request.setAttribute("msg", "게시글 수정에 실패했습니다.");
		}
		request.setAttribute("url", "post/detail?num="+po_num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
