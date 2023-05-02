package com.chanyongyang.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chanyongyang.mapper.CrawrlMapper;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.tasks.UnsupportedFormatException;

/**
 * @author DG
 * @date 0410
 * 상품, 상품 상세페이지, 상품리스트를 위한 썸네일 및 사진 작업을 위한 클래스
 */
@Controller
@Log4j
public class CrawrlController {
	private static final String PATH="c:/semiimg";
	private CrawrlMapper mapper;
	
	
	/**
	 * @author DG
	 * @date 0410
	 * uploadAjax.jsp호출을 위한 메서드 
	 */
	@GetMapping("upload")
	public void upload(){
		log.info("upload");
	}
	
	/**
	 * @author DG
	 * @param files
	 * @throws IllegalStateException
	 * @throws IOException
	 * 파일 업로드를 위한 메서드
	 */
	@PostMapping("upload")
	public void upload(MultipartFile[] files) throws IllegalStateException, IOException{
		for(MultipartFile m : files){
			//실제 스트림 전송
			m.transferTo(new File(PATH, m.getOriginalFilename()));
			
		}
	}
	/**
	 * @author DG
	 * @date 0410
	 * uploadAjax호출을 위한 메서드
	 */
	@GetMapping("uploadAjax")
	public void uploadAjax(){
	
	}
	
	
	
	/**
	 * @author DG
	 * @param files
	 * @return 
	 * 썸네일 처리위한 메서드
	 */
	/*
	@PostMapping(value="uploadAjax1", produces=MediaType.APPLICATION_JSON_VALUE) @ResponseBody
	public List<AttachFileDTO> uploadAjax(MultipartFile[] files){
		log.info("uploadAjax post");
		List<AttachFileDTO> list = new ArrayList<>();
		File uploadPath = new File(PATH, getFolder());
		if(!uploadPath.exists()){
			uploadPath.mkdirs();
		}
		
		for(MultipartFile m : files){
			log.info(m.getOriginalFilename());
			//실제 스트림 전송
			String uuidStr = UUID.randomUUID().toString();
//			String tName = uuidStr + "_" + m.getOriginalFilename();
			String tName = m.getOriginalFilename();
			File f = new File(uploadPath, tName);
			boolean image = false;
			try {
				image = isImage(f);
				m.transferTo(f);
				if(image){
					//썸네일처리
					File f2 = new File(uploadPath+String.valueOf(mapper.getCodeNo()), "s_" + tName );
					Thumbnails.of(f).crop(Positions.CENTER).size(200, 200).toFile(f2);
				}
			}catch (UnsupportedFormatException e){ 
				image = false;
			}catch (IOException e) {
				e.printStackTrace();
			}
			AttachFileDTO dto = new AttachFileDTO();
			dto.setUuid(uuidStr);
			dto.setPath(getFolder());
			dto.setImage(image);
			dto.setName(m.getOriginalFilename());
			list.add(dto);
		}
		return list;
	}*/
	
	/**
	 * @author DG
	 * @date 0410
	 * @param dto
	 * @param thumb
	 * @return
	 * 썸네일 화면을 출력 및 원본 크기를 위한 메서드
	 */
	/*
	@GetMapping("display") @ResponseBody
	public ResponseEntity<byte[]> getFile(AttachFileDTO dto, Boolean thumb){
		//fileName : path + uuid + name
		log.info(dto);
		log.info("thumb :: " +thumb);
		String s = PATH + "/" + dto.getPath() +"/"+ (thumb != null && thumb ? "s_" : "") + dto.getUuid() + "_" +dto.getName();
		File file = new File(s);
		log.info("exists( :: " + file.exists());
		log.info(thumb);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}*/

	/**
	 * @author DG
	 * @date 0410 
	 * @param dto
	 * @param thumb
	 * @return
	 * 사진을 다운받기 위한 메서드
	 */
	/*
	@GetMapping("download") @ResponseBody
	public ResponseEntity<byte[]> download(AttachFileDTO dto, Boolean thumb){
		//fileName : path + uuid + name
		String s = PATH + "/" + dto.getPath() +"/"+(thumb != null && thumb ? "s_" : "") + dto.getUuid() + "_" +dto.getName();
		File file = new File(s);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", MediaType.APPLICATION_OCTET_STREAM_VALUE);
			headers.add("Content-Disposition", "attahment; filename=" + new String(dto.getName().getBytes("utf-8"), "iso-8859-1"));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers,HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}*/
		
	
	/**
	 * @author DG
	 * @date 0410
	 * @return
	 * 폴더 오늘 날짜의 형태로 불러오는 메서드
	 */
	/*
	private String getFolder(){
		return new SimpleDateFormat("yyyy/MM/dd").format(new Date());
	}*/

	/**
	 * @author DG
	 * @date 0410
	 * @param file
	 * @return
	 * @throws IOException
	 * 이미지 체크 여부와 ico, webp형태의 이미지를 체크하는 메서드
	 */
	/*
	private boolean isImage(File file) throws IOException{
		List<String> excludes = Arrays.asList("ico","webp");
		int idx = file.toString().lastIndexOf(".");
		if(idx == -1){
			return false;
		}
		String ext = file.toString().substring(idx+1);
		if(excludes.contains(ext)){
			return false;
		}
		String mime = Files.probeContentType(file.toPath());
		//mime image/png image/jpeg image/x-icon
		//webp null
		return mime != null && mime.startsWith("image");
	}*/
	
}