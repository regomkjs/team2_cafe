package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.MemberDAO;
import kr.kh.app.model.dto.LoginDTO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.UsedNickVO;

public class MemberServiceImp implements MemberService {
	private MemberDAO memberDao;
	private InputStream inputStream;
	private SqlSession session;

	public MemberServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			memberDao = session.getMapper(MemberDAO.class);
		} catch (IOException e) {
			e.printStackTrace();

		}
	}

	@Override
	public boolean signupMember(MemberVO member) {
		if (member == null) {
			return false;
		}
		if (!checking(member.getMe_id()) || !checking(member.getMe_pw())) {
			return false;
		}
		return memberDao.insertMember(member);
	}

	@Override
	public MemberVO getMember(String id) {
		if (!checking(id)) {
			return null;
		}
		return memberDao.selectUser(id);
	}

	private boolean checking(String str) {
		if (str == null) {
			return false;
		}
		if (str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override

	public boolean updateMember(MemberVO member) {
		if (!checking(member.getMe_id()) || !checking(member.getMe_pw()) || !checking(member.getMe_email())
				|| !checking(member.getMe_phone())) {
			return false;
		}
		memberDao.updateMember(member);
		return true;
	}

	public int getAllmemberNum() {
		return memberDao.selectAllmemberNum();
	}

	@Override
	public boolean countMember(MemberVO user) {
		if (user == null) {
			return false;
		}
		return memberDao.selectMemberNum(user);
	}

	@Override
	public int getMyPostNum(String me_id) {
		if (checking(me_id)) {
			return memberDao.selectMyPostNum(me_id);
		}
		return 0;
	}

	@Override
	public int getMyCommentNum(String me_id) {
		if (checking(me_id)) {
			return memberDao.selectMyCommentNum(me_id);
		}
		return 0;
	}

	@Override
	public String getMyGrade(String me_id) {
		if (checking(me_id)) {
			return memberDao.selectGrade(me_id);
		}
		return null;
	}

	@Override
	public String refindMember(String email, String phone) {
		if(!checking(email)|| !checking(phone)) {
			return null;
		}
		String user = memberDao.selectId(email,phone);
		if(user == null) {
			return null;
		}
		return user;
	}	

	public boolean idCheckDup(String id) {
		if(!checking(id)) {
			return false;
		}
		MemberVO member = memberDao.selectUser(id);
		if(member == null || !member.getMe_id().equals(id)) {
			return true;
		}
		return false;
	}

	


	@Override
	public boolean updateNickname(String me_id, String name) {
		if(checking(me_id) && checking(name)) {
			memberDao.insertUsedNickname(name,me_id);
			return memberDao.updateNickname(me_id, name);
		}
		return false;
	}

	@Override
	public boolean nickCheckDup(MemberVO user, String nick) {
		if(!checking(nick)) {
			return false;
		}
		if(!checking(user.getMe_nick())) {
			return true;
		}else {
			MemberVO member = memberDao.selectUser(nick);
			if(member != null) {
				return false;
			}
			UsedNickVO usedNick = memberDao.selectNick(nick);
			if(usedNick == null || !usedNick.getUn_nick().equals(nick)) {
				return true;
			}
			return false;
		}
	}
}
	
