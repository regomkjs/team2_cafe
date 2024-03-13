package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;

public interface PostDAO {

	ArrayList<CategoryVO> selectCategoryList();

	ArrayList<BoardVO> selectBoardList();

	void insertHead(@Param("inputHead")HeadVO inputHead);

	ArrayList<HeadVO> selectHeadList();

	void updateHead(@Param("updateHead")HeadVO updateHeader);

	void deleteHead(@Param("deleteHead")HeadVO deleteHead);


}
