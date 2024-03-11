package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.PostDAO;
import kr.kh.app.model.vo.CategoryVO;

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
	//카테고리 불러오기
	@Override
	public ArrayList<CategoryVO> getCategoryList() {
		return postDao.selectCategoryList();
	}
	//카테고리 삭제
	@Override
	public boolean deleteCategory(int num) {
		return postDao.deleteCategory(num);
	}
	//카테고리 추가 구현중
	@Override
	public boolean insertCategory(ArrayList<CategoryVO> categoryList) {
		return postDao.insertCategory(categoryList);
	}
	
}
