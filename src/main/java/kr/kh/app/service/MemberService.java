package kr.kh.app.service;

import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.vo.MemberVO;

public interface MemberService {

	boolean signupMember(MemberVO member);

	MemberVO getMember(LoginDTO loginUser);

}
