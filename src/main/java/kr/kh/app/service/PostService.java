package kr.kh.app.service;

import java.util.ArrayList;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.HeadVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;



public interface PostService {

	ArrayList<CategoryVO> getCaList();

	ArrayList<BoardVO> getBoList();

	ArrayList<HeadVO> getHeList();

	ArrayList<HeadVO> getHeadListByBoNum(int bo_num);

	boolean insertPost(PostVO post);

	PostVO getPostbyPoNum(int po_num);

	boolean deletePost(int num, String me_id);

	boolean updatePost(PostVO post);

	void updateView(int num);

	ArrayList<CommentVO> getCommentList(Criteria cri);

	int getTotalCountComment(Criteria cri);

	boolean insertComment(CommentVO comment);

	int getTotalCount(Criteria cri);

	boolean deleteComment(int num, MemberVO user);

	boolean updateComment(CommentVO comment);
	
	boolean manageHead(String inputHead, String selectHead, String updateHead, String deleteHead, int bo_num);

	int getAllPostNum();

	ArrayList<PostVO> getMyPostList(String me_id);

	ArrayList<CategoryVO> selectCategory();
		
	boolean deleteCategory(int num);

	boolean insertCategory(ArrayList<CategoryVO> categoryList);

	ArrayList<PostVO> getPoList();

	int getAllpostNum();

	ArrayList<PostVO> getPostList(Criteria cri);

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<BoardVO> getBoardList();

	int like(MemberVO user, int po_num);

	int getTotalCountLike(int po_num);

	boolean getUserLike(MemberVO user, int po_num); 

	ArrayList<CommentVO> getMyCommentList(String me_id);


}
