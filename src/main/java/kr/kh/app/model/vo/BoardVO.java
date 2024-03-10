package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int bo_num; 
	private String bo_name; 
	private String bo_ca_name;
	
	public BoardVO(int bo_num2, String name1) {
		this.bo_num = bo_num2;
		this.bo_name = name1;
	}
}
