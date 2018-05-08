<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %> 
</head>
<body style="color:#000000">
	<div>
		<c:import url="/menu.do"/>
	</div>	
	<div style="margin : auto; margin-top:7%; width:1200px; ">		
		<div class="row">								
			<div class="col-md-12 col-xs-12">			
       			 <div class="bs-component" style="height:100px; float:right;">
          			 <ul class="nav nav-tabs" id="prodctArrayStd">
              			<li class="active"><a onclick="javascript:prodctSelect('new')" href="#home" data-toggle="tab">NEW</a></li>
             			<li><a  href="#profile" onclick="javascript:prodctSelect('hot')" data-toggle="tab">HOT</a></li>
              			<li><a  href="#profile" onclick="javascript:prodctSelect('normal')" data-toggle="tab">NORMAL</a></li>
       				 </ul>		             
       			 </div>
			</div>						
		   	<div class="col-md-12 col-xs-12" style="text-align:center">
		   		<h3>
		   			<c:choose>
		   				<c:when test="${category_seq == 0}">
		   					NEW ARRIVAL
	   					</c:when>
	   					<c:when test="${category_seq == 1}">
	   						Top
	   					</c:when>
	   					<c:when test="${category_seq == 2}">
	   						Bottom
	   					</c:when>
						<c:when test="${category_seq == 3}">
	   						Dress
	   					</c:when>
	   					<c:when test="${category_seq == 4}">
	   						Shoes&Bag
	   					</c:when>
	   					<c:when test="${category_seq == 5}">
	   						Outer
	   					</c:when>
	   					<c:when test="${category_seq == 6}">
	   						T-shirts
	   					</c:when>
	   					<c:when test="${category_seq == 7}">
	   						Blouse&Shirts
	   					</c:when>
	   					<c:when test="${category_seq == 8}">
	   						Knit
	   					</c:when>
	   					<c:when test="${category_seq == 9}">
	   						Pants
	   					</c:when>
	   					<c:when test="${category_seq == 10}">
	   						Skirts
	   					</c:when>
		   			</c:choose>
	   			</h3>
		   	</div>
		   	<div class="col-md-12 col-xs-12" style="height:100px"></div>		    		    	
	    	<div id="prodctDiv">
	    		<c:if test="${prodct_seq eq 0}">
	    			<c:import url="/newProdctSelect.do"/>
	    		</c:if>
	    		<c:if test="${prodct_seq ne 0}">
	    			<c:import url="/prodctView.do?prodct_seq=${prodct_seq}"/>
	    		</c:if>
    		</div>
    		<div class="col-md-12" style="height:100px"></div>
	    	<div class="col-md-12" style="border-top:1px solid; border-bottom:1px solid; padding-top:100px; padding-bottom:100px">
	    		<div class="col-md-1"></div>
				<div class="col-md-10">			
					<p style="
								display: block; font-size: 20px;
								font-weight: 700;
								line-height: 25px;
		    					color: #252525;							
		 						letter-spacing: 0.2px;"
						>
							053 267 7288
						</p>
					<p>MONDAY - FRIDAY PM12:00 - PM6:00 / SAT SUN HOLIDAY CLOSED</p>
					<h4 style=" 
								font-size: 11px;
							    color: #252525;
							    font-weight: 700;
							    letter-spacing: 1px;
							    height: 20px;
							    margin-top: 20px;
							    margin-left: 0.5px;"
					>
						COMPANY INFO
					</h4>
					<P style="    
								display: block;
  									padding: 0px 0 0 1px;
							    font-size: 11px;
							    font-weight: 400;
							    line-height: 20px;
							    color: #252525;								   
							    letter-spacing: 0.3px"	
					>
						" COMPANY. MISSBOM OWNER. SEO U JIN TEL. 053 267 7288 EMAIL. missbom11@naver.com ADDRESS. 대구 달서구 신당동 1814-1 미스봄 "
					</P>
					<P style="    
								display: block;
  									padding: 0px 0 0 1px;
							    font-size: 11px;
							    font-weight: 400;
							    line-height: 20px;
							    color: #252525;								   
							    letter-spacing: 0.3px"	
					>
						" MAIL ORDER LICENSE. 2015-대구달서-0651 BUSINESS LICENSE. 414-12-00143 "
					</p>
					<P style="    
								display: block;
  									padding: 0px 0 0 1px;
							    font-size: 11px;
							    font-weight: 400;
							    line-height: 20px;
							    color: #252525;								   
							    letter-spacing: 0.3px"	
					>
						COPYRIGHT @ MISSBOM ALL RIGHTS RESERVED.
					</p>					
				</div>
				<div class="col-md-1"></div>			
			</div>															
		</div>
	</div>			    	            										
</body>
</html>