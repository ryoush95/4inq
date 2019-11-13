package local.kr.domain;

import lombok.Data;

@Data
public class CartListVO {

	private int cartnum;
	private String mid;
	private int inum;
	private int cartstock;
	
	private int num;
	private String iname;
	private int price;
	private String ithumbimg;
}
