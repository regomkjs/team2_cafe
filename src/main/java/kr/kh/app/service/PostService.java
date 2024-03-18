package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.PostVO;


public interface PostService {

	ArrayList<CategoryVO> selectCategory();
		
	boolean deleteCategory(int num);

	boolean insertCategory(ArrayList<CategoryVO> categoryList);

	ArrayList<PostVO> getPoList();

	ArrayList<BoardVO> getBoList();

	int getAllpostNum();

}
