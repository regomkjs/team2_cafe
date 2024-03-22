package kr.kh.app.controller;

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
import kr.kh.app.service.BoardService;
import kr.kh.app.service.BoardServiceImp;


@WebServlet("/board/add")
public class BoardAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private BoardService boardService = new BoardServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서(관리자 로그인 시에만 가능하기 때문에) 게시판 정보를 가져옴
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		// (임시 : user인 이유 LoginServlet에서 request.getSession().setAttribute("user", user); 에서 user라고 사용했기 때문 => 관리자는 따로 해야하나?)
		// (임시 : 현재는 모든 회원이 보임)'회원 정보가 없으면 로그인이 필요한 서비스입니다' 라고 출력 후 게시판 리스트로 
		
		if(user==null) { 
			// 그냥 안보이게 하고싶은데 아직 구현 X (일단 다 보이고 넘어가는 상황)
			request.setAttribute("url", "board/list");
			return;
		}
		
		String categoryName = request.getParameter("categoryName");
		request.setAttribute("categoryName", categoryName);
		
		ArrayList<BoardVO> boardList = new ArrayList();
		
		ArrayList<BoardVO> selectoardList = boardService.getBoardList();
		
		// categoryName이 null이 아닌 경우에만 게시판 리스트를 가져오고 처리
		if (categoryName != null) {
		    ArrayList<BoardVO> selectBoardList = boardService.getBoardList();
		    for (BoardVO board : selectBoardList) {
		        if (!categoryName.equals(board.getBo_ca_name())) {
		            continue;
		        }
		        
		        boardList.add(board);
		    }
		}
		
		request.setAttribute("boardList", boardList);
		request.getRequestDispatcher("/WEB-INF/views/board/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		// 화면에서 보낸 게시판 이름 가져옴
		 String newBoardName = request.getParameter("newboardname");

		// 세션에서 회원 정보를 가져옴 (관리자로 수정해야 함)
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		// 회원 관리자 정보가 없으면
		if(user == null) {
			// 화면에 url로 board/list를 전송
			request.setAttribute("url", "board/list");
			return;
		}
		
		// 회원 관리자 정보가 있으면
		
		
			// 게시판 이름을 이용하여 게시판 객체를 생성 (BoardVO에서 확인 필요)
			BoardVO board = new BoardVO(); 
			board.setBo_name(newBoardName); // 새로운 게시판 이름 설정

			// 서비스에게 게시판 이름 객체를 주면서 등록하라고 시킴
			boolean res = boardService.insertBoard(board);
			
			// 메세지 출력이 구현 전 그래서 일단 다 전송
			if(res) {
				response.sendRedirect(request.getContextPath()+"/board/list");
			}else {
				response.sendRedirect(request.getContextPath()+"/board/insert");
			}
			request.setAttribute("url", "board/list");
	}

}




