package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.CategoryVO;

public interface PostService {

	ArrayList<CategoryVO> getCommunityList();
		
	boolean deleteCategory(int num);

}
