package com.chanyongyang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 *
 * @author DG
 * @since 04-05
 * 상품코드
 * tbl_proCode의 VO
 * codeNo : 실제 상품의 idx
 * codeMainC : 대분류(육가공품, 만두 등등)
 * codeMiddleC : 중분류 (고기만두, 베이컨 등등)
 * codeSubC : 소분류 (미정)
 * codeRegDate : 코드 등록 날짜
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("proCode")
public class ProCodeVO {
    private Long codeNo;
    private Long codeMainC;
    private Long codeMiddleC;
    private Long codeSubC;
    private Date codeRegdate;
    
    // 카테고리 탐색
    public ProCodeVO(Long codeMainC, Long codeMiddleC){
    	this.codeMainC = codeMainC;
    	this.codeMiddleC = codeMiddleC;
    }
    
}
