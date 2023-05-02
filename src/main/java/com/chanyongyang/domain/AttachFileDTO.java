package com.chanyongyang.domain;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponentsBuilder;

import com.chanyongyang.controller.UploadController;

import lombok.Data;

@Data
public class AttachFileDTO {
	private String uuid;
	private String origin= "";
	private boolean image;
	private String path;
//	private String name = "";
	
	public String getUrl() throws UnsupportedEncodingException {
		return UriComponentsBuilder.fromPath("")
				.queryParam("origin", URLEncoder.encode(origin, "utf-8"))
				.queryParam("path", path)
				.queryParam("uuid", uuid)
				.queryParam("image", image)
				.build().toUriString();
	}
	
	public File getOriginFile(){
		return new File(UploadController.getPATH(), path + File.separator + uuid + "_" + origin);
	}
	public File getThumbFile(){
		return new File(UploadController.getPATH(), path + File.separator + "s_" + uuid + "_" + origin);
	}
}

