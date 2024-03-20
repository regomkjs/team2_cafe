package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.MemberDAO;
import kr.kh.app.model.vo.MemberVO;

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
		if(member == null) {
			return false;
		}
		if(!checking(member.getMe_id()) 
		  || !checking(member.getMe_pw())) {
			return false;
		}
		return memberDao.insertMember(member);
	}
	
	@Override
	public MemberVO getMember(String id) {
		if(!checking(id)) {
			return null;
		}
		return memberDao.selectUser(id);
	}
	
	
	
	private boolean checking(String str) {
		if(str == null) {
			return false;
		}
		if(str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override

	public boolean updateMember(MemberVO member) {
		if(!checking(member.getMe_id()) ||
		   !checking(member.getMe_pw()) ||
		   !checking(member.getMe_email()) ||
		   !checking(member.getMe_phone())) {
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
		if(user == null) {
			return false;
		}
		return memberDao.selectMemberNum(user);
	}

	


	
}
