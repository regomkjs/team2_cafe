package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.CategoryDAO;
import kr.kh.app.model.vo.CategoryVO;

public class CategoryServiceImp implements CategoryService{
		private CategoryDAO categoryDao;
		private InputStream inputStream;
		private SqlSession session;
		
		public CategoryServiceImp() {
			String resource = "kr/kh/app/config/mybatis-config.xml";
			try {
				inputStream = Resources.getResourceAsStream(resource);
				SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
				session = sessionFactory.openSession(true);
				categoryDao = session.getMapper(CategoryDAO.class);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//카테고리 불러오기
		@Override
		public ArrayList<CategoryVO> selectCategory() {
			return categoryDao.selectCategory();
		}

		@Override
		public boolean deleteCategory(String ca_name) {
			
			return categoryDao.deleteCategory(ca_name);
		}

		@Override
		public boolean updateCategory(String caOriName, String caNewName) {
			return categoryDao.updateCategory(caOriName,caNewName);
		}

		@Override
		public boolean insertCategory(String ca_name) {
			return categoryDao.insertCategory(ca_name);			
		}

	
		/*
		//카테고리 삭제
		@Override
		public boolean deleteCategory(int num) {
			return categoryDao.deleteCategory(num);
		}
		
		
		@Override
		public boolean insertCategory(ArrayList<CategoryVO> categoryList) {
			return categoryDao.insertCategory(categoryList);
		}*/
	
}
