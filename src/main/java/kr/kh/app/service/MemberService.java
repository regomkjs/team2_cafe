package kr.kh.app.service;

import kr.kh.app.model.vo.MemberVO;

public interface MemberService {

	boolean signupMember(MemberVO member, String pw2);

	MemberVO getMember(String id);

}
