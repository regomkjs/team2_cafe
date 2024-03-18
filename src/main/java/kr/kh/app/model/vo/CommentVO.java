package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentVO {
	
	private int co_num;
	private int co_ori_num; 
	private String co_writer; 
	private String co_content; 
	private String co_datetime; 
	private String co_me_id; 
	private int co_po_num;
	
	public CommentVO(int po_num, String me_id, String co_content, String me_nick) {
		co_writer = me_nick;
		co_po_num = po_num;
		this.co_content = co_content;
		co_me_id = me_id;
		co_ori_num = 0;
	}
	
}
