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
import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.CommentCriteria;
import kr.kh.app.pagination.Criteria;
import kr.kh.app.pagination.PostCriteria;

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
	public ArrayList<PostVO> getPostByBoNum(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(1,2);
		}
		return postDao.selectPostByBoNum(cri);
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
	public ArrayList<CommentVO> getCommentList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(1,2);
		}
		return postDao.selectCommentList(cri);
	}

	@Override
	public int getTotalCountComment(Criteria cri) {
		if(cri == null) {
			return 0;
		}
		return postDao.selectTotalCountComment(cri);
	}

	@Override
	public boolean insertComment(CommentVO comment) {
		if(comment == null || 
				!checkString( comment.getCo_content()) ||
				!checkString(comment.getCo_me_id()) ||
				!checkString(comment.getCo_writer())) {
			return false;
		}
		return postDao.insertComment(comment);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		if(cri == null) {
			return 0;
		}
		return postDao.selectTotalCountPost(cri);
	}

	@Override
	public boolean deleteComment(int num, MemberVO user) {
		if(user == null) {
			return false;
		}
		CommentVO comment = postDao.selectComment(num);
		if(comment == null
				||!comment.getCo_me_id().equals(user.getMe_id())) {
			return false;
		}
		return postDao.deleteComment(num);
	}

	@Override
	public boolean updateComment(CommentVO comment) {
		if(comment == null || 
				!checkString(comment.getCo_me_id()) ||
				!checkString(comment.getCo_writer()) ||
				!checkString(comment.getCo_content())) {
			return false;
		}
		
		CommentVO dbComment = postDao.selectComment(comment.getCo_num());
		if(dbComment == null ||
				!dbComment.getCo_me_id().equals(comment.getCo_me_id())) {
			return false;
		}
		
		return postDao.updateComment(comment);
	}

	

	
	

	
	
}
