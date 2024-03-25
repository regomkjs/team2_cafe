package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

import kr.kh.app.controller.category.CategoryInsertServlet;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.BoardService;
import kr.kh.app.service.BoardServiceImp;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/admin/page")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	private PostService postService = new PostServiceImp();
    private MemberService memberService = new MemberServiceImp();
    private BoardService boardService = new BoardServiceImp();
    private CategoryInsertServlet categoryInsertServlet = new CategoryInsertServlet();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		categoryInsertServlet.init();
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
		MemberVO userInfo = null;
		
		if(user!=null) {
			userInfo = memberService.getMember(user.getMe_id());
			myPostNum = memberService.getMyPostNum(user.getMe_id());
			myCommentNum = memberService.getMyCommentNum(user.getMe_id());
			grade = memberService.getMyGrade(user.getMe_id());
		}
		
		request.setAttribute("userInfo", userInfo);
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
		
		
		
		String caSelect = request.getParameter("caSelect"); 
		ArrayList<BoardVO> caBoardList = boardService.getCaBoardList(caSelect);
		request.setAttribute("caBoardList", caBoardList);
		request.setAttribute("caSelect", caSelect);
		
		System.out.println(caSelect);
		
		String inputBoard = request.getParameter("inputBoard");
		String selectBoard = request.getParameter("selectBoard");
		String updateboard = request.getParameter("updateboard");
		String deleteBoard = request.getParameter("deleteBoard");
		
		if(boardService.manageBoard(inputBoard, selectBoard, updateboard, deleteBoard, caSelect)) {
			response.sendRedirect(request.getContextPath() + "/admin/page");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/views/admin/page.jsp").forward(request, response);	
	}

}
