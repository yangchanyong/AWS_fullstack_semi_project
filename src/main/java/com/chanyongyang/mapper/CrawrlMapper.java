package com.chanyongyang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CrawrlMapper {
	
	/**
	 * @author DG
	 * @date 0409
	 * @param map
	 * proidx 상품 번호
	 * proname 상품명
	 * proprice 상품가격
	 * thumb 상품리스트의 사진 주소
	 * codemain 상품의 대분류 코드(육가공품, 만두, 튀김류 등등)
	 * codemiddle 상품의 중분류 코드(새우만두, 새우튀김 등등)
	 */
	@Insert("insert into tbl_productCrawl(proidx, proname, proprice, thumb, codemain, codemiddle) values(#{proidx}, #{proname}, #{proprice}, #{thumb}, #{codemain}, #{codemiddle} )")
	void insert(Map<String, Object> map);
	
	/**
	 * @author DG
	 * @date 0409
	 * @return
	 * tbl_productCrawl -> tbl_productCrawlcopy
	 * 데이터 타입 및 불필요한 데이터 삭제 
	 */
	@Select("select * from tbl_productCrawlcopy")
	List<Map<String, Object>> getList();
	
	/**
	 * @author DG
	 * @date 0409
	 * @return
	 * 상품의 코드 번호 조회
	 */
	@Select("select codeNo from tbl_procode")
	int getCodeNo();
	
	/**
	 * @author DG
	 * @date 0409
	 * @param pidx
	 * @return
	 * 크롤링한 테이블의 특정(pdix) 상품 조회
	 */
	@Select("select * from tbl_productCrawl where pidx = #{pdix}")
	Map<String, Object> select(String pidx);
	
	/**
	 * @author DG
	 * @date 0409
	 * @param map2
	 * 특정 상품의 상세 사진 주소를 추가 
	 */
	@Update("update tbl_productCrawl set prodetail = #{prodetail} where proidx = #{proidx}")
	void updateProDetail(Map<String, String> map2);

}
