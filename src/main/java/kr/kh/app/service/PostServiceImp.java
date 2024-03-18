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

	private boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	
	@Override
	public ArrayList<CategoryVO> getCaList() {
		return postDao.selectCategory();
	}

	@Override
	public ArrayList<BoardVO> getBoList() {
		return postDao.selectBoard();
	}

	@Override
	public ArrayList<HeadVO> getHeList() {
		return postDao.selectAllHead();
	}

	
	@Override
	public ArrayList<PostVO> getPostByBoNum(int bo_num) {
		return postDao.selectPostByBoNum(bo_num);
	}

	@Override
	public ArrayList<HeadVO> getHeadListByBoNum(int bo_num) {
		return postDao.selectHeadListByBoNum(bo_num);
	}

	@Override
	public boolean insertPost(PostVO post) {
		if(post == null || !checkString(post.getPo_me_id())
				|| !checkString(post.getPo_title())
				|| !checkString(post.getPo_content())
				|| post.getPo_he_num() <= 0) {
			return false;
		}
		return postDao.insertPost(post);
	}
	
	@Override
	public PostVO getPostbyPoNum(int po_num) {
		return postDao.selectPostByPoNum(po_num);
	}
	
	@Override
	public boolean deletePost(int num, String me_id) {
		if(!checkString(me_id)) {
			return false;
		}
		return postDao.deletePost(num, me_id);
	}
	
	@Override
	public boolean updatePost(PostVO post) {
		if(post == null||
				!checkString(post.getPo_content()) ||
				!checkString(post.getPo_title()) ||
				!checkString(post.getPo_me_id())||
				!checkString(post.getPo_writer())) {
			return false;
		}
		return postDao.updatePost(post);
	}
	
	
	@Override
	public void updateView(int num) {
		postDao.updateView(num);
	}

	@Override
	public boolean manageHead(String inputHead, String selectHead, String updateHead, String deleteHead, int bo_num) {
		if(bo_num == 0) {
			return false;
		}
		
		if(checkString(inputHead)) {
			HeadVO insertHeader = new HeadVO(inputHead, bo_num);
			postDao.insertHead(insertHeader);
			return true;
		}
		
		if(checkString(selectHead)) {
			if(checkString(updateHead)) {
				if(Integer.parseInt(selectHead)!=-1) {
					HeadVO updateHeader = new HeadVO(Integer.parseInt(selectHead), updateHead);
					postDao.updateHead(updateHeader);
					return true;
				}
			}
		}
		
		if(checkString(deleteHead)) {
			if(Integer.parseInt(deleteHead)!=-2) {
				HeadVO deleteHeader = new HeadVO(Integer.parseInt(deleteHead));
				postDao.deleteHead(deleteHeader);
				return true;
			}
		}
		
		return false;
	}
	
}
