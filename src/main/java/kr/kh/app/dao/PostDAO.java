package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.PostVO;

public interface PostDAO {

	ArrayList<CategoryVO> selectCategory();

	boolean deleteCategory(@Param("ca")int num);

	boolean insertCategory(@Param("ca") ArrayList<CategoryVO> categoryList);

	ArrayList<PostVO> selectPost();

	ArrayList<BoardVO> selectBoard();

	int selectAllPostNum();
	
	
	

}
