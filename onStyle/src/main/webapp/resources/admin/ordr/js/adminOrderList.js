/* 관리자 데이트피커
 * 일주일 부터 먼저 찍혀나옴
 * 박현진. 마이페이지
 */
$(document).ready(function(){ //화면이 준비 되었을때
    $.datepicker.regional['ko'] = {   //datepicker를 한국어로 셋팅하고 설정함.
       dateFormat: 'yy-mm-dd', //dateFormat을 통해서 선택한 날짜에 대한 표현
       showOn: "both", //showOn 옵션은 button 과 image 의 표시여부를 결정하며,둘 다 선택하거나 한가지만 선택가능.
       buttonImage: "/resources/consmr/ordr/img/Calendar.png", //image를 선택할 경우에는 사용할 image의 경로를 정확하게 입력해야 제대로 화면에 나옴. 
       buttonImageOnly: true,   //buttonImageOnly 옵션은 image를 button 형식 또는 단순히 image만 표시하도록 설정
       prevText: '이전 달',   //이전 달로 넘어갈때 마우스커서에 나타나는 글씨
       nextText: '다음 달',   //이하 동문
       monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //monthNames는 반대로 changeMonth 옵션이 false일 경우 표현하는 month의 Text를 설정
       dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], //dayNamesMin은 날짜선택기에 표시하는 요일의 약자를 설정
    };
   $.datepicker.setDefaults($.datepicker.regional['ko']);// 위의 설정해둔 목록들을 실행시킴
})      //datepicker 한글 설정 및 셋팅

$(document).ready(function(){
//   처음부터 7일 기준으로 보이게 설정해 놓은것 
	var settingDate = new Date();   //새로운 날짜(현재날짜)를  settingDate에 담는다
    settingDate.setDate(settingDate.getDate()-7); // 다음날짜를 가져와서 -7(일주일)한것을 다시 settingDate에 넣는다
    $('#oneDatepicker').val($.datepicker.formatDate('yy-mm-dd', settingDate)); //1번째달력에 계산된settingDate를 넣어준다.
    $('#twoDatepicker').val($.datepicker.formatDate('yy-mm-dd', new Date())); //2번째 달력에는 오늘 날짜가 표시되어야되므로 오늘 날짜표시
//      1번째 달력(시작일_oneDatepicker) 눌렀을때
   $( "#oneDatepicker" ).datepicker({
        onClose: function( selectedDate ) {   //datepicker 의 메소드 중 onClose를 이용하여 사용자가 날짜를 선택 하면 반대 달력의 maxDate와 minDate를 지정하여 선택하지 못하도록 하는 방식
//          시작일(oneDatepicker) datepicker가 닫힐때
//          종료일(twoDatepicker)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
           $("#twoDatepicker").datepicker( "option", "minDate", selectedDate );
//         이미지사이즈조절
           $("img.ui-datepicker-trigger").attr("style","margin-left:2px; vertical-align:middle; width:25px; height:25px; cursor: Pointer;"); 
        }
   });
//      2번째 달력(종료일_twoDatepicker)
   $( "#twoDatepicker" ).datepicker({
        onClose: function( selectedDate ) {
//          종료일(twoDatepicker) datepicker가 닫힐때
//          시작일(oneDatepicker)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#oneDatepicker").datepicker( "option", "maxDate", selectedDate );
//         이미지사이즈조절            
            $("img.ui-datepicker-trigger").attr("style","margin-left:2px; vertical-align:middle; width:25px; height:25px; cursor: Pointer;"); 
        }
   });
//   또 이미지조절해주는 이이유는 여기서 이거 안해주면 날짜선택시 이미지가 개 커짐
   $("img.ui-datepicker-trigger").attr("style","margin-left:2px; vertical-align:middle; width:25px; height:25px; cursor: Pointer;");
//   오늘버튼
   $("#today").click(function(){
      $('#oneDatepicker').val($.datepicker.formatDate('yy-mm-dd', new Date()));
      $('#twoDatepicker').val($.datepicker.formatDate('yy-mm-dd', new Date()));
   });
//   일주일버튼
   $("#oneweek").click(function(){
      var settingDate = new Date();   //새로운 날짜(현재날짜)를  settingDate에 담는다
      settingDate.setDate(settingDate.getDate()-7); // 다음날짜를 가져와서 -7(일주일)한것을 다시 settingDate에 넣는다
      $('#oneDatepicker').val($.datepicker.formatDate('yy-mm-dd', settingDate)); //1번째달력에 계산된settingDate를 넣어준다.
      $('#twoDatepicker').val($.datepicker.formatDate('yy-mm-dd', new Date())); //2번째 달력에는 오늘 날짜가 표시되어야되므로 오늘 날짜표시
   });
//   한달버튼
   $("#month").click(function(){
      var settingDate = new Date();
      settingDate.setDate(settingDate.getDate()-30);
      $('#oneDatepicker').val($.datepicker.formatDate('yy-mm-dd', settingDate));
      $('#twoDatepicker').val($.datepicker.formatDate('yy-mm-dd', new Date()));
   });
//   3개월버튼
   $("#trimester").click(function(){
      var settingDate = new Date();
      settingDate.setDate(settingDate.getDate()-90);
      $('#oneDatepicker').val($.datepicker.formatDate('yy-mm-dd', settingDate));
      $('#twoDatepicker').val($.datepicker.formatDate('yy-mm-dd', new Date()));
   });
//   6개월버튼
   $("#halfyear").click(function(){
      var settingDate = new Date();
      settingDate.setDate(settingDate.getDate()-180);
      $('#oneDatepicker').val($.datepicker.formatDate('yy-mm-dd', settingDate));
      $('#twoDatepicker').val($.datepicker.formatDate('yy-mm-dd', new Date()));
   });
})