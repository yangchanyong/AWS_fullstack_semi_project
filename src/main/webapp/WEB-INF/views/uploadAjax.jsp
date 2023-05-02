<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>2023. 4. 7.오전 10:35:32</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(0, 0, 0, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	max-width: 600px;
}
</style>
</head>
<body>
	<form method="post" enctype="multipart/form-data">
		<label for="files"><i class="fas fa-folder-plus"></i></label>
		<input type="file" name="files" multiple id="files" >
		<button>submit</button>
	</form>
	<div class="uploadResult">
		<ul>
		</ul>
	</div>
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		</div>
	</div>	
</body>
<script>
	function showImage(param){
		//alert(param);
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture")
			.html("<img src='/display?" + param + "'>")
			.animate({width:'100%', height : '100%'}, 1000);
		
	}
	$(function() {
		$(".bigPictureWrapper").click(function(){
			$(".bigPicture").animate({width:0, height:0}, 1000);
			setTimeout(function() {
				$(".bigPictureWrapper").hide();
			},1000)
		})
		function checkExtension(files){
			const MAX_SIZE = 5 * 1024 * 1024;
			const EXCLUDE_EXT = new RegExp("(.*.?)\.(js|jsp|asp|php)");//파일 확장자에대한 업로드 불가 처리
			for(let i in files){
				if(files[i].size >= MAX_SIZE || EXCLUDE_EXT.test(files[i].name)){
					
					return false;
				}
			}
			return true;
		}
		/* $("form :file").change(function(){
			let str = "";
			for(let i = 0; i< this.files.length; i++){
				str +="<p>===============================</p>";
				str +="<p>" +this.files[i].name + "</p>";
				str +="<p>" +this.files[i].type + "</p>";
				str +="<p>" +this.files[i].size + "</p>";
			}
			$("form div").html(str);
		}) */
		function showUploadFile(uploadResultArr){
			var str="";
			for(var i in uploadResultArr){
				let obj =uploadResultArr[i];
				obj.thumb = "on";
				var params = new URLSearchParams(obj).toString();
				if(!obj.image){
					str += '<li><a href="/download?' + params +'"><i class="far fa-file"></i> ' + obj.name + '</a></li>';
				}else{
					obj.thumb = "off";
					var params2 = new URLSearchParams(obj).toString();
					str += '<li><a href="javascript:showImage(\''+ params2  + '\')"><img src="/display?' + params +'" >' + obj.name + '</a></li>';
				}
			}
			$(".uploadResult ul").append(str);
		}
		$("form button").click(function() {
			event.preventDefault();
			let files = $(":file").get(0).files;
			console.log(files);
			
			if(!checkExtension(files)){
				alert("조건 불일치");
				return false;//이벤트 자체를 멈춘다
			}
			
			let formData = new FormData();
			for(let i in files){
				formData.append("files",files[i]);//public void uploadAjax(MultipartFile[] files) 의 이름을 따라감
			}
			
			$.ajax({
				url : "/controller/uploadAjax",
				processData : false,
				contentType : false,
				data : formData,
				method : "post",
				success : function(data){
					console.log(data);
					$("form").get(0).reset();//게시글에선 문제가 될 수 있음 전체 form이 reset을 할 수도 있음
					showUploadFile(data);
				}
				
			})
		})
	})
</script>
</html>