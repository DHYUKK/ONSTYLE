<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- 화면 디자인에 필요한 CSS -->
<link href="/resources/consmr/main/consmrBootstrap/css/bootstrap.css?11" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/custom.min.css"/>

<!-- 모코블링에서 가져온 좌측 바 -->
<link href="/resources/leftMenu.css" rel="stylesheet" type="text/css" />

<!-- 부트스트랩의  다양한 기능들을 구현 해놓은 js소스-->
<script src="/resources/consmr/main/consmrBootstrap/js/bootstrap.min.js"></script>
<script src="/resources/assets/js/custom.js"></script>

<!-- 따온거라서 뭔지 모름. 지우면 어떤 기능이 안될 수도 -->
<script>
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-23019901-1' ]);
	_gaq.push([ '_setDomainName', "bootswatch.com" ]);
	_gaq.push([ '_setAllowLinker', true ]);
	_gaq.push([ '_trackPageview' ]);
	
	(function() {
	   var ga = document.createElement('script');
	   ga.type = 'text/javascript';
	   ga.async = true;
	   ga.src = ('https:' == document.location.protocol ? 'https://ssl'
	         : 'http://www')
	         + '.google-analytics.com/ga.js';
	   var s = document.getElementsByTagName('script')[0];
	   s.parentNode.insertBefore(ga, s);
	})();
	function loginView(){	    
	   window.location.href="/login.do";
	}
	function logoutMem(){
		window.location.href="/logout.do";	
	}
</script>


</head>

<body>
	<!-- 상단 바 -->
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<a href="../" class="navbar-brand" style="padding-top: 0px;"> <img
				src="/resources/consmr/main/img/missbom.png"
				style="width: 110px; margin: 8px; float: left;">
			</a>
			<!-- 화면 줄였을 때 생기는 메뉴버튼 -->
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target="#navbar-main">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- 화면 줄였을 때 생기는 메뉴버튼 -->
		</div>

		<div class="container" style="width: 100%;">
         <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav"
               style="font-size: 14px; padding-top: 10px">
               <li style="margin-left: 5px; margin-right: 5px;"><a href="/prodctFrameSelect.do?category_seq=0">NEW</a></li>
               <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/prodctFrameSelect.do?category_seq=1">TOP<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="/prodctFrameSelect.do?category_seq=1">Top</a></li>
                     <li class="divider"></li>
                     <li><a href="/prodctFrameSelect.do?category_seq=6">T-shirts</a></li>
                     <li><a href="/prodctFrameSelect.do?category_seq=7">Blouse&Shirts</a></li>
                     <li><a href="/prodctFrameSelect.do?category_seq=8">Knit</a></li>
                  </ul>
               </li>
               <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/prodctFrameSelect.do?category_seq=2">BOTTOM<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="/prodctFrameSelect.do?category_seq=2">Bottom</a></li>
                     <li class="divider"></li>
                     <li><a href="/prodctFrameSelect.do?category_seq=9">Pants</a></li>
                     <li><a href="/prodctFrameSelect.do?category_seq=10">Skirts</a></li>
                  </ul>
               </li>
               <li style="margin-left: 5px; margin-right: 5px;"><a href="/prodctFrameSelect.do?category_seq=3">DRESS</a></li>
               <li style="margin-left: 5px; margin-right: 5px;"><a href="/prodctFrameSelect.do?category_seq=4">SHOES & BAGS</a></li>
               <li style="margin-left: 5px; margin-right: 5px;"><a href="/prodctFrameSelect.do?category_seq=5">OUTER</a></li>
               <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" id="myDress">나의 옷장 <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="/virtualCodi.do">가상 코디</a></li>
                     <li class="divider"></li>
                     <li><a href="/codiSet.do?pageCode=1">나의 코디</a></li>
                     <li><a href="/codiSet.do?pageCode=2">답변 받은 코디</a></li>
                     <li><a href="/codiSet.do?pageCode=3">스크랩 코디</a></li>
                  </ul></li>
               <li class="dropdown"><a class="dropdown-toggle"
                  data-toggle="dropdown" href="#" id="download">언니한테 물어봐<span
                     class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="reqstVirtualCodi.do">코디요청</a></li>
                     <li><a href="/reqstbreakdwn.do">코디요청 내역</a></li>
                  </ul></li>
               <li><a href="/codiShr.do">오늘 나 어때?</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right"
               style="font-size: 12px; padding-top: 10px">
                <c:if test="${sessionScope.userInfo eq null}">
                     <li><a href="#" style="padding-left: 5px; padding-right: 5px;" onclick="javascirpt:loginView();">Login</a></li>
                  </c:if>
                  <c:if test="${sessionScope.userInfo ne null}">
                     <li><a style="padding-left: 5px; padding-right: 5px;color:black;">${userInfo.mem_name}님 환영합니다.</a></li>
                     <li><a href="#" style="padding-left: 5px; padding-right: 5px;" onclick="javascirpt:logoutMem();">Logout</a></li>
                  </c:if>

               <li><a href="/cart.do" style="padding-left: 5px; padding-right: 5px;">Shopping Bag</a></li>
               <c:if test="${sessionScope.userInfo ne null}">
                  <li><a href="/mypageHome.do" style="padding-left: 5px; padding-right: 5px;">My page</a></li>
               </c:if>
               <c:if test="${sessionScope.userInfo eq null}">
                  <li><a href="/login.do" style="padding-left: 5px; padding-right: 5px;">My page</a></li>
               </c:if>
               
               <li><a href="" style="padding-left: 5px; padding-right: 5px;">Q&A</a></li>
            </ul>
         </div>
      </div>
   </div>

	<!-- 좌측 바 -->
	<div id="aside">
		<div class="side_inner">
			<div class="menu" style="margin-top: -100px">
				<div class="group">
					<a class="icon_search"
						onclick="asideLayer('aside_searchform'); return false;"
						style="text-decoration: none"><span class="txt">검색</span></a>
					<div id="aside_searchform" class="searchform">
						<span class="layer_close"
							onclick="asideLayer('aside_searchform');"></span>
						<div class="box_input">
							<input type="text" class="form-control" placeholder="상품명"
								style="height: 45px; font-size: 13px"> <a
								href="javascript:search_submit();" class="btn_search"> <img
								src="/resources/consmr/main/img/sch.png"
								style="width: 20px; margin-bottom: 10px">
							</a>
						</div>
					</div>
				</div>
				<div class="group">
					<a href="/cart.do" class="icon_cart" style="text-decoration: none"><span
						class="txt">장바구니</span></a>
				</div>
				<div class="group">
					<a href="#" class="icon_cs" style="text-decoration: none"><span
						class="txt">고객센터</span></a>
				</div>
			</div>
			<div class="bottom_ui">
				<div class="scroll">
					<span class="btn_scroll top" onclick="winScroll('top');"></span> <span
						class="btn_scroll bottom" onclick="winScroll('bottom');"></span>
				</div>
			</div>
		</div>
	</div>


	<!-- 따온거라서 뭔지 모름. 지우면 어떤 기능이 안될 수도 -->
	<script>
		/* <![CDATA[ */(function(d, s, a, i, j, r, l, m, t) {
			try {
				l = d.getElementsByTagName('a');
				t = d.createElement('textarea');
				for (i = 0; l.length - i; i++) {
					try {
						a = l[i].href;
						s = a.indexOf('/cdn-cgi/l/email-protection');
						m = a.length;
						if (a && s > -1 && m > 28) {
							j = 28 + s;
							s = '';
							if (j < m) {
								r = '0x' + a.substr(j, 2) | 0;
								for (j += 2; j < m && a.charAt(j) != 'X'; j += 2)
									s += '%'
											+ ('0' + ('0x' + a.substr(j, 2) ^ r)
													.toString(16)).slice(-2);
								j++;
								s = decodeURIComponent(s) + a.substr(j, m - j)
							}
							t.innerHTML = s.replace(/</g, '&lt;').replace(
									/\>/g, '&gt;');
							l[i].href = 'mailto:' + t.value
						}
					} catch (e) {
					}
				}
			} catch (e) {
			}
		})(document);/* ]]> */
	</script>

	<!-- 좌측 바 -->
	<script type="text/javascript">
		(function($) {
			jQuery(".MS_search_word").val("SEARCH").focus(function() {
				if (this.value == "SEARCH") {
					jQuery(".MS_search_word").val(''); //텍스트를 입력가능하도록 클리어
				}
			}).blur(function() {
				if (this.value == '') {
					jQuery(".MS_search_word").val("SEARCH"); //아이디를 입력하지 않으면 워터마크 텍스트로 지정
				}
			});

			jQuery("form[name=search]").submit(function() {
				if (jQuery(".MS_search_word").val() == "SEARCH") {
					jQuery(".MS_search_word").val('');
				}
			})
		})(jQuery);

		//좌측영역 여닫기
		function asideToggle() {
			var aside = jQuery('#aside');
			if (aside.hasClass('is_closed') == false && aside.width() > 0) {
				aside.addClass('is_closed');
			} else {
				aside.removeClass('is_closed');
			}
		}

		//좌측영역 레이어 여닫기
		function asideLayer(name) {
			var target = jQuery('#' + name);
			if (target.is(':visible')) {
				target.animate({
					'left' : -271
				}, {
					'complete' : function() {
						target.hide();
					}
				});
			} else {
				target.show();
				if (name == 'aside_searchform') {
					target.animate({
						'left' : 17
					});
				} else {
					target.animate({
						'left' : 0
					});
				}

			}
		}

		//스크롤 상하
		function winScroll(stat) {
			var way = 0;
			if (stat != 'top') {
				way = Math.floor(jQuery(document).height()
						- jQuery(window).height());
			}
			jQuery('html, body').animate({
				scrollTop : way
			});
			return false
		}
	</script>


</body>
</html>
