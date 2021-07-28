 $(document).ready(function(){
    	
    	//datepicker
    	$('#datepickerOption').datepicker({
                changeMonth: true // 월을 셀렉트 박스
                    , changeYear: true // 년 셀렉트 박스
                    , dateFormat: "yy-mm-dd"  // 표시 형식 - (yyyy-mm-dd 여기선 년도를 yy만 쓴다.)
                    , showAnim: "clip" // 애니메이션 효과 - slide, fadeIn, clip...
      	});
      	
      	$('#submit').on('click',function(e){
    		e.preventDefault();
    		//유효성 검사
    		//weather,microDust select 이므로 기본적으로 값이 들어감
    		var date=$('input[name=date]').val();
    		var temperatures=$('input[name=temperatures]').val();
    		var precipitation=$('input[name=precipitation]').val();
    		var windSpeed=$('input[name=windSpeed]').val();
    		
    		var weather=$('select[name=weather]').val();
    		var microDust=$('select[name=microDust]').val();
    		
    		if(date==""){
    			alert('날짜를 입력하세요');
    			
    			return;
    		}
    		
    		if(temperatures==""){
    			alert('온도를 입력하세요');
    			
    			return;
    		}
    		
    		if(precipitation==""){
    			alert('강수량을 입력하세요');
    			
    			return;
    		}
    		
    		if(windSpeed==""){
    			alert('풍속을 입력하세요');
    			
    			return;
    		}
    		
    		alert('저장 했습니다.');
    	});

    });