package kr.kh.app.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import kr.kh.app.model.vo.MemberVO;

@WebFilter({"/login","/signup"})
public class GuestFilter implements Filter {
       
	private static final long serialVersionUID = 1L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		MemberVO user = (MemberVO) httpServletRequest.getSession().getAttribute("user");
		if(user != null) {
			request.setAttribute("msg", "로그인한 회원은 이용할 수 없는 서비스입니다.");
			request.setAttribute("url", "");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(httpServletRequest, response);
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
