package com.chanyongyang.admin.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chanyongyang.domain.CouponVO;
import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.service.AdminService;
import com.chanyongyang.service.CouponService;
import com.chanyongyang.service.MemberService;
import com.chanyongyang.service.OrderServicve;
import com.chanyongyang.service.PayMentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


/**
 * 
 * <p>관리자 회원, 쿠폰, 대쉬보드, 수문 상세 및 발송 담당 컨트롤러</p>
 * @author pyj
 * @since 2023-04-17~
 * 
 */
@Controller
@RequestMapping("admin")
@AllArgsConstructor
@Log4j
public class AdminController {

	// 이미지 경로
	private static final String PATH = "c:/semiimg";
	
	// 서비스 모음
	private AdminService adminService;
	private MemberService memberService;
	private OrderServicve orderService;
	private PayMentService payMentService;
	private CouponService couponService;
	
	/**
	 * 
	 * <p>대쉬보드 페이지</p>
	 * 
	 */
	@GetMapping("dashboard")
	public void dashboard(){}
	
	/**
	 * <p>쿠폰 페이지</p>
	 * @param model
	 */
	@GetMapping("coupon")
	public void coupon(Model model){
		model.addAttribute("list", couponService.getList());
	}
	
	/**
	 * 
	 * <p>쿠폰 등록 POST 처리</p>
	 * @param couName
	 * @param couPrice
	 * @return 쿠폰 페이지로 리다이렉트
	 */
	@PostMapping("couponRegister")
	public String couponRegister(String couName, int couPrice){
		CouponVO vo = new CouponVO();
		vo.setCouName(couName);
		vo.setCouPrice(couPrice);
		couponService.register(vo);
		return "redirect:/admin/coupon";
	}
	
	/**
	 * <p>주문 목록 상세 및 발송 페이지</p>
	 * @param model
	 */
	@GetMapping("order")
	public void order(Model model){
		model.addAttribute("list", payMentService.getList());
	}
	
	/**
	 * <p>회원 정보 페이지</p>
	 * @param model
	 */
	@GetMapping("role")
	public void role(Model model){
		model.addAttribute("members", memberService.getList());
	}
	
	/**
	 * 
	 * <p>회원 정보 페이지</p>
	 * 
	 * @param grantNo
	 * @param gradeNo
	 * @param id
	 * @return role.jsp 페이지로 리다이렉트 
	 */
	@PostMapping("role")
	public String role(int grantNo, int gradeNo, String id){
		adminService.modify(grantNo , gradeNo, id);
		return "redirect:/admin/role";
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 17.
	 * @param codeNo
	 * @return
	 * 결제목록에서 보여질 썸네일 이미지 메소드
	 */
	@GetMapping("thumb/image") @ResponseBody
	public ResponseEntity<byte[]> payMenthumb(@RequestParam("codeNo") Long codeNo){
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
	}
	
}
