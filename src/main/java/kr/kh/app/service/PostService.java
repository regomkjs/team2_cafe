package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;

public interface PostService {

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<BoardVO> getBoardList();

	boolean insertHead(HeadVO head);

	ArrayList<HeadVO> getHeadList();

	boolean updateHead(HeadVO updateHeader);


}
