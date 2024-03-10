package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.PostVO;

public interface PostDAO {

	ArrayList<CategoryVO> selectCategoryList();

	boolean deleteCategory(@param("num")int num);
	

}
