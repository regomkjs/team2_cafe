package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CategoryVO {


	private String ca_name;
	
	public CategoryVO(String categoryName) {
		this.ca_name = categoryName;
	}
}
