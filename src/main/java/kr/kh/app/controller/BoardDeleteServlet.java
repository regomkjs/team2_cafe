package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.service.BoardService;
import kr.kh.app.service.BoardServiceImp;


@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BoardService boardService = new BoardServiceImp();
			

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 삭제할 게시판의 번호를 받아와서 세션에 설정
	    int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	    BoardVO board = new BoardVO(); // 새로운 BoardVO 객체 생성
	    board.setBo_num(boardNum); // 번호 설정
	    request.getSession().setAttribute("board", board); // 세션에 저장
	    
	    // 화면에서 보낸 게시판 번호 num을 가져옴
	    int num = 0;
	    try {
	        num = Integer.parseInt(request.getParameter("num"));
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    // 세션에서 게시판 정보를 가져옴
	    BoardVO sessionBoard = (BoardVO) request.getSession().getAttribute("board");
	   
	    
	    // 게시판이 비어있으면
	    if (sessionBoard == null) {
	        request.setAttribute("msg", "삭제할 게시판이 없습니다.");
	        request.setAttribute("url", "/board/list");
	        request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	    }
	    
	    // 삭제 작업 수행
	    boolean res = boardService.deleteboard(num, sessionBoard.getBo_name());
	    
	    // 삭제 결과에 따라 메시지 설정
	    if (res) {
	        request.setAttribute("msg", "게시판이 삭제되었습니다.");
	        request.setAttribute("url", "/");
	    } else {
	        request.setAttribute("msg", "게시판 삭제에 실패했습니다.");
	        request.setAttribute("url", "/board/list");
	    }
	    
	    // message.jsp 화면 전송
	    request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
