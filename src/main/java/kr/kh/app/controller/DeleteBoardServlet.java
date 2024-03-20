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
public class DeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BoardService boardService = new BoardServiceImp();
			

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = 0;
		try {
				num = Integer.parseInt(request.getParameter("num"));
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		BoardVO board = (BoardVO)request.getSession().getAttribute("board");
		
		if(board == null) {
			request.setAttribute("msg", "삭제할 게시판이 없습니다.");
			request.setAttribute("url", "/board/add");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		boolean res = boardService.deleteboard(num, board.getBo_name());
		if(res) {
			request.setAttribute("msg", "게시판이 삭제됐습니다.");
		}
		else {
			request.setAttribute("msg", "게시판 삭제에 실패했습니다.");
		}
		request.setAttribute("url", "");
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}



}
