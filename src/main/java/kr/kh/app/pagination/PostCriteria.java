package kr.kh.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostCriteria extends Criteria {
	private int boNum;
	public PostCriteria(int boNum, int page, int perPageNum, String type, String search) {
		super(page, perPageNum,type,search);
		this.boNum = boNum;
	}

}

