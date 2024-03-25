package kr.kh.app.controller.category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.CategoryService;
import kr.kh.app.service.CategoryServiceImp;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/category/insert")
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private CategoryService categoryService = new CategoryServiceImp();
	private PostService postService = new PostServiceImp();
	private MemberService memberService = new MemberServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> caList = postService.getCaList();
		request.setAttribute("caList", caList);
		ArrayList<BoardVO> boList = postService.getBoList();
		request.setAttribute("boList", boList);
		
		//------ 내 게시글 수 & 내 댓글 수
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		int myPostNum = 0;
		int myCommentNum = 0;
		String grade = null;
		if(user!=null) {
			myPostNum = memberService.getMyPostNum(user.getMe_id());
			myCommentNum = memberService.getMyCommentNum(user.getMe_id());
			grade = memberService.getMyGrade(user.getMe_id());
		}
		
		request.setAttribute("myPostNum", myPostNum);
		request.setAttribute("myCommentNum", myCommentNum);
		request.setAttribute("grade", grade);
		//------ 내 게시글 수 & 내 댓글 수
		
		//전체 게시판 수를 가져옴
		int allPostNum = postService.getAllpostNum();
		request.setAttribute("allPostNum", allPostNum);
		//전체 멤버 수를 가져옴
		int allMemberNum = memberService.getAllmemberNum();
		request.setAttribute("allMemberNum", allMemberNum);
			
		
		
		
		//카테고리 리스트를 가져옴
		ArrayList<CategoryVO> categoryList = categoryService.selectCategory();
		
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/WEB-INF/views/admin/categoryinsert.jsp").forward(request, response);
      
		
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카테고리 리스트를 추가
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		
		if (!"admin".equals(user.getMe_id())) {
			return;
		}
		//화면에서 보낸 카테고리를 가져옴
		String ca_name = request.getParameter("category");
		
		CategoryVO category = new CategoryVO(ca_name);
		
		boolean res = categoryService.insertCategory(ca_name);
		
		if (res) {
			request.setAttribute("msg", "카테고리를 추가했습니다.");
			request.setAttribute("url", "category/insert");
		} else {
			request.setAttribute("msg", "카테고리를 삭제하지못했습니다.");
			request.setAttribute("url", "category/insert?ca_name"+ ca_name);
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);


	}
}
