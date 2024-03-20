package kr.kh.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentCriteria extends Criteria {
	private int poNum;
	
	public CommentCriteria(int poNum, int page, int perPageNum) {
		super(page, perPageNum);
		this.poNum = poNum;
	}

}
