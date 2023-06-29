<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://pf2.chanyongyang.com/" target="_blank">
    <img src="image/oring.png" alt="Logo" width="200">
  </a>

  <h3 align="center">Oring Vape</h3>

  <p align="center">
    회원제 게시판
    <br>
    <p>작업기간 : 1 week</p>
    <a href="https://pf2.chanyongyang.com/ target="_blank"">View Demo</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#사전준비">사전준비</a></li>
        <li><a href="#설치">설치</a></li>
      </ul>
    </li>
    <li><a href="#사용방법">사용방법</a></li>
    <li><a href="#요구사항">요구사항</a></li>
    <li><a href="#Team">Team</a></li>
    <li><a href="#Etc">Etc..</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<img src="image/1.png" >

<br>
Servlet, JSP를 활용한 회원제 게시판 <br>
이 프로젝트는 학원 정규 교육과정에 있었음 <br>
앞전에 배운 JAVA, DB, HTML5, CSS3, JS, jQuery를 활용하여 회원제 게시판을 만드는것을 목적으로 함

### Built With

 <img src="https://img.shields.io/badge/Java-white?style=flat&logo=java&logoColor=white"/><br>
 <img src="https://img.shields.io/badge/Servlet-blue?style=flat&logo=Servlet&logoColor=white"/><br>
 <img src="https://img.shields.io/badge/jsp-white?style=flat&logo=jsp&logoColor=white"/><br>
 <img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat&logo=javascript&logoColor=black"/><br>
 <img src="https://img.shields.io/badge/jquery-0868AB?style=flat&logo=jquery&logoColor=white"/><br>
 <img src="https://img.shields.io/badge/mariaDB-lightgray?style=flat&logo=mariadb&logoColor=white"/><br>





<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

프로젝트를 복제하여 로컬에서 설정하는 방법에 대한 설명 입니다. <br>

### 사전준비

#### 저장소 복제
   ```sh
   git clone https://github.com/yangchanyong/AWS_fullstack_Servlet_JSP_Assignment.git
   ```

 #### 데이터베이스 구성 <br>
    <img src="image/ERD2.png" width="500" >

 #### 데이터베이스 테이블 생성 쿼리
  
  <details>
    <summary>query</summary>  
    
    CREATE TABLE `tbl_member` (
      `id` varchar(750) NOT NULL,
      `pw` varchar(1000) NOT NULL,
      `name` varchar(1000) NOT NULL,
      `regdate` datetime DEFAULT current_timestamp(),
      `email` varchar(1000) DEFAULT NULL,
      `addr` varchar(1000) DEFAULT NULL,
      `addrDetail` varchar(1000) DEFAULT NULL,
      PRIMARY KEY (`id`)
    )
    CREATE TABLE `tbl_board` (
      `bno` bigint(20) NOT NULL AUTO_INCREMENT,
      `title` varchar(3000) DEFAULT NULL,
      `content` text DEFAULT NULL,
      `writer` varchar(750) DEFAULT NULL,
      `regdate` datetime DEFAULT current_timestamp(),
      `updatedate` datetime DEFAULT current_timestamp(),
      `hitcount` int(11) DEFAULT 0,
      `category` int(11) DEFAULT 1,
      PRIMARY KEY (`bno`),
      KEY `writer` (`writer`),
      CONSTRAINT `tbl_board_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `tbl_member` (`id`)
    )
    CREATE TABLE `tbl_attach` (
      `uuid` varchar(500) NOT NULL,
      `origin` varchar(1000) DEFAULT NULL,
      `image` char(1) DEFAULT NULL,
      `path` varchar(300) DEFAULT NULL,
      `bno` bigint(20) DEFAULT NULL,
      PRIMARY KEY (`uuid`),
      KEY `bno` (`bno`),
      CONSTRAINT `tbl_attach_ibfk_1` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`)
    )
    CREATE TABLE `tbl_reply` (
      `rno` bigint(20) NOT NULL AUTO_INCREMENT,
      `content` text DEFAULT NULL,
      `regdate` datetime DEFAULT current_timestamp(),
      `writer` varchar(750) DEFAULT NULL,
      `bno` bigint(20) DEFAULT NULL,
      PRIMARY KEY (`rno`),
      KEY `writer` (`writer`),
      KEY `bno` (`bno`),
      CONSTRAINT `tbl_reply_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `tbl_member` (`id`),
      CONSTRAINT `tbl_reply_ibfk_2` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`)
    )
    
  </details>
    
    
  #### 데이터베이스 연결 <br>
  ```sh
    src/main/java/com/chanyongyang/jsp/util/DBConn.java 파일 열기 -> DB접속정보 입력
  ```

### 설치

1. JDK1.8
2. STS 3.9.4
3. MariaDB
4. Lombok
5. Tomcat9



<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## 사용방법
  1. 회원가입
  2. 로그인
  3. 자유게시판, 공지사항 글 확인 및 작성


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## 요구사항

#### 작업완료
- [x] 회원가입 
- [x] 로그인
- [x] 게시글
    - [x] 작성
    - [x] 수정
    - [x] 삭제
    - [x] 상세보기

 #### 작업예정
- [ ] 댓글
    - [ ] 작성
    - [ ] 수정
    - [ ] 삭제
- [ ] 첨부파일
    - [ ] 업로드
    - [ ] 다운로드
    - [ ] 썸네일
    



<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Collaborator
 Personal Project

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## Etc
  

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Yang Chanyong - cksdyd93@gmail.com

<a href="https://pf2.chanyongyang.com" target="_blank">Demo Link</a>

<a href="https://www.chanyongyang.com" target="_blank">Portfolio Link</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

이 프로젝트를 사용해주시고 README를 읽어주신 여러분께 대단히 감사합니다!

### Reference
README Template : [README-Template](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fyangchanyong%2FAWS_fullstack_Servlet_JSP_Assignment&count_bg=%23000000&title_bg=%23A4A2A2&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)
