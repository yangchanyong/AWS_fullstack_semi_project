package com.chanyongyang.controller;

import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chanyongyang.domain.AddressVO;
import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.service.AddressService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("address/*")
@Log4j
@AllArgsConstructor
public class AddressController {

	private AddressService addressService;
	
	/**
	 * @author 이지윤
	 * @param session
	 * @return 배송지 추가시 로그인 전의 경우 로그인 페이지로 이동
	 */
	   @GetMapping("add")
	   public String add(HttpSession session){
		   if(session.getAttribute("member") == null){
			   return "redirect:/member/login";
		   } else {
			   return "address/add";
		   }
	   }

	   /**
	    * @author 이지윤
	    * @param vo
	    * @param session
	    * @return 배송지 추가 후 배송지 리스트 페이지로 redirect
	    */
	   @PostMapping("add")
	   public String add(AddressVO vo, HttpSession session){
		  MemberVO member = (MemberVO) session.getAttribute("member");
		  vo.setId(member.getId());
		  addressService.register(vo);
		  return "redirect:/address/list";
	      
	   }
	   
	   /**
	    * @author 이지윤
	    * @param session
	    * @param model
	    * @return 비 로그인시 로그인 페이지로, 로그인 시 해당 아이디를 통해 등록된 주소 리스트 
	    */
	   @GetMapping("list")
	   public String list(HttpSession session, Model model){
		   if(session.getAttribute("member") == null){
			   return "redirect:/member/login";
		   }
		   else {
			   MemberVO member = (MemberVO) session.getAttribute("member");
			   model.addAttribute("member", member);
			   int count = addressService.count(member.getId());
			   model.addAttribute("addresslist", addressService.getList(member.getId()));
			   model.addAttribute("count", count);
		   }
		   return "address/list";
	   }
	   
	   /**
	    * @author 이지윤
	    * @param addrNo
	    * @param rttr
	    * @return addrNo를 통해 배송지 삭제
	    */
	   @GetMapping("remove")
	   public String remove(Long addrNo, RedirectAttributes rttr) {
			if(addressService.remove(addrNo)) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/address/list";
	   }
	   
	   /**
	    * @author 이지윤
	    * @param session
	    * @param model
	    * @param addrNo
	    * @param vo
	    * @return 비 로그인 시 로그인 페이지로, 로그인 시 modify 페이지로 이동
	    */
	   @GetMapping("modify")
	   public String modify(HttpSession session, Model model, Long addrNo, AddressVO vo){
		   if(session.getAttribute("member") == null){
			   return "redirect:/member/login";
		   } else {
			   MemberVO member = (MemberVO) session.getAttribute("member");
			   model.addAttribute("member", member);
			   model.addAttribute("address", addressService.get(addrNo));
		   }
		   return "address/modify";
	   }
	   
	   /**
	    * @author 이지윤
	    * @param model
	    * @param vo
	    * @return 수정된 배송지 정보 가져옴
	    */
	   @PostMapping("modify")
	   public String modify(Model model, AddressVO vo) {
		   addressService.modify(vo);
		   return "redirect:/address/list";
	   }

}
