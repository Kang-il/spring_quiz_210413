$(document).ready(function(){
			
			//배너 일정 시간별로 변화주기
			var position=0;
            var items=['/images/lesson08_02/banner2.jpg','/images/lesson08_02/banner3.jpg','/images/lesson08_02/banner4.jpg','/images/lesson08_02/banner1.jpg'];
            setInterval(function(){
                $('.banner-img').attr('src',items[position]);
                position++;
                if(position==4){
                    position=0;
                }
            },3000);
            
            
            //datepicker
	        $('#datepickerOption').datepicker({
	                    changeMonth: true // 월을 셀렉트 박스
	                        , changeYear: true // 년 셀렉트 박스
	                        , dateFormat: "yy-mm-dd"  // 표시 형식 - (yyyy-mm-dd 여기선 년도를 yy만 쓴다.)
	                        , showAnim: "clip" // 애니메이션 효과 - slide, fadeIn, clip...
	          });
            
            
            // reserveList 에서 삭제 버튼 클릭 시 삭제하는 메서드
    		$('.delete-button').on('click',function(){
    			let bookingId=$(this).data('booking-id');
    			
    			//Request METHOD
    			//get
    			//-post
    			// -create
    			// -delete
    			
    			
    			//postMan:::
    			$.ajax({
    				type:'delete'
    				,data:{'booking_id':bookingId}
    				,url:'/lesson08/quiz02/del_booking'
    				,success:function(data){
    					if(data.result===true){
    						alert('성공');
    						location.reload();
    					}else{
    						alert('삭제 중 실패');
    					}
    					
    				}
    				,error:function(e){
    					alert('실패!'+e);
    				}
    			});
    			
    		});
    		
    		//예약 조회
    		$('#checkReservation').on('click',function(){
    			let name=$('input[name="name"]').val().trim();
    			let phoneNumber=$('input[name="phoneNumber"]').val().trim();
    			
    			if(name==''){
    				alert('이름을 입력해 주세요');
    				return;
    			}
    			if(phoneNumber==''){
    				alert('전화번호를 입력해 주세요.');
    				return;
    			}
    			
    			$.ajax({
    				type:'POST'
    				,data:{'name':name,'phoneNumber':phoneNumber}
    				,url:'/lesson08/quiz02/check_reservation'
    				,success:function(data){
    					if(data.name!=null){
	
    					alert('이름:'+data.name+'\n 날짜 : '+data.date+'\n 일수 : '+data.day+'\n 인원 : '+data.headcount+'\n 상태 : ' +data.state);
    					}else{
    						alert('예약내역이 없습니다');
    					}
    				}
    				,error:function(e){
    					alert('실패'+e);
    				}
    			});
    			
    		});
    		
    	//예약 유효성 검사 및 등록
    	$('#reserveBtn').on('click',function(){
    		let regisName=$('input[name=regisName]').val().trim();
    		let regisDate=$('input[name=regisDate]').val().trim();
    		let regisDay=$('input[name=regisDay]').val().trim();
    		let regisHeadcount=$('input[name=regisHeadcount]').val().trim();
    		let regisPhoneNumber=$('input[name=regisPhoneNumber]').val().trim();
    		
    		if(regisName==''){
    			alert('이름을 입력하세요');
    			return;
    		}
    		if(regisDate==''){
    			alert('날짜를 입력하세요');
    			return;
    		}
    		if(regisDay==''){
    			alert('숙박일수를 입력하세요');
    			return;
    		}
    		if(regisHeadcount==''){
    			alert('숙박인원을 입력하세요');
    			return;
    		}
    		if(regisPhoneNumber==''){
    			alert('전화번호를 입력하세요');
    			return;
    		}

    		$.ajax({
    			type:'POST'
    			,data:{'name':regisName
    					,'date':regisDate
    					,'day':regisDay
    					,'headcount':regisHeadcount
    					,'phoneNumber':regisPhoneNumber}
    			,url:'/lesson08/quiz02/register_reservation'
    			,success:function(data){
    				if(data.is_duplication===false){
    					alert('해당 이름과 번호로 이미 예약이 진행중입니다');
    				}else{
    					alert('예약완료');
    				}
    			}
    			,error:function(){
    				
    			}
    		});
    		
    	});
    	
  });  		