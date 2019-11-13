package local.kr.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListVO {
	
	private String orderId;
	private String mid;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private int amount;
	private Date orderDate;
	private String delivery;
	
	private int orderDetailsNum;
	private int inum;
	private int cartStock;
	
	private String iname;
	private String ithumbimg;
	private int price;

}
