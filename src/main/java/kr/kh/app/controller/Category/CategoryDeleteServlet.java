package kr.kh.app.controller.Category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/category/delete")
public class CategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼에서 전송된 카테고리 목록을 읽어옴
		MemberVO user = new MemberVO();
    
		if(!"admin".equals(user.getMe_id())) {
        	return;
        }
		//화면에서 보낸 카테고리 번호를 가져옴
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			
		}catch(Exception e) {
			num =0;
		}
		//서비스에게 회원정보와 카테고리 정보를 주면서 삭제하라고 시킨 후 삭제 여부를 알려달라고 요청
		boolean res = postService.deleteCategory(num);
		if(res) {
			request.setAttribute("msg", "카테고리를 삭제했습니다.");
			//화면에 url로 category를 전송.
			request.setAttribute("url", "/category");
			
		}
		//실패하면
		else {
			//화면에 msg로 카테고리를 삭제하지 못했습니다라고 전송
			request.setAttribute("msg", "카테고리를 삭제하지못했습니다.");
			//화면에 url 전송
			request.setAttribute("url", "/sidebar");
		}
		//message.jsp 화면을 전송
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		
        // 카테고리 목록을 리스트로 변환
        //ArrayList<Catrgory> categoryList = new ArrayList<>();
        
		/*
		 * if (categories != null) { for (String category : categories) {
		 * categoryList.add(category); } }
		response.sendRedirect(request.getContextPath() + "/category");
		 */
	
        
	}

}
