package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostVO {
 	
	private int po_num; 
 	private String po_title; 
 	private String po_content; 
 	private String po_writer;
 	private int po_view; 
 	private String po_datetime; 
	private int po_he_num;
	private String po_me_id;
	private String he_name;
	private String he_bo_num;
	HeadVO head;
	private int bo_num; 
	private String bo_name;
	
	public PostVO(String po_title, String po_content, String po_writer, int po_he_num, String po_me_id) {
		this.po_title = po_title;
		this.po_content = po_content;
		this.po_writer = po_writer;
		this.po_he_num = po_he_num;
		this.po_me_id = po_me_id;
	}
	
}
