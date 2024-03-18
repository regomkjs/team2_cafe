package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;

public interface PostService {
	ArrayList<CategoryVO> getCategoryList();

	ArrayList<BoardVO> getBoardList();

	ArrayList<CategoryVO> selectCategory();

	boolean deleteCategory(int num);
	
	boolean insertCategory(ArrayList<CategoryVO> categoryList);
}
