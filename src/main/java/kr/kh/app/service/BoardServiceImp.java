package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.BoardDAO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.MemberVO;

public class BoardServiceImp implements BoardService {

	private BoardDAO boardDao;
	private InputStream inputStream;
	private SqlSession session;
	
	public BoardServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			boardDao = session.getMapper(BoardDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<BoardVO> getBoardList() {
		
		return boardDao.selectBoardList();
	}

	@Override
	public boolean insertBoard(BoardVO board) {
	    if (board == null || !checkString(board.getBo_name())) {
	        return false;
	    }
	    return boardDao.insertBoard(board);
	}
		
	public boolean checkString(String str) {
	    if (str == null || str.length() == 0)
	        return false;
	    else
	        return true;
	}

	@Override
	public ArrayList<CategoryVO> getcategoryList() {
		
		return boardDao.selectCategoryList();
	}


	@Override
	public boolean deleteboard(int num, String bo_name) {
		if(!checkString(bo_name)) {
			return false;
		}
		return boardDao.deleteboard(num, bo_name);
	}

	@Override
	public List<Category> getAllCategory() {
		// TODO Auto-generated method stub
		return null;
	}




}
