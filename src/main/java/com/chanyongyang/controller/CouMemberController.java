package com.chanyongyang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chanyongyang.domain.CouMemberVO;
import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.service.CouMemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("coumember/*")
public class CouMemberController {
	private CouMemberService couMemberService;
	
	/**
	 * @author 이지윤
	 * @param session
	 * @param model
	 * 회원이 보유하고 있는 쿠폰 리스트 출력
	 */
	 @GetMapping("list")
	   public String get(HttpSession session, Model model){
	      if(session.getAttribute("member") == null){
	    	  return "redirect:/member/login";
	      } else {
	    	  MemberVO member = (MemberVO) session.getAttribute("member");
	    	  model.addAttribute("coumembers", couMemberService.couList(member.getId()));
	    	  return "coumember/list";
	      }
	   }
	
}
