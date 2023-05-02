package com.chanyongyang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.util.Date;


/**
 * 
 * ==============================
 * 			상품 VO
 * ==============================
 * 
 * 상품의 필드들을 정의
 * 번호, 상품명, 구매가, 판매가, 재고, 원산지, 제조사, 유통기한, 등록일자, 상품번호
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("product")
public class ProductVO {
    private Long proNo;
    private String proName;
    private Long proBuyPrice;
    private Long proSalePrice;
    private Long proCnt;
    private String proCountry;
    private String proManf;
    private String proExp;
    private Date proRegdate;
    private Long codeNo;

}
