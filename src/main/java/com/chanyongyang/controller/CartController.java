package com.chanyongyang.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chanyongyang.service.MemberService;
import com.chanyongyang.service.ProductService;

import lombok.Data;
import lombok.extern.log4j.Log4j;

/**
 * @author DG
 * @date 0412
 * 장바구니 컨트롤러
 * get
 */
@Controller
//@RequestMapping("product/*")
@Data
@Log4j
public class CartController {

	/*private static final String PATH = "c:/semiimg";
	
	//@Autowired
	private ProductService productService;
	*/
	
	/**
	 * @author DG
	 * @date 0411
	 * cart.jsp를 호출 하기 위함
	 *//*
	@GetMapping("cart/{codeNo}")
	public String get(Model model, @PathVariable Long codeNo){
		log.info("cart");
		System.out.println("장바구니1");
		model.addAttribute("product", productService.get(codeNo));
		System.out.println(model.addAttribute("product", productService.get(codeNo)));
		return "product/cart";
	}
	
	@GetMapping("cart")
	public String getCart(){
		log.info("cart");
		System.out.println("장바구니2");
		return "product/cart";
	}
	/*
	@GetMapping("thumb/image") @ResponseBody
	public ResponseEntity<byte[]> thumb(@RequestParam("codeNo") String codeNo){
		String filePath = PATH + "/" + codeNo + "/s_" + codeNo + ".png"; 
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
	}*/
}
