package kr.kh.app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList();

	boolean insertBoard(BoardVO board);

	ArrayList<CategoryVO> getcategoryList();

	boolean deleteboard(int num, String bo_name);

	List<Category> getAllCategory();

}
