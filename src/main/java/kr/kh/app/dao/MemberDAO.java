package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.MemberVO;

public interface MemberDAO {

	int selectAllmemberNum();

	boolean insertMember(@Param ("member")MemberVO member);

	
	MemberVO selectUser(@Param("id")String id);



	void updateMember(@Param("member")MemberVO member);


	boolean selectMemberNum(@Param("member") MemberVO user);

	

}

