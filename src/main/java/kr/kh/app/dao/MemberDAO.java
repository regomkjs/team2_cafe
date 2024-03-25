package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.UsedNickVO;

public interface MemberDAO {

	int selectAllmemberNum();

	boolean insertMember(@Param ("member")MemberVO member);

	
	MemberVO selectUser(@Param("id")String id);



	void updateMember(@Param("member")MemberVO member);


	boolean selectMemberNum(@Param("member") MemberVO user);

	int selectMyPostNum(@Param("me_id")String me_id);

	int selectMyCommentNum(@Param("me_id")String me_id);

	String selectGrade(@Param("me_id")String me_id);

	boolean updateNickname(@Param("me_id")String me_id, @Param("name")String name);

	void insertUsedNickname(@Param("name")String name,@Param("me_id") String me_id);

	UsedNickVO selectNick(@Param("nick")String nick);

}

