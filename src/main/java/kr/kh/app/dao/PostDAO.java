package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.PostVO;

public interface PostDAO {

	ArrayList<CategoryVO> selectCategoryList();

	boolean deleteCategory(@Param("ca")int num);

	boolean insertCategory(@Param("ca") ArrayList<CategoryVO> categoryList);
	

}
