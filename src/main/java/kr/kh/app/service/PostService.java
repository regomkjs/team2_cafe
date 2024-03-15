package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.PostVO;

public interface PostService {

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<BoardVO> getBoardList();

	ArrayList<HeadVO> getHeadList();

	boolean manageHead(String inputHead, String selectHead, String updateHead, String deleteHead);

	ArrayList<PostVO> getMyPostList(String me_id);

	int getAllPostNum();
	
	
	
}
