package local.kr.domain;


import lombok.Data;

@Data
public class OrderDetailVO {

	private int orderDetailNum;
	private String orderId;
	private int inum;
	private int cartstock;
	private String mid;
}
