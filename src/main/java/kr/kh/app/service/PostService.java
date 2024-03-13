package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.CategoryVO;


public interface PostService {

	ArrayList<CategoryVO> selectCategory();
		
	boolean deleteCategory(int num);

	boolean insertCategory(ArrayList<CategoryVO> categoryList);

}
