package com.chanyongyang.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.nio.file.Files;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chanyongyang.domain.AddressVO;
import com.chanyongyang.domain.Criteria;
import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.domain.ReviewVO;
import com.chanyongyang.service.CouMemberService;
import com.chanyongyang.service.MemberService;
import com.chanyongyang.service.OrderServicve;
import com.chanyongyang.service.ProductService;
import com.chanyongyang.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("member")
@AllArgsConstructor
@Log4j
public class MemberController {
   
   private static final String PATH = "c:/semiimg";
	
	
   private MemberService memberService;
   
   private ProductService productService;
   
   /**
    * @author pyj
    * 리뷰 관리 서비스
    * 
    */
   private ReviewService reviewService;
   
   private CouMemberService coumemberService;
   
   
   @Autowired
   private JavaMailSender mailSender;
   
   @GetMapping("login")
   public void login(){}

   /**
    * @author 이지윤
    * @param model
    * @param id
    * @param pw
    * @param request
    * @return 메인 페이지
    * 
    * 아이디와 비밀번호를 받아 로그인 하기
    * 리턴 값이 1일 경우만 로그인 성공
    */
   @PostMapping("login") @ResponseBody
   public String login(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpServletRequest request, Model model){
      model.addAttribute("member", memberService.get(id));
      MemberVO member = memberService.get(id);
      String result = "success";
      if(member != null && org.mindrot.jbcrypt.BCrypt.checkpw(pw, memberService.get(id).getPw())){
    	  HttpSession session = request.getSession();
    	  session.setAttribute("member", memberService.get(id));
    	  return result;
      }
      else {
    	  result = "error";
    	  return result;
      }
      
   }
   
   /**
    * @author 이지윤
    * @param request
    * @return 메인 페이지
    * 
    * 세선 종료를 통한 로그아웃
    */
   @GetMapping("logout")
   public String logout(HttpSession session){
      session.invalidate();
      return "redirect:/";
   }
   
   @GetMapping("checkuser")
   public void checkuser(){
   }
   								
   /**
    * @author 이지윤
    * 
    * 회원정보 수정에 들어가기 전 비밀번호를 통해 본인 확인
    * 
    * @author ycy
    * @since 23/04/18
    * 입력된 pw을 getParam으로 가져와서 비교
    */
   @PostMapping("checkuser")
   public String checkuser(String id, String pw, HttpServletRequest request){
      pw = request.getParameter("pw");
   	  if(org.mindrot.jbcrypt.BCrypt.checkpw(pw, memberService.get(id).getPw())) {
   		  return "redirect:/member/pwChange";
   	  }
      else{ 
    	  return "redirect:/member/checkuser";
      }
   }
   
   
   /**
    * @author 이지윤
    * @param model
    * @param id
    * 
    * 로그인한 회원의 아이디, 이름, 이메일 등의 정보 확인
    */
   @GetMapping("mypage")
   public String mypage(Model model, String id, HttpSession session){
	   if(session.getAttribute("member") == null){
		   return "redirect:/member/login";
	   } else {
		   model.addAttribute("member", memberService.get(id));
		   return "/member/mypage";
	   }
   }
   
   /**
    * @author 이지윤
    * 
    * 약관 동의
    */
   @GetMapping("agree")
   public void agree(){
      
   }
   
   @GetMapping("signup")
   public void signup(Model model){
      model.addAttribute("memberlist", memberService.getList());
      
   }
   
   /**
    * @author 이지윤
    * @param vo
    * @return 메인 페이지
    * 
    * 회원가입 시 메인 페이지로 이동
    */
   @PostMapping("signup")
   public String signup(MemberVO vo){
      memberService.register(vo);
      coumemberService.defaultInsert(vo.getId());
      return "redirect:/";
   }
   
   @GetMapping({"modify", "pwChange"})
   public void modify() {}
   
   /**
    * @author 이지윤
    * @param rttr
    * @param vo
    * @return 메인 페이지
    * 
    * 회원 정보 수정 
    */
   @PostMapping("modify")
   public String modify(HttpSession session, MemberVO vo){
	  memberService.modify(vo);
	  session.invalidate();
      return "redirect:/";
   }
   
   /**
    * @author ycy
    * @param rttr
    * @param id
	* @param vo
	* @param request
	* @return
	*/
   @PostMapping("pwChange")
   public String modifyPw(RedirectAttributes rttr, MemberVO vo, HttpSession session) {
		if(memberService.modifyPw(vo)) {
			rttr.addAttribute("result", "success");
			session.invalidate();
		}
		return "redirect:/";
   }

   
   @GetMapping("review")
   public void review(Model model, @SessionAttribute("member") MemberVO vo,Long payNo,Long codeNo){
	   model.addAttribute("product", productService.get(codeNo));
       model.addAttribute("members", memberService.getList());
       model.addAttribute("payNo", payNo);
   }
   
   @PostMapping("review")
   public String addReview(ReviewVO vo, RedirectAttributes rttr, Long payNo, Long codeNo){
	   reviewService.add(vo); // vo는 attach도 포함
	   rttr.addFlashAttribute("result",vo.getRno());
	   return "redirect:/product/payMentDetails/" + payNo;
   }

//   @GetMapping("mail")
//   public void mail() {}
   
   /**
    * @author 이지윤
    * @param email
    * @return 인증번호
    * @throws Exception
    * 
    * 회원가입 시 이메일 인증
    * 6자리 난수를 생성하여 본인 인증
    * 
    */
   @PostMapping("mailCheck")
   @ResponseBody
   public String mailSending(String email) throws Exception{
      
      int certificationNum = (int)(Math.random() * (999999 - 100000 + 1)) + 100000;
      
      String setForm = "fooddeuk0206@gmail.com";
      String toMail = email;
      String title = "푸드득 회원가입 인증 이메일입니다";
      String content = 
            "푸드득에 오신 것을 환영합니다." + 
                "<br><br>" + 
             "인증 번호는 " + certificationNum + "입니다." + 
             "<br>" + 
             "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; 
      
      
      try {
         MimeMessage message = mailSender.createMimeMessage();
         MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
         helper.setFrom(setForm);
         helper.setTo(toMail); //얘가 문제
         helper.setSubject(title);
         helper.setText(content, true);
         
         mailSender.send(message);
         
      } catch (MessagingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      String certify = Integer.toString(certificationNum);
      return certify;
   }
   @GetMapping("deleteId")
   public String deleteId(Model model,  HttpSession session) {
	   MemberVO id = (MemberVO) session.getAttribute("member");
	   memberService.remove(id.getId());
	   session.invalidate();
	   return "redirect:/";
   }
	
	/**
	 * 
	 * @author pyj
	 * @param codeNo
	 * @return 헤더를 가지고 있는 byte타입의 ResponseEntity를 리턴
	 * 
	 * 상품 상세 페이지의 썸네일 이미지 불러오기
	 * Method : GET
	 */
	@GetMapping("thumb/image") @ResponseBody
	public ResponseEntity<byte[]> thumb(@RequestParam("codeNo") Long codeNo){
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