package local.kr.domain;

import lombok.Data;

@Data
public class ProducterVO {

//	pnum number primary key,
//	pname varchar2 (50) not null,
//	pintroduce varchar2 (2000) not null,
//	paddress varchar2 (200) not null,
//	ppicture varchar2 (200),
//	pthumbimg varchar2 (200)
	
	private int pnum;
	private String pname;
	private String pintroduce;
	private String paddress;
	private String ppicture;
	private String pthumbimg;
	
	
}
