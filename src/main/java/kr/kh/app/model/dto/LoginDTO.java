package kr.kh.app.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LoginDTO {
	String id;
	String pw;
	
	public LoginDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
}
