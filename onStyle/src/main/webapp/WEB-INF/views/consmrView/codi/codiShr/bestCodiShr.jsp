<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>베스트 코디 조회</title>
<style>
.codi{
   align:center;
   height:300px;
   width:300px;
   display:block;
   margin-left:auto;
   margin-right:auto;
}

.thumb_wrapper{
   align:center;
   margin:0 auto;
   
}

.mem_profile{
   width: 50px; height: 50px;
    object-fit: cover;
    object-position: top;
    border-radius: 50%;
}

.like{
   width: 20px; 
   height: 20px;
   background: url("/resources/consmr/codi/codiShr/img/profile.PNG") no-repeat;
}

.scrap{
   width: 20px; 
   height: 20px;
}
</style>
<script src="/resources/consmr/codi/codiShr/js/bestCodiShr.js"></script>
</head>
<body>
   <c:forEach items="${bestCodiShrList}" var="codiShrVo" varStatus="status">

   		<div class="col-xs-3 outer" style="height:410px; border:1px solid #e0e0e0; padding:0px 0px; margin:50px 60px">
	         <div class="set codi" style="width:100%;">
	            <div class="thumb_wrapper" onclick="viewCodi(${codiShrVo.codi_shr_seq});">
	               <img class="codi" src="${codiShrVo.codi_img_route}" style="cursor:pointer; margin-top:20px; max-width:50%; max-height:50%;">
	            </div>
	         </div>
             <div class="profile_wrapper" style="margin:0px 15px">
                <table style="width:100%">
                   <tr>
                      <td>
                         <img class="mem_profile" src="${codiShrVo.mem_img_route}">
                         <br>
                         <font size=4>${codiShrVo.mem_nicknme}</font>
                      </td>
                      <td id="like">
                         <input type="hidden" value = "${codiShrVo.like_seq}" id="like_seq">
                      	   받은 좋아요 &nbsp;
                      	 <span id="countLike${codiShrVo.codi_shr_seq}" style="font-weight:bold;">${codiShrVo.liked}</span>
                      </td>
                      <td>
                                                                  댓글 수 &nbsp;
                         <span style="font-weight:bold;">${codiShrVo.reply}개</span>
                      </td>
                      <td class="likeButton">
                         <input type="hidden" value="${codiShrVo.codi_shr_seq}">
                         <div id="like${codiShrVo.codi_shr_seq}">
                            <c:if test="${codiShrVo.likeState==0}">
                               <img class="like" src="resources/consmr/codi/codiShr/img/like/liking.png" style="cursor:pointer">
                            </c:if>
                            <c:if test="${codiShrVo.likeState==1}">
                               <img class="like" src="resources/consmr/codi/codiShr/img/like/liked.png" style="cursor:pointer">
                            </c:if>
                         </div>
                      </td>
                      <td class="scrapButton">
                         <input type="hidden" value="${codiShrVo.codi_shr_seq}">
                         <div id="scrap${codiShrVo.codi_shr_seq}">
                            <c:if test="${codiShrVo.scrapState==0 and codiShrVo.mem_seq!=mem_seq}">
                               <img class="scrap" src="resources/consmr/codi/codiShr/img/like/scrap.png" style="cursor:pointer">
                            </c:if>
                         </div>
                      </td>
                   </tr>
                </table>
             </div>
         </div>
   </c:forEach>
</body>
</html>