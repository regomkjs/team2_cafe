package kr.kh.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostCriteria extends Criteria {
	private int boNum;
	private String poId;
	public PostCriteria(int boNum, int page, int perPageNum, String type, String search) {
		super(page, perPageNum,type,search);
		this.boNum = boNum;
	}
	public PostCriteria(String poId, int page, int perPageNum, String type, String search) {
		super(page, perPageNum,type,search);
		this.poId = poId;
	}

}

