package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int bo_num; 
	private String bo_name; 
	private String bo_ca_name;
	

	public BoardVO(String bo_ca_name, String bo_name) {
		this.bo_ca_name = bo_ca_name;
		this.bo_name = bo_name;
	}

	public BoardVO(int bo_num, String bo_name) {
		this.bo_num = bo_num;
		this.bo_name = bo_name;
	}


	public BoardVO(int bo_num) {
		super();
		this.bo_num = bo_num;
	}
}
