package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.PostDAO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;

public class PostServiceImp implements PostService{
	private PostDAO postDao;
	private InputStream inputStream;
	private SqlSession session;
	
	public PostServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			postDao = session.getMapper(PostDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList() {
		return postDao.selectCategoryList();
	}

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return postDao.selectBoardList();
	}
	
	@Override
	public ArrayList<HeadVO> getHeadList() {
		return postDao.selectHeadList();
	}
	
	@Override
	public boolean manageHead(String inputHead, String selectHead, String updateHead, String deleteHead) {
		if(!checkString(inputHead)) {
			HeadVO insertHeader = new HeadVO(inputHead);
			postDao.insertHead(insertHeader);
			return true;
		}
		
		if(!checkString(selectHead)) {
			if(!checkString(updateHead)) {
				if(Integer.parseInt(selectHead)!=-1) {
					HeadVO updateHeader = new HeadVO(Integer.parseInt(selectHead), updateHead);
					postDao.updateHead(updateHeader);
					return true;
				}
			}
		}
		
		if(!checkString(deleteHead)) {
			if(Integer.parseInt(deleteHead)!=-2) {
				HeadVO deleteHeader = new HeadVO(Integer.parseInt(deleteHead));
				postDao.deleteHead(deleteHeader);
				return true;
			}
		}
		
		return false;
	}
	
	private boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return true;
		}
		return false;
	}
}
