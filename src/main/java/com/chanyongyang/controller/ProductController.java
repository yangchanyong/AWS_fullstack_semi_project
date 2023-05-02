package com.chanyongyang.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.HeadersBuilder;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.chanyongyang.domain.AttachVO;
import com.chanyongyang.domain.CartVO;
import com.chanyongyang.domain.Criteria;
import com.chanyongyang.domain.MemberVO;
import com.chanyongyang.domain.OrderVO;
import com.chanyongyang.domain.PageDto;
import com.chanyongyang.domain.PayMentVO;
import com.chanyongyang.domain.ProCodeVO;
import com.chanyongyang.domain.ProductVO;
import com.chanyongyang.domain.ReviewVO;
import com.chanyongyang.service.AddressService;
import com.chanyongyang.service.CartService;
import com.chanyongyang.service.CouMemberService;
import com.chanyongyang.service.MemberService;
import com.chanyongyang.service.OrderServicve;
import com.chanyongyang.service.PayMentService;
import com.chanyongyang.service.ProductService;
import com.chanyongyang.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;


/**
 * 
 * <p>상품 관련 컨트롤러</p>
 * @author ycy, DG, pyj
 * 
 */
@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
@Log4j
public class ProductController {

	private static final String PATH = "c:/semiimg";
	
	// 서비스 모음
	private ProductService productService;
	private CartService cartService;
	private MemberService memberService;
	private AddressService addressService;
	private PayMentService paymentService;
	private OrderServicve orderServicve;
	private ReviewService reviewService;
	private CouMemberService couMemberService;
	
	/**
	 * @author ycy
	 * @param model
	 * @param cri
	 * @since 23/04/09, 23/04/11
	 * 상품 리스트 출력, 상품 페이징 처리
	 * 
	 */
	@GetMapping("list")
	public void list(Model model, Criteria cri) {
		
		PageDto dto = new PageDto(productService.getTotalCnt(cri), cri);
		
		model.addAttribute("page", dto);
		model.addAttribute("cri", cri);
		model.addAttribute("list", productService.getList(cri));
	}
	
	
	/**
	 * @author ycy
	 * @param model
	 * @param cri
	 * @since 23/04/12
	 * 신상품 리스트 출력
	 */
	@GetMapping("newProduct")
	public void newProduct(Model model, Criteria cri) {
		model.addAttribute("newProduct", productService.getNewProduct(cri));
	}

	
	/**
	 * <p>상품 상세 페이지 조회</p>
	 * <p>method: GET</p>
	 * @author pyj
	 * @param model
	 * @param vo
	 * @param codeNo
	 * @since 23/04/21
	 * 
	 */
	@GetMapping("{codeNo}")
	public String detailByPath(Model model, HttpSession session, @PathVariable Long codeNo) {
//		if (session.getAttribute("member")== null) {
//			return  "member/login";
//		} else {
			
			List<MemberVO> memberList = memberService.getList();
			ProCodeVO product = productService.findBy(codeNo);
			model.addAttribute("reviewList", reviewService.getListByCodeNo(codeNo));
			model.addAttribute("product", productService.get(codeNo));
			model.addAttribute("reviewCnt", reviewService.getTotalReviewCnt(codeNo));
			model.addAttribute("memberList", memberList);
			if(session.getAttribute("member")==null){
				model.addAttribute("revice", reviewService.getListCodeNo(codeNo));
			}else{
				MemberVO vo = (MemberVO)session.getAttribute("member");
				model.addAttribute("review", reviewService.findBy(codeNo, vo.getId()));
				model.addAttribute("orderlist", orderServicve.getListByCodeNo(codeNo));
			}
			model.addAttribute("careProduct", productService.getCareProduct(product));
			
			return "product/detail";
//		}

	}
	
	
	/**
	 * 
	 * <p>상품 리뷰 업로드 성공 맵핑</p>
	 * <p>method : POST</p>
	 * @author pyj
	 * @param vo
	 * @param rttr
	 * @param codeNo
	 * @return "redirect:/product/" + codeNo;

	 */
	@PostMapping("{codeNo}")
	public String completeReviewUpload(ReviewVO vo, RedirectAttributes rttr, @PathVariable Long codeNo){
		reviewService.add(vo);
		return "redirect:/product/" + codeNo;
	}
	
	/**
	 * <p>해당 리뷰 글 삭제</p>
	 * <p>method : POST</p>
	 * @param codeNo
	 * @param rno
	 * @param rttr
	 * @return "redirect:/product/" + codeNo;

	 */
	@PostMapping("{codeNo}/{rno}")
	public String completeDelete(@PathVariable Long codeNo,@PathVariable Long rno, RedirectAttributes rttr){
		// 글이 삭제되기 전에 해당 Attach들 list로 불러오기
		List<AttachVO> list = reviewService.findBy(rno).getAttachs();
		if(reviewService.remove(rno)){
			for(AttachVO vo : list){
				reviewService.deleteFile(vo);
			}
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/product/" + codeNo;
	}
	/**
	 * <p>상품 상세 페이지의 상세 정보 이미지 불러오기</p>
	 * <p>Method : GET</p>
	 *  
	 * @param codeNo
	 * @author pyj
	 * @return 헤더를 가지고 있는 byte타입의 ResponseEntity를 리턴
	 * 
	 */
	@GetMapping("description/image") @ResponseBody
	public ResponseEntity<byte[]> descript(@RequestParam("codeNo") Long codeNo){
		String filePath = PATH + "/" + codeNo + "/" + codeNo + "_detail.png"; 
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
	
	/**
	 * 
	 * @author pyj
	 * @param codeNo
	 * @return 헤더를 가지고 있는 byte타입의 ResponseEntity를 리턴
	 * 
	 * 상품 상세 페이지의 대표 이미지 불러오기
	 * Method : GET
	 */
	@GetMapping("represent/image") @ResponseBody
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
	/**
	 * 
	 * @author pyj
	 * @param codeNo
	 * @return 헤더를 가지고 있는 byte타입의 ResponseEntity를 리턴
	 * 
	 * 상품 상세 페이지의 썸네일 이미지 불러오기
	 * Method : GET
	 */
	@GetMapping("cart/thumb/image") @ResponseBody
	public ResponseEntity<byte[]> cartThumb(@RequestParam("codeNo") Long codeNo){
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
	/**
	 * @author DG
	 * @date 2023. 4. 14.
	 * @param codeNo
	 * @param session
	 * @param cartCnt
	 * @param model
	 * @return
	 * 장바구니에 상품 추가(사용안할것 같음 : 비동기 처리로 전환 insertProduct)
	 */
	
	@PostMapping("cart/{codeNo}")
	public String insertCartPost(@PathVariable Long codeNo, HttpSession session, Model model, Integer cartCnt){
		if(session.getAttribute("member")==null){
			return "redirect:/member/login";
		}else{
			model.addAttribute("product", productService.get(codeNo));
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			CartVO cvo = new CartVO(codeNo, mvo.getId(), cartCnt);
			cartService.register(cvo);
			return "";
		}
		
	
	}
	
	
	
	
	
	/**
	 * @author DG
	 * @date 2023. 4. 11.
	 * cart.jsp를 호출 하기 위함
	 */
	@GetMapping("cart/{codeNo}/{cartCnt}")//받을떄 필요한 값
	public String get(Model model, @PathVariable Long codeNo, @PathVariable Integer cartCnt, HttpSession session){
		model.addAttribute("product", productService.get(codeNo));
		model.addAttribute("cnt", cartCnt);
		
		return "product/cart";
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 15.
	 * @param codeNo
	 * @param cnt
	 * @param session
	 * @return
	 * 장바구니 버튼 클릭시 회원의 상품 목록 추가
	 */
	@GetMapping("cart")
	public String getCart(Long codeNo, String cnt, HttpSession session, Model model, Criteria cri){
		
		if(session.getAttribute("member")==null){
			return "member/login";
		}else{
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			model.addAttribute("list", cartService.getList(mvo));
			
			model.addAttribute("listCount", cartService.getList(mvo).size());
			model.addAttribute("addr", addressService.getList(mvo.getId()));
			return "/product/cart";
		}
	}

	/**
	 * @author DG
	 * @date 2023. 4. 14.
	 * @param codeNo
	 * @param cartCnt
	 * @param session
	 * @param response
	 * @return
	 * @throws IOException
	 * 장바구니 버튼시 비동기로 상품을 장바구니에 추가
	 */
	@PostMapping("insertProduct") @ResponseBody
	public String insertProduct(@RequestParam("codeNo") Long codeNo, @RequestParam("cartCnt") Integer cartCnt,HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException{
		String result="";
		if(session.getAttribute("member")==null){
			 result = "fail";
		}else{
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			CartVO cvo = new CartVO(codeNo, mvo.getId(), cartCnt);
			if(cartService.getSelectOne(codeNo, mvo.getId())==null){
				cartService.register(cvo);
			}else{
				int selectCnt = cartService.getSelectOne(codeNo, mvo.getId()).getCartCnt();
				int totalCnt = selectCnt + cartCnt;
				cartService.modify(totalCnt, codeNo, mvo.getId());
			}
			result = "success";
		}
		return result;
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 15.
	 * @param codeNo
	 * @param session
	 * @return
	 * 상품 삭제하는 메서드
	 */
	@PostMapping("deleteProduct") @ResponseBody
	public String deleteProduct(Long codeNo, HttpSession session, Model model){
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		cartService.remove(codeNo, mvo.getId());
		String result="sueccss";
		return result;
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 16.
	 * @param codeNo
	 * @param cartCnt
	 * @param session
	 * @return
	 * 수량이 변경 될때 마다 DB값을 수정하는 메서드
	 */
	@PostMapping("updateProduct") @ResponseBody
	public String updateProduct(Long codeNo, int cartCnt, HttpSession session){
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		String result="";
		cartService.modify(cartCnt, codeNo, mvo.getId());
		return result;
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 16.
	 * @param id
	 * @param pw
	 * @param request
	 * @return
	 * 로그인 처리 이후 다시 장바구니로 돌아오는 메서드
	 */
	@PostMapping("/cart")
	public String login(String id, String pw, HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("member", memberService.get(id));
		return "redirect:/product/cart";
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 17.
	 * 결제 페이지로 이동하는 메서드
	 */
	@GetMapping("payMent")
	public String payMent(Model model, HttpSession session){
		if(session.getAttribute("member")==null){
			return "member/login";
		}else{
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			/*if(addressService.getList(mvo.getId()).size()==0){
				return "/address/list";
			}else{*/
				model.addAttribute("admin",memberService.get("admin"));
				model.addAttribute("addrlist", addressService.getList(mvo.getId()));
				model.addAttribute("prolist",cartService.getList(mvo));
				model.addAttribute("coupon", couMemberService.couList(mvo.getId()));
				return "/product/payMent";
			/*}*/
		}
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 17.
	 * @param codeNo
	 * @return
	 * 결제목록에서 보여질 썸네일 이미지 메소드
	 */
	@GetMapping("payMent/thumb/image") @ResponseBody
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
	
	/**
	 * @author DG
	 * @date 2023. 4. 20.
	 * @param payCode
	 * @param addrNo
	 * @param session
	 * @param model
	 * @return
	 * 실제 결제가 완료 되고, 테이블에 값이 저장될 메소드
	 */
	@PostMapping("/payMent/paymentSuccess") @ResponseBody
	public String payMent(@RequestParam("procode")Long codeNo, @RequestParam("payCode") int payCode, @RequestParam("addrNo")int addrNo, @RequestParam("pay_method") String payMethod, @RequestParam("card_name") String cardCompany, @RequestParam("card_number") String cardNumber, @RequestParam("installment")String installment, @RequestParam("coumemberNo")int coumemberNo,  @RequestParam("cartBuy")int cartBuy, @RequestParam("proCnt") int cartCnt, HttpSession session, Model model){
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		paymentService.register(payCode, mvo.getId(), payMethod, cardCompany, cardNumber, installment);//register에 int 값을 return 받아서 결제 여부를 확인 해도 좋을 것 같음
		int payNo = paymentService.getPayNo(payCode, mvo.getId()).getPayNo();
		System.out.println(mvo.getId()+","+payNo+","+ addrNo+","+ coumemberNo);
		orderServicve.register(codeNo, mvo.getId(), payNo, addrNo, coumemberNo, cartBuy, cartCnt);
		couMemberService.modify(mvo.getId(), coumemberNo);
		if(cartBuy==0){
			cartService.removeAll(mvo.getId());
		}
		
		String result = "";
		result = String.valueOf(payNo);
		
//		result="success";
		return result; 
	}
	

	

	   /**
	 * @author DG
	 * @date 2023. 4. 20.
	 * @param model 
	 * @param session
	 * @param payNo
	 * @return
	 * 실제 결제가 이루어진다음 결제 내역을 보여주는 메서드
	 */
	@GetMapping("payMentDetails/{payNo}")
	public String payMentDetails(Model model, HttpSession session, @PathVariable int payNo) {
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		if (paymentService.get(payNo, mvo.getId()).getPayNo() == payNo) {
			List<OrderVO> orderList = orderServicve.getSelectOne(payNo, mvo.getId());
			PayMentVO payList =  paymentService.get(payNo, mvo.getId());
			model.addAttribute("paylist", payList);
			model.addAttribute("orderlist", orderList);
			if(couMemberService.get(mvo.getId(), orderServicve.getSelectOne(payNo, mvo.getId()).get(0).getCoumemberNo())!=null){
				model.addAttribute("coupon", couMemberService.get(mvo.getId(), orderServicve.getSelectOne(payNo, mvo.getId()).get(0).getCoumemberNo()).getCouPrice());
			}
			List<OrderVO> existReviews = new ArrayList<>();
			List<OrderVO> nonReviews = new ArrayList<>();
			for(OrderVO vo : orderList){
				if(reviewService.existsReview(vo.getCodeNo(), mvo.getId()) == 1){
					existReviews.add(vo);
				}
				if(reviewService.existsReview(vo.getCodeNo(), mvo.getId()) == 0){
					nonReviews.add(vo);
				}
			}
			model.addAttribute("existReviewList", existReviews);
			model.addAttribute("nonReviewList", nonReviews);
			model.addAttribute("addr",
					addressService.get(Long.valueOf(orderServicve.get(payNo, mvo.getId()).get(0).getAddrNo())));
			return "/product/payMentDetails";
		} else {
			return "/";// 이동시킬 장소 해줘야됨
		}
	}
	 
	  /**
	 * @author DG
	 * @date 2023. 4. 22.
	 * @param model
	 * @param id
	 * @param cri
	 * @param session
	 * @return
	 * 해당 회원의 결제내역 전체 조회
	 */
	@GetMapping("orderList")
	public String payMentList(Model model, String id, Criteria cri, HttpSession session) {
		if (session.getAttribute("member") == null) {
			return "member/login";
		} else {
			MemberVO mvo = (MemberVO) session.getAttribute("member");
			model.addAttribute("member", memberService.get(id));
			model.addAttribute("orderList", orderServicve.getList(mvo.getId()));
			return "/product/orderList";
		}
	}
	
	/**
	 * @author DG
	 * @date 2023. 4. 23.
	 * @param payNo
	 * @param session
	 * @return
	 * 주문내역 삭제
	 */
	@PostMapping("deleteOrder")
	@ResponseBody
	public String deleteOrder(int payNo, HttpSession session) {
		System.out.println("deleteOrder");
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		orderServicve.remove(payNo, mvo.getId());
		String result = "success";
		return result;
	}
	
	
	/**
	 * @author DG
	 * @date 2023. 4. 24.
	 * @param model
	 * @param session
	 * @param codeNo
	 * @param cartCnt
	 * @param salePrice
	 * @return
	 * 단건 구매에를 결제내역으로 옮기기 위한 메서드
	 */
	@GetMapping("payMent/{codeNo}/{cartCnt}/{salePrice}") @Transactional
	public String payMentCodeNo(Model model, HttpSession session, @PathVariable Long codeNo,@PathVariable int cartCnt,@PathVariable int salePrice){
		if(session.getAttribute("member")==null){
			return "member/login";
		}else{

			MemberVO mvo = (MemberVO)session.getAttribute("member");
			ProductVO pvo = productService.get(codeNo);
			List<CartVO> cvo = new ArrayList<>();
			cvo.add(new CartVO(codeNo, cartCnt, mvo.getId(), (cartCnt*salePrice), pvo.getProName(), 1));
			model.addAttribute("admin",memberService.get("admin"));
			model.addAttribute("addrlist", addressService.getList(mvo.getId()));
			model.addAttribute("prolist",cvo);
			model.addAttribute("coupon", couMemberService.couList(mvo.getId()));
			return "/product/payMent";
		}
	}
	
	   
}
