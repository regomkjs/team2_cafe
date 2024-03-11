package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param ("member")MemberVO member);

	MemberVO selectUser(@Param("id")String id);

}