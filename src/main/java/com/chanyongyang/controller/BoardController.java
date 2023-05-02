package com.chanyongyang.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.HeadersBuilder;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chanyongyang.domain.BoardVO;
import com.chanyongyang.domain.Criteria;
import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.domain.PageDto;
import com.chanyongyang.domain.ProductVO;
import com.chanyongyang.service.BoardService;
import com.chanyongyang.service.MemberService;
import com.chanyongyang.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	private static final String PATH = "c:/semiimg";
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	/**
	 * @author ycy
	 * @param model
	 * @param cri
	 * @since 23/04/09, 23/04/11
	 * 공지사항 리스트 출력, 상품 페이징 처리
	 * 
	 */
	@GetMapping({"notice", "bulk"}) 
	public void list (Model model, Criteria cri, HttpSession session) {
		log.warn("list()");
		log.warn(cri);
		session.getAttribute("member");
		log.warn("session = " + session.getAttribute("member"));
		PageDto dto = new PageDto(boardService.getTotalCnt(cri), cri);
		
		
		model.addAttribute("page", dto);
		model.addAttribute("cri", cri);
		model.addAttribute("member", session.getAttribute("member"));
		model.addAttribute("list", boardService.getList(cri));
		
		MemberVO id = (MemberVO) session.getAttribute("member");
		if(session.getAttribute("member") == null) {
			return;
		}
		else {
			log.warn(id.getId());
			model.addAttribute("listId", boardService.getListId(id.getId()));
		}
	}
	
	@GetMapping({"bno"})
	public String getByPath(Model model, @PathVariable Long bno) {
		log.info("get() or modify()");
		log.info(bno);
		model.addAttribute("board", boardService.get(bno));
		return "board/notice/get";
	}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * 글쓰기 getMapping
	 */
	@GetMapping({"register", "bulkRegister"})
	public void register() {}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * @param vo
	 * @param rttr
	 * @param cri
	 * @param session
	 * @param model
	 * @return 공지사항 글쓰기
	 */
	@PostMapping("register")
	public String register(BoardVO vo, RedirectAttributes rttr, Criteria cri, HttpSession session, Model model) {
		log.warn("register()");
		log.warn("register = " + vo);
		model.addAttribute("member", session.getAttribute("member"));
		log.warn(session.getAttribute("member"));
		boardService.register(vo);
		return "redirect:/board/notice?category=1";
	}
	
	
	
	@PostMapping("bulkRegister")
	public String bulkRegister(BoardVO vo, RedirectAttributes rttr, Criteria cri, HttpSession session, Model model) {
		log.warn("register()");
		log.warn("register = " + vo);
		model.addAttribute("member", session.getAttribute("member"));
		log.warn(session.getAttribute("member"));
		boardService.register(vo);
		return "redirect:/board/bulk?category=2";
	}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * @param model
	 * @param bno
	 * @param cri
	 * 글 상세보기
	 */
	@GetMapping({"get", "modify"})
	public void get(Model model, Long bno, @ModelAttribute("cri")Criteria cri) {
		log.info("get()");
		log.info(bno);
		log.info(cri);
		model.addAttribute("cri", cri);
		model.addAttribute("board", boardService.get(bno));
	}
	@GetMapping("bulkGet")
	public void bulkGet(Model model, Long bno, @ModelAttribute("cri")Criteria cri) {
		log.info("get()");
		log.info(bno);
		log.info(cri);
		model.addAttribute("cri", cri);
		model.addAttribute("board", boardService.get(bno));
	}
	
	/**
	 * @author ycy
	 * @since
	 * @param vo
	 * @param rttr
	 * @param cri
	 * @return 공지사항 수정
	 */
	@PostMapping("modify")
	public String modify(BoardVO vo, RedirectAttributes rttr, Criteria cri) {
		log.info("modify");
		log.info(vo);
		log.info(cri);
		if(boardService.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/notice?category=1";
	}
	
	/**
	 * @author ycy
	 * @since 23/04/16
	 * @param bno
	 * @param rttr
	 * @param cri
	 * @return 글 삭제
	 */
	@PostMapping("remove")
	public String remove(Long bno, RedirectAttributes rttr, Criteria cri) {
		log.warn("remove()");
		log.warn("remove + " + bno);
		log.warn("remove + " + cri);
		if(boardService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/notice?category=1";
	}
}