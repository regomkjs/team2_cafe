package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;

public interface BoardDAO {

	ArrayList<BoardVO> selectBoardList();

	boolean insertBoard(@Param("board") BoardVO board);

	ArrayList<CategoryVO> selectCategoryList();

	boolean deleteboard(@Param("bo_num") int num, @Param("bo_name") String bo_name);

}
