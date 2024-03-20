package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public interface PostDAO {

	ArrayList<CategoryVO> selectCategory();

	ArrayList<BoardVO> selectBoard();

	ArrayList<HeadVO> selectAllHead();

	ArrayList<PostVO> selectPostByBoNum(@Param("cri")Criteria cri);

	ArrayList<HeadVO> selectHeadListByBoNum(@Param("bo_num")int bo_num);

	boolean insertPost(@Param("post")PostVO post);

	PostVO selectPostByPoNum(@Param("po_num")int po_num);

	boolean deletePost(@Param("po_num")int num, @Param("me_id")String me_id);

	boolean updatePost(@Param("post")PostVO post);

	void updateView(@Param("po_num")int num);

	ArrayList<CommentVO> selectCommentList(@Param("cri")Criteria cri);

	int selectTotalCountComment(@Param("cri")Criteria cri);

	boolean insertComment(@Param("comment")CommentVO comment);

	int selectTotalCountPost(@Param("cri")Criteria cri);

	CommentVO selectComment(@Param("co_num")int num);

	boolean deleteComment(@Param("co_num")int num);

	boolean updateComment(@Param("comment")CommentVO comment);

	void renewalComment();


}
