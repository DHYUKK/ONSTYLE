<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    
    <!-- 화면 디자인에 필요한 CSS -->
	<link href="/resources/admin/main/adminBootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="/resources/assets/css/custom.min.css"/>
	
	<!-- 부트스트랩의  다양한 기능들을 구현 해놓은 js소스-->
	<script src="/resources/admin/main/adminBootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/assets/js/custom.js"></script>
	
	<!-- 따온거라서 뭔지 모름. 지우면 어떤 기능이 안될 수도 -->
	  <script>/* <![CDATA[ */(function(d,s,a,i,j,r,l,m,t){try{l=d.getElementsByTagName('a');t=d.createElement('textarea');for(i=0;l.length-i;i++){try{a=l[i].href;s=a.indexOf('/cdn-cgi/l/email-protection');m=a.length;if(a&&s>-1&&m>28){j=28+s;s='';if(j<m){r='0x'+a.substr(j,2)|0;for(j+=2;j<m&&a.charAt(j)!='X';j+=2)s+='%'+('0'+('0x'+a.substr(j,2)^r).toString(16)).slice(-2);j++;s=decodeURIComponent(s)+a.substr(j,m-j)}t.innerHTML=s.replace(/</g,'&lt;').replace(/\>/g,'&gt;');l[i].href='mailto:'+t.value}}catch(e){}}}catch(e){}})(document);/* ]]> */</script>
	
 	<!-- 따온거라서 뭔지 모름. 지우면 어떤 기능이 안될 수도 -->
	<script>
		var _gaq = _gaq || [];
		 _gaq.push(['_setAccount', 'UA-23019901-1']);
		 _gaq.push(['_setDomainName', "bootswatch.com"]);
		   _gaq.push(['_setAllowLinker', true]);
		 _gaq.push(['_trackPageview']);
		
		(function() {
		  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
		
		function logoutAdmin(){
			window.location.href="/logout.do";	
		}
	</script>
    
    
</head>

<body>
	<!-- 상단 바 -->
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header" style = "height:89.95px">
			<a href="/adminMain.do" class="navbar-brand" style="padding-top: 0px; padding-left:0px">
			<img src="/resources/admin/main/img/missbom.png" style = "width:191px; height:90.58px; float : left;"></a>
			<!-- 화면 줄였을 때 생기는 메뉴버튼 -->
			<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
				<span class="icon-bar" style = "background-color:white;"></span> 
				<span class="icon-bar" style = "background-color:white;"></span> 
				<span class="icon-bar" style = "background-color:white;"></span>
			</button>
			<!-- 화면 줄였을 때 생기는 메뉴버튼 -->			
		</div>
		
		<!-- 메뉴 바 -->		
		<div class="container" style = "width : 100%;">
			<div class="navbar-collapse collapse" id="navbar-main" >
				<ul class="nav navbar-nav" style = "font-size: 14px; margin-left:50px">
					<li>
						<a href="/adminProdctDisply.do">
							<img src="/resources/admin/main/img/prodct.png" style = "margin-left: 5px; margin-bottom:3px">
							<br>상품관리
						</a>
					</li>
					<li style = "margin-left:40px">
						<a href="/adminOrdr.do">
							<img src="/resources/admin/main/img/ordr.png" style = "margin-left: 7px; margin-bottom:3px">
							<br>주문관리
						</a>
					</li>
					<li style = "margin-left:28px">
						<a href="/adminCodiReqst.do">
							<img src="/resources/admin/main/img/codireqeust.png" style = "margin-left: 22px;margin-bottom:3px">
							<br>코디 요청 관리
						</a>
					</li>
					<li style = "margin-left:12px">
						<a href="/adminCodiShr.do">
							<img src="/resources/admin/main/img/shareBoard.png" style = "margin-left: 30px; margin-bottom:3px">
							<br>코디 공유 게시판
						</a>
					</li>

					<li style = "margin-left:35px">
						<a href="/adminMem.do">
							<img src="/resources/admin/main/img/consmr.png" style = "margin-bottom:3px">
							<br>고객관리
						</a>
					</li>
					<li style = "margin-left:35px" align=center>
						<a href="/store.do">
							<img src="/resources/admin/main/img/store.png" style = "margin-bottom:3px" align=center>
							<br>행사관리
						</a>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right" style = "font-size: 12px;">
					<li>
						<a onclick="logoutAdmin()" style="padding-left: 5px; padding-right: 5px;">
							<img src="/resources/admin/main/img/logout.png" style = "margin-bottom:3px">
							<br>Logout
						</a>
					</li>
				</ul>					
			</div>			
		</div>
	</div>
</body>
</html>
