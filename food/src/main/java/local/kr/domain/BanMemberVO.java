package local.kr.domain;

import lombok.Data;

@Data
public class BanMemberVO {
   
   private int bmno;
   private String bmid;
   private String reason;
}