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
}
