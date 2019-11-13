package local.kr.domain;

import lombok.Data;

@Data
public class ProductVO {

	private int inum;
	private String iname;
	private String ipicture;
	private String iintroduce;
	private int price;
	private String cateCode;
	private int pnum;
	
	private String ithumbimg;

//	private String cateCodeRef;
//	private String cateName;	
}