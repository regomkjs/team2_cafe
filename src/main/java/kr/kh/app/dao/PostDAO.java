package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.PostVO;

public interface PostDAO {

	ArrayList<CategoryVO> selectCategory();

	ArrayList<BoardVO> selectBoard();

	ArrayList<PostVO> selectPostByBoNum(@Param("bo_num")int bo_num);

	ArrayList<HeadVO> selectHeadListByBoNum(@Param("bo_num")int bo_num);

	boolean insertPost(@Param("post")PostVO post);

}
