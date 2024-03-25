package kr.kh.app.controller.category;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.CategoryService;
import kr.kh.app.service.CategoryServiceImp;

@WebServlet("/category/delete")
public class CategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CategoryService categoaryservice = new CategoryServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		// 폼에서 전송된 카테고리 목록을 읽어옴
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");

		if (!"admin".equals(user.getMe_id())) {
			return;
		}
		// 화면에서 보낸 카테고리 번호를 가져옴
		String ca_name = request.getParameter("category");
		boolean res = categoaryservice.deleteCategory(ca_name);
		if (res) {
			request.setAttribute("msg", "카테고리를 삭제했습니다.");
			request.setAttribute("url", "admin/page");
		} else {
			request.setAttribute("msg", "카테고리를 삭제하지못했습니다.");
			request.setAttribute("url", "admin/page?ca_name"+ca_name);
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);


	}

}
