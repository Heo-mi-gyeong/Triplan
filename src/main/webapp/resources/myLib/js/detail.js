$(function(){
	var updateCheck=false;
	var contentTypeId = $('#contentTypeId').val();
	var contentId = $('#contentId').val();
	var LoginId = $('#LoginId').val();
	  $("#confirm").click(function(){
		 var review = $('#review').val();
		if(updateCheck==false){
			$.ajax({
				type:'Get',
				url:'reviewInsert',
				data:{
					id:LoginId,
					contentTypeId:contentTypeId,
					contentId:contentId,
					review:review
				},
				success:function(){
				    modalClose(); //모달 닫기 함수 호출
				    location.reload();
				},
				error:function(){
					alert('서버 에러입니다.');
				}
			});
		}else if(updateCheck==true){
				$.ajax({
				type:'Get',
				url:'reviewUpdate',
				data:{
					id:LoginId,
					contentTypeId:contentTypeId,
					contentId:contentId,
					review:review
				},
				success:function(){
				    modalClose(); //모달 닫기 함수 호출
				    location.reload();
				},
				error:function(){
					alert('서버 에러입니다.');
				}
			});
		}
	  });
	  $("#modal-open").click(function(){       
		  if(LoginId.length>1){
			  $.ajax({
					type:'Get',
					url:'reviewCheck',
					data:{
						id:LoginId,
						contentTypeId:contentTypeId,
						contentId:contentId
					},
					success:function(resultData){
						if(resultData.rno=='no'){
							alert('이미 작성한 리뷰가 있는 장소입니다.');
						}else if(resultData.rok=='ok'){
						      $("#popup").css('display','flex').hide().fadeIn();
						}
					},
					error:function(){
						alert('서버 에러입니다.');
					}
				});
		  }else{
			  alert('로그인 후 이용할 수 있는 서비스입니다.');
		  }
	  });
	  $("#close").click(function(){
	      modalClose(); 
	  });
	  function modalClose(){
	      $("#popup").fadeOut(); 
	  }
	if(LoginId.length>1){
		$.ajax({
			type:'Get',
			url:'likeSelect',
			data:{
				id:LoginId,
				contentTypeId:contentTypeId,
				contentId:contentId
			},
			success:function(resultData){
				if(resultData.no=='no'){
					$('.likeImg').attr('src','resources/myLib/image/like2.png');
				}else if(resultData.ok=='ok'){
					$('.likeImg').attr('src','resources/myLib/image/like1.png');
				}
			},
			error:function(){
				alert('서버 에러입니다.');
			}
		});
	}
	
	$("#delete").click(function(){
			$.ajax({
				type:'Get',
				url:'reviewDelete',
				data:{
					id:LoginId,
					contentTypeId:contentTypeId,
					contentId:contentId
				},
				success:function(){
				    location.reload();
				},
				error:function(){
					alert('서버 에러입니다.');
				}
			});
	  });

	$("#update").click(function(){
			$.ajax({
				type:'Get',
				url:'reviewCheck',
				data:{
					id:LoginId,
					contentTypeId:contentTypeId,
					contentId:contentId
				},
				success:function(resultData){
					updateCheck=true;
					$('#review').val(resultData.reviewContent.review);
					$("#popup").css('display','flex').hide().fadeIn();
				},
				error:function(){
					alert('서버 에러입니다.');
				}
			});
	  });
});
function tlike(){
	var contentTypeId = $('#contentTypeId').val();
	var contentId = $('#contentId').val();
	var LoginId = $('#LoginId').val();
	if(LoginId.length>1){
		$.ajax({
			type:'Get',
			url:'liketoggle',
			data:{
				id:LoginId,
				contentTypeId:contentTypeId,
				contentId:contentId
			},
			success:function(resultData){
				if(resultData.no=='no'){
					$('.likeImg').attr('src','resources/myLib/image/like2.png');
				}else if(resultData.ok=='ok'){
					$('.likeImg').attr('src','resources/myLib/image/like1.png');
				}
			},
			error:function(){
				alert('서버 에러입니다.');
			}
		});
	}else{
		alert('로그인 후 이용할 수 있는 서비스입니다.');
	}
}