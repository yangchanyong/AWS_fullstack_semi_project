package com.chanyongyang.crawl;

import com.chanyongyang.mapper.CrawrlMapper;

import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

import static org.junit.Assert.assertNotNull;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author DG
 * @since 0406
 * 크롤링 하기위한 Tests클래스
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class productCrawlTests {

	
    @Autowired
    private CrawrlMapper mapper;

    @Test
    public void testExist(){
        assertNotNull(mapper);
    }
    /**
     * @author DG
     * @throws MalformedURLException
     * @throws IOException
     * @since 0406
     * 상품명, 상품가격, 썸네일을 크롤링하고 Insert 하는 메서드
     */
    @Test
    public void parse() throws MalformedURLException, IOException {
    	String url ="https://www.xn--352blxn61avvg.com/product/list.html?cate_no=51/";
    	int i = 8;
    	int idx = 30;
    	Document doc = Jsoup.parse(new URL(url), 50000);//2000은
    	Element ele = doc.selectFirst(".prdList");

    	Elements lis = ele.select("li.item.xans-record-");
    	for(Element e : lis){
			Elements es2 = e.getElementsContainingText("상품명").eq(1).select("span");
//			e.attr("id")
//			String href = e.selectFirst("a").attr("name");
			String proidx = e.attr("id").substring(e.attr("id").indexOf("_")+1);
			String imgSrc = e.selectFirst("img").attr("src");
			String proname = es2.eq(1).text();
			String proprice = es2.eq(3).text(); 
//			System.out.println(href);
//			System.out.println(pidx);
//			System.out.println(imgSrc);
//			System.out.println("상품이름 :: "+proname);
//			System.out.println(proprice);
//			System.out.println("=====================");

            Map<String, Object> map = new HashMap<String, Object>();
            map.put("proidx", proidx);
            map.put("proname", proname);
            map.put("proprice", proprice);
            map.put("thumb", imgSrc);
            map.put("codemain", i);
            map.put("codemiddle", idx);
//            map.put("codesub", 1);
           
            
//            mapper.insert(map);
        }
    }
    
    
    /**
     * @author DG
     * @throws MalformedURLException
     * @throws IOException
     * @since 0406, 0409
     * 상품 상세 사진 및 썸네일 사진 을 영속화 하기 위한 메서드
     */
    @Test
	public void testDownloadThumbs() throws MalformedURLException, IOException{
    	List<Map<String, Object>> list = mapper.getList();
		for(Map<String, Object> m : list){
			String t =m.get("prodetail").toString();
//			String t =m.get("thumbs").toString();
			System.out.println(t);
			InputStream istream = new URL(t).openStream();
			
			File file = new File("c:/semiimg",m.get("proidx").toString());
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(file,m.get("proidx").toString()+ "_detail" + t.substring(t.lastIndexOf(".")));
			System.out.println(file);
			FileUtils.copyInputStreamToFile(istream, file);
		}
	}
    
    
    /**
     * @author DG
     * @throws MalformedURLException
     * @throws IOException
     * @since 0407
     * 상품 상세 페이지의 사진을 DB에 저장하는 것과 AWS내에 드라이브에 저장하기 위한 메서드
     */
    @Test
	public void crawlDetail() throws MalformedURLException, IOException{
    	System.out.println("시작");
    	
		List<Map<String, Object>> list = mapper.getList();
		Map<String, String> map2 = new HashMap<>();
		
		for (Map<String, Object> m : list) {
			String url = "https://www.xn--352blxn61avvg.com/product/detail.html?product_no=" + m.get("proidx");
			map2.put("proidx", m.get("proidx").toString());
			String prodetail = "https://www.xn--352blxn61avvg.com";
			Document doc = Jsoup.parse(new URL(url), 2000);// 2000은 시간? 상세페이지
			Element ele = doc.selectFirst("#prdDetail");
			Elements lis = ele.select("img");
			String proidx = m.get("proidx").toString();
			for(Element e: lis){
				System.out.println("======================시작========================");
				prodetail += e.attr("ec-data-src");
				System.out.println(prodetail);
				System.out.println("========================끝======================");
			}
			map2.put("prodetail", prodetail);
			mapper.updateProDetail(map2);
			
		}
	}
}
