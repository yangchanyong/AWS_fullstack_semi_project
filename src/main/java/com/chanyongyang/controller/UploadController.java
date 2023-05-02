package com.chanyongyang.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.chanyongyang.domain.AttachFileDTO;
import com.chanyongyang.service.ReviewService;

import lombok.Getter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.tasks.UnsupportedFormatException;

/**
 * 
 * @author pyj
 *
 */
@Controller
@Log4j
public class UploadController {

	
	@Getter
	private static final String PATH = "c:/semiimg";
	
	static {
		File file = new File(PATH);
		if(!file.exists()) {
			file.mkdirs();
		}
	}

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("uploadImgAjax")
	public void uploadAjax(){
		log.info("uploadAjax");
	}
	
	
	
	@PostMapping(value = "uploadImgAjax", produces = MediaType.APPLICATION_JSON_VALUE) @ResponseBody
	public List<AttachFileDTO> uploadImgAjax(MultipartFile[] files, MultipartHttpServletRequest request){
		log.warn("uploadAjax post");
		System.out.println(files);
		List<AttachFileDTO> list = new ArrayList<>();
		
		File uploadPath = new File(PATH, getFolder());
		if(!uploadPath.exists()){
			uploadPath.mkdirs();
		}
		for(MultipartFile m : files){
			
			String uuidStr = UUID.randomUUID().toString();
			String tName = uuidStr + "_" + m.getOriginalFilename();
			File f = new File(uploadPath,tName);
			boolean image = false;
			try {
				image = isImage(f); 
				m.transferTo(f);
				if(image){
					// 썸네일 처리 => 안그러면 트래픽이 기하급수적으로 증가하므로 반드시 처리
					File f2 = new File(uploadPath,"s_" + tName);
					Thumbnails.of(f).crop(Positions.CENTER).size(200, 200).toFile(f2);
				}
			}catch(UnsupportedFormatException e){
				image = false;
			}catch (IOException e) {
				e.printStackTrace();
			}
			AttachFileDTO dto = new AttachFileDTO();
			dto.setUuid(uuidStr);
			dto.setPath(getFolder());
			dto.setImage(image);
			dto.setOrigin(m.getOriginalFilename());
			list.add(dto);
		}
		System.out.println(list);
		return list;
	}
	
	
	@GetMapping(value = "display") @ResponseBody
	public ResponseEntity<byte[]> getFile(AttachFileDTO dto, Boolean thumb){ // thumb에 대한 여부
		
		String s = PATH + "/" + dto.getPath() + "/" + (thumb != null && thumb ? "s_" : "") + dto.getUuid() + "_" + dto.getOrigin();
		System.out.println(s);
		
		File file = new File(s);
		log.info("exist() : " + file.exists());
		log.info(thumb);
		
		
		
		ResponseEntity<byte[]> result = null;
		try {
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@GetMapping("download") @ResponseBody
	public ResponseEntity<byte[]> download(AttachFileDTO dto){ // thumb에 대한 여부
		
		String s = PATH + "/" + dto.getPath() + "/" + dto.getUuid() + "_" + dto.getOrigin();
		System.out.println(s);
		
		File file = new File(s);	
		ResponseEntity<byte[]> result = null;
		try {
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", MediaType.APPLICATION_OCTET_STREAM_VALUE);
			headers.add("Content-Disposition","attachment; filename=" +new String(dto.getOrigin().getBytes("utf-8"), "iso-8859-1"));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("deleteFile") @ResponseBody
	public String deleteFile(AttachFileDTO dto){
		return reviewService.deleteFile(dto);
	}
	
	
	
	
	
	
	private String getFolder(){
		return new SimpleDateFormat("yyyy/MM/dd").format(new Date());
	}
	private boolean isImage(File file) throws IOException{
		List<String> excludes = Arrays.asList("ico", "webp");
		int idx = file.toString().lastIndexOf(".");
		if(idx == -1){
			return false;
		}
		String ext = file.toString().substring(idx + 1);
		if(excludes.contains(ext)){
			return false;
		}
		String mime = Files.probeContentType(file.toPath());
		
		return mime != null && mime.startsWith("image");
	}
	
	
	@PostMapping("/ckImage") @ResponseBody
	public Map<String, Object> uploadAjax(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		MultipartFile multipartFile = request.getFile("upload");
		
		String origin = multipartFile.getOriginalFilename();
		
		String uuidStr = UUID.randomUUID().toString();
		String tName = uuidStr + "_" + origin;
		
		File uploadPath = new File(PATH, getFolder());
		if(!uploadPath.exists()){
			uploadPath.mkdirs();
		}
		File f = new File(uploadPath, tName);			// 이 경로에 파일을 생성
		AttachFileDTO dto = new AttachFileDTO();
		dto.setUuid(uuidStr);
		dto.setPath(getFolder());
		dto.setOrigin(origin);
		
		
		multipartFile.transferTo(f);
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("uploaded", true);
		
		map.put("url", request.getContextPath() + "/display"+dto.getUrl());
		
		return map;
	}
	
//	@PostMapping("/ckImage") @ResponseBody
//	public Map<String, Object> uploadAjax(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
////		log.info(request);
//		MultipartFile multipartFile = request.getFile("upload");
//		log.info(multipartFile);
//		
//		String origin = multipartFile.getOriginalFilename();
//		String uuidStr = UUID.randomUUID().toString();
//		
//		String tName =  uuidStr + "_" + origin; //파일명
//		File uploadPath = new File(PATH, getFolder());
//		if(!uploadPath.exists()){
//			uploadPath.mkdirs();
//		}
//		File f = new File(uploadPath, tName);			// 이 경로에 파일을 생성
//		boolean image = false;
//		try {
//			image = isImage(f); 
//			multipartFile.transferTo(f);
//			if(image){
//				// 썸네일 처리 => 안그러면 트래픽이 기하급수적으로 증가하므로 반드시 처리
//				File f2 = new File(uploadPath,"s_" + tName);
//				Thumbnails.of(f).crop(Positions.CENTER).size(200, 200).toFile(f2);
//			}
//		}catch(UnsupportedFormatException e){
//			image = false;
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		AttachFileDTO dto = new AttachFileDTO();
//		dto.setUuid(uuidStr);
//		dto.setPath(getFolder());
//		dto.setImage(image);
//		dto.setOrigin(multipartFile.getOriginalFilename());
//		
//		multipartFile.transferTo(f);
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("uploaded", true);
//		
//		map.put("url", "/display"+dto.getUrl());
//		
//		log.info(map);
//		return map;
//	}
}
