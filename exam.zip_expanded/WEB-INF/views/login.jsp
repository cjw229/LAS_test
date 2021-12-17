<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/login.js"></script>
</head>
<body>
    <div class="container">
    <div class="header">
    	Header
    	<img alt="btn" src="./img/gnb_btn.png">
    </div>
    <div class="nav">Nav</div>
	<div id="section">
			<c:if test="${param.error == 'login' }">
				<script type="text/javascript">alert("이메일 또는 비밀번호가 틀립니다.");</script>
			</c:if>
			<div id="loginBox">
				<div id="login_header">
					<c:if test="${customer_name != null}">
						<h3>${customer_name }님 로그인 성공</h3>
					</c:if>
					<c:if test="${customer_name == null}">
						<h3>로그인</h3>
					</c:if>
				</div>
				<div id="login_section">
				<c:if test="${customer_name == null}">
				<form id="submit" action="./login" method="post">
					<span id="login_inputHeader">아이디</span>
					<input type="text" id="email" class="login" name="email"  placeholder="이메일 또는 휴대번호를 입력하세요." required />
					<div id="idRemember">
						<input type="checkbox" id="idCheck"/>
						<label id="idCheck">아이디 기억하기</label>
					</div>
					<span id="login_inputHeader">비밀번호</span>
					<i class="fa fa-eye fa-lg"></i>
					<input type="password" id="passwd" class="login" name="passwd"  placeholder="비밀번호를 입력하세요." required />
					<button type="submit" class="btn_submit">로그인</button>
					<button type="button" class="btn_join">회원가입</button>
					<div id="find">
						<a href="#" id="findId">아이디 찾기</a>
						<a href="#" id="findPw">비밀번호 찾기</a>
					</div>
				</form>
				</c:if>
				<c:if test="${customer_name != null}">
					<a href="./logout">로그아웃</a>
				</c:if>
				</div>
			</div>
	</div>
	<div class="footer">Footer</div>
</div>
</body>
</html>