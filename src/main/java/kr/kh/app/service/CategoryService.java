package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.CategoryVO;

public interface CategoryService {

	ArrayList<CategoryVO> selectCategory();

	boolean deleteCategory(String ca_name);

	boolean updateCategory(String caOriName, String caNewName);

	boolean insertCategory(String ca_name);

	
	
}
