package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LikeVO {
	private int li_num; 
	private String li_me_id;  
	private int li_po_num;
	private int li_state;
	
	public LikeVO(String li_me_id, int li_po_num) {
		this.li_me_id = li_me_id;
		this.li_po_num = li_po_num;
	}
}
