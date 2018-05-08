/**
 * 
 */
$(document).ready(function(){
	
   //좋아요 버튼 색 변경 및 갯수
   $(".likeButton").click(function(){
      codi_shr_seq = $(this).children().eq(0).val();
      formData = "codi_shr_seq="+codi_shr_seq;
      like = $(this).children().eq(1);
      $.ajax({
         type: "POST",
         url: "/like.do",
         data : formData,
         success: function(data){
            if(data.liked == 1){
               like.html("<img class='like' src='resources/consmr/codi/codiShr/img/like/liked.png'>");
            }
            else {
               like.html("<img class='like' src='resources/consmr/codi/codiShr/img/like/liking.png'>");
            }
            $.ajax({
               type: "POST",
               url: "/countLike.do",
               data: formData,
               success: function(data){
                  $("#countLike"+data.codi_shr_seq).html(data.liked)   
               }
            })
         },
         error:function(xhr,status,error)
         { //ajax 오류인경우  
    	 	alert("로그인 후 이용가능합니다.");      
         }
      }); 
   });
   
   //스크랩
   $(".scrapButton").click(function(){
      codi_shr_seq = $(this).children().eq(0).val();
      formData = "codi_shr_seq="+codi_shr_seq;
      scrap = $(this).children().eq(1);
      $.ajax({
         type : "POST",
         url : "/scrap.do",
         data : formData,
         success : function(data){
            scrap.html("");
			alert("스크랩이 완료되었습니다. [나의 옷장] > [스크랩 코디]에서 확인 하세요.");
         },
         error:function(xhr,status,error)
             { //ajax 오류인경우  
        	 	alert("로그인 후 이용가능합니다.");   
            }
      })
   });
})

function viewCodi(c){
   window.location.href = "/codiView.do?codi_shr_seq="+c;
}