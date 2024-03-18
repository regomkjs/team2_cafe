package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HeadVO {
	private int he_num; 
	private String he_name; 
	private int he_bo_num;
	
	public HeadVO(String he_name, int he_bo_num) {
		this.he_name = he_name;
		this.he_bo_num = he_bo_num;
	}
	
	public HeadVO(int he_num) {
		this.he_num = he_num;
	}
	
	public HeadVO(int he_num, String he_name) {
		this.he_num = he_num;
		this.he_name = he_name;
	}
}
