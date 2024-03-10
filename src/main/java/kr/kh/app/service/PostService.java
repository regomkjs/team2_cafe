package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.PostVO;

public interface PostService {

	ArrayList<CategoryVO> getCaList();

	ArrayList<BoardVO> getBoList();

	ArrayList<PostVO> getPostByBoNum(int bo_num);

}
