package kr.kh.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.service.MemberService;
import kr.kh.app.service.MemberServiceImp;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;


@WebServlet("/post/write")
public class PostWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private PostService postService = new PostServiceImp();
	private MemberService memberService = new MemberServiceImp();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> caList = postService.getCaList();
		request.setAttribute("caList", caList);
		ArrayList<BoardVO> boList = postService.getBoList();
		request.setAttribute("boList", boList);
		
		//전체 게시판 수를 가져옴
		int allPostNum = postService.getAllpostNum();
		request.setAttribute("allPostNum", allPostNum);
		//전체 멤버 수를 가져옴
		int allMemberNum = memberService.getAllmemberNum();
		request.setAttribute("allMemberNum", allMemberNum);

		//------ 내 게시글 수 & 내 댓글 수
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
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
		
		
		String prevUrl = request.getHeader("Referer");
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			num = 0;
		}
		ArrayList<HeadVO> heList = postService.getHeadListByBoNum(num);
		request.setAttribute("heList", heList);
		request.setAttribute("num", num);
		request.setAttribute("prevUrl", prevUrl);
		request.getRequestDispatcher("/WEB-INF/views/post/write.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bo_num = 0;
		try {
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<HeadVO> headList = postService.getHeadListByBoNum(bo_num);
		
		JSONObject jobj = new JSONObject();
		// ObjectMapper om = new ObjectMapper();
		
		
		jobj.put("bo_num", bo_num);
		jobj.put("headList", headList);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
