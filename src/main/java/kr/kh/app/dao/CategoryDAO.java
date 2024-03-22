package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.CategoryVO;

public interface CategoryDAO {
	
	ArrayList<CategoryVO> selectCategory();
	
	boolean deleteCategory(@Param("ca")int num);

	boolean deleteCategory(@Param("ca_name") String ca_name);

	boolean updateCategory(@Param("ca_ori") String caOriName, @Param("ca_new") String caNewName);

	boolean insertCategory(@Param("ca") String ca_name);

	
}
