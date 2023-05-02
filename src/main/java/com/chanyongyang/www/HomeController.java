package com.chanyongyang.www;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chanyongyang.domain.Criteria;
import com.chanyongyang.service.BoardService;
import com.chanyongyang.service.MemberService;
import com.chanyongyang.service.ProductService;
import com.chanyongyang.service.ProductServiceImpl;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@RequestMapping("/")
public class HomeController {
	
	// 외부 이미지 경로
	private static final String PATH = "c:/semiimg";
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BoardService boardService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping(value = "/")
	public String home(Model model, Criteria cri, HttpServletRequest req) {
		req.getServletContext().setAttribute("boardIndex", boardService.getList(new Criteria(1, 3, null, 1)));
		model.addAttribute("newProduct", productService.getNewProduct(cri));
//		model.addAttribute("board", boardService.getList(new Criteria(1, 3, null, 1)));
		
		
		
		return "index";
	}
	
	@GetMapping("404page")
	public String page404(){
		return "404page";
	}
	@GetMapping("500page")
	public String page500(){
		return "500page";
	}
	
	/**
	 * 
	 * @author pyj
	 * @param codeNo
	 * @return 헤더를 가지고 있는 byte타입의 ResponseEntity를 리턴
	 * 
	 * 상품 상세 페이지의 대표 이미지 불러오기
	 * Method : GET
	 */
	@GetMapping("index/image") @ResponseBody
	public ResponseEntity<byte[]> represent(@RequestParam("codeNo") Long codeNo){
		
		String filePath = PATH + "/" + codeNo + "/" + codeNo + ".png"; 
		File file = new File(filePath);
		
		// 확장자명이 png가 아니라면 jpg로 교체
		if(!file.exists()){
			String ext = filePath.substring(filePath.lastIndexOf("."));
			String replacedExt = filePath.replace(ext, ".jpg");
			file = new File(replacedExt);
		}
		
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders headers = new HttpHeaders();	
			headers.add("Content-Type", Files.probeContentType(file.toPath()));  
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
}
