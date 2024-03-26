package kr.kh.app.service;

import kr.kh.app.model.vo.MemberVO;

public interface MemberService {

	boolean signupMember(MemberVO member);

	MemberVO getMember(String id);

	boolean updateMember(MemberVO member);

	int getAllmemberNum();

	boolean countMember(MemberVO user);

	int getMyPostNum(String me_id);

	int getMyCommentNum(String me_id);

	String getMyGrade(String me_id);


	String refindMember(String email, String phone);

	boolean idCheckDup(String id);

	boolean updateNickname(String me_id, String name);

	boolean nickCheckDup(MemberVO user, String nick);




}
