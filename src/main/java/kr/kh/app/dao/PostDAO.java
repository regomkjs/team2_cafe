package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;



import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.LikeVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;





public interface PostDAO {

	ArrayList<CategoryVO> selectCategory();

	ArrayList<BoardVO> selectBoard();

	ArrayList<HeadVO> selectAllHead();

	ArrayList<HeadVO> selectHeadListByBoNum(@Param("bo_num")int bo_num);

	boolean insertPost(@Param("post")PostVO post);

	PostVO selectPostByPoNum(@Param("po_num")int po_num);

	boolean deletePost(@Param("po_num")int num, @Param("me_id")String me_id);

	boolean updatePost(@Param("post")PostVO post);

	void updateView(@Param("po_num")int num);
	
	ArrayList<CommentVO> selectCommentList(@Param("cri")Criteria cri);

	int selectTotalCountComment(@Param("cri")Criteria cri);

	boolean insertComment(@Param("comment")CommentVO comment);

	CommentVO selectComment(@Param("co_num")int num);

	boolean deleteComment(@Param("co_num")int num);

	boolean updateComment(@Param("comment")CommentVO comment);

	void renewalComment();

	void insertHead(@Param("insertHead")HeadVO insertHeader);
	
	void updateHead(@Param("updateHead")HeadVO updateHeader);

	void deleteHead(@Param("deleteHead")HeadVO deleteHeader);

	int selectAllPostNum();

	ArrayList<PostVO> selectMyPost(String me_id);

	ArrayList<PostVO> selectPost();

	ArrayList<PostVO> selectPostList(@Param("cri") Criteria cri);

	int selectTotalCount(@Param("cri") Criteria cri);
	
	ArrayList<CategoryVO> selectCategoryList();

	ArrayList<BoardVO> selectBoardList();

	LikeVO selectLike(@Param("li")LikeVO like);

	void insertLike(@Param("li")LikeVO like);

	void deleteLike(@Param("li")LikeVO dbLike);

	int selectTotalCountLike(@Param("po_num")int po_num);

	LikeVO selectUserLike(@Param("me_id")String me_id, @Param("po_num")int po_num);

	ArrayList<CommentVO> selectMyComment(@Param("me_id")String me_id);

	

	
}
