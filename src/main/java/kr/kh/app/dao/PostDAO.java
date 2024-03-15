package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.PostVO;

public interface PostDAO {

	ArrayList<CategoryVO> selectCategoryList();

	ArrayList<BoardVO> selectBoardList();

	ArrayList<HeadVO> selectHeadList();
	
	void insertHead(@Param("inputHead")HeadVO inputHead);

	void updateHead(@Param("updateHead")HeadVO updateHeader);

	void deleteHead(@Param("deleteHead")HeadVO deleteHead);

	ArrayList<PostVO> selectMyPostList(@Param("me_id")String me_id);

	int selectAllPostNum();


}
