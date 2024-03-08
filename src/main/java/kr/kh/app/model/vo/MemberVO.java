package kr.kh.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	
	private String me_id;
	private String me_pw;
	private String me_email;
	private String me_phone;
	private String me_nick;
	private String me_date;
	private int me_gr_num;
	
	
	public MemberVO(String id, String pw, String email, String phone) {
		this.me_id = id;
		this.me_pw = pw;
		this.me_email = email;
		this.me_phone = phone;
	}
	
}
