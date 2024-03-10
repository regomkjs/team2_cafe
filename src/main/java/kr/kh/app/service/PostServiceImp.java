package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.annotation.Resources;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.PostDAO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.PostVO;

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
	public ArrayList<CategoryVO> getCommunityList() {
		return postDao.selectCategoryList();
	}

	@Override
	public boolean deleteCategory(int num) {
		return postDao.deleteCategory(num);
	}
	
}
