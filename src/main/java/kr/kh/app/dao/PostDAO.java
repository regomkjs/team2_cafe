package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.PostVO;

public interface PostDAO {

	ArrayList<CategoryVO> selectCategory();

	ArrayList<BoardVO> selectBoard();

	ArrayList<HeadVO> selectAllHead();

	ArrayList<PostVO> selectPostByBoNum(@Param("bo_num")int bo_num);

	ArrayList<HeadVO> selectHeadListByBoNum(@Param("bo_num")int bo_num);

	boolean insertPost(@Param("post")PostVO post);

	PostVO selectPostByPoNum(@Param("po_num")int po_num);

	boolean deletePost(@Param("po_num")int num, @Param("me_id")String me_id);

	boolean updatePost(@Param("post")PostVO post);

	void updateView(@Param("po_num")int num);
	
	void insertHead(@Param("insertHead")HeadVO insertHeader);
	
	void updateHead(@Param("updateHead")HeadVO updateHeader);

	void deleteHead(@Param("deleteHead")HeadVO deleteHeader);

	int selectAllPostNum();

	ArrayList<PostVO> selectMyPost(String me_id);


}
