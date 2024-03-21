package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.service.BoardService;
import kr.kh.app.service.BoardServiceImp;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PostService postService = new PostServiceImp();
	
	private BoardService boardService = new BoardServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 카테고리 정보를 가져옴
		 ArrayList<CategoryVO> category = new ArrayList<CategoryVO>(); // 카테고리 정보를 DB에서 가져오는 메서드
		 
		// JSP에 카테고리 정보 전달
        request.setAttribute("category", category);
        request.getRequestDispatcher("/WEB-INF/views/board/update.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 수정된 카테고리 정보를 처리하는 로직
        String categoryId = request.getParameter("categoryId");
        String categoryName = request.getParameter("categoryName");
        
        // DB에서 카테고리 정보 수정하는 메서드 호출
        
        
        // 수정 후 결과 페이지로 이동
        //response.sendRedirect(request.getContextPath() + "/category/list"); // 수정 후 카테고리 목록 페이지로 이동
        request.getRequestDispatcher("/WEB-INF/views/board/update.jsp").forward(request, response);
	}
	
			//화면에서 보낸 댓글 내용과 댓글 번호를 가져옴
//			int num = 0;
//			try {
//				num = Integer.parseInt(request.getParameter("num"));
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
//			String bo_name = request.getParameter("bo_name");
//			
//			//회원 정보를 가져옴
//			MemberVO user = (MemberVO)request.getSession().getAttribute("user");
//			//댓글 객체를 댓글 번호, 내용, 작성자를 이용하여 생성
//			CommentVO comment = new CommentVO(0, content, user.getMe_id());
//			comment.setCm_num(num);
//			//댓글을 수정하라고 시키고 결과를 boolean으로 받아옴
//			boolean res = boardService.updateComment(comment);
//			response.getWriter().write(res?"ok":"");
//		}

}
