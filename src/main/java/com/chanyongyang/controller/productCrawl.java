package com.chanyongyang.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * @author DG
 * @since 0406
 * 크롤링을 자바파일
 */
public class productCrawl {
	
	/**
	 * @author DG
	 * @param args
	 * @throws MalformedURLException
	 * @throws IOException
	 * 상품 리스트의 썸네일, 상품명, 가격을 가져오기 위해 TEST하는 Main메서드
	 */
//	public static void main(String[] args) throws MalformedURLException, IOException {
//		Document doc = Jsoup.parse(new URL("https://www.xn--352blxn61avvg.com/product/list.html?cate_no=43"), 50000);//2000은
////		System.out.println(doc);
//		
//		Element ele = doc.selectFirst(".prdList");
////		System.out.println(ele);
//		
//		Elements lis = ele.select("li.item.xans-record-");
//		for(Element e : lis){
//			Elements es2 = e.getElementsContainingText("상품명").eq(1).select("span");
////			e.attr("id")
////			String href = e.selectFirst("a").attr("name");
//			String pidx = e.attr("id").substring(e.attr("id").indexOf("_")+1);
//			String imgSrc = e.selectFirst("img").attr("src");
//			String proname = es2.eq(1).text();
//			String proprice = es2.eq(3).text(); 
////			System.out.println(href);
//			System.out.println(pidx);
//			System.out.println(imgSrc);
//			System.out.println("상품이름 :: "+proname);
//			System.out.println(proprice);
//			System.out.println("=====================");
//
//			
//		}
//	}
	
	
	/**
	 * @author DG
	 * @param args
	 * @throws MalformedURLException
	 * @throws IOException
	 * 상품 상세 설명에 있는 사진들을 수집하기 위해 TEST하는 Main메서드
	 */
	/**
	 * @param args
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public static void main(String[] args) throws MalformedURLException, IOException {
		Document doc = Jsoup.parse(new URL("https://www.xn--352blxn61avvg.com/product/detail.html?product_no=238"), 50000);//2000은
		Element ele = doc.selectFirst("#prdDetail");
		Elements lis = ele.select("img");
		for(Element e: lis){
		}
		
		
	}
}
