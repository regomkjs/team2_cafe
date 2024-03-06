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
	private String po_he_num;
	private String po_me_id;
}
