var idcheck=false;
var pwcheck=false;
var pwccheck=false;
var ncheck=false;
var numcheck=false;

$(function(){
	id.addEventListener("focusout", function() {
		var id=$('#id').val();
		$('#iImg').css('visibility','hidden');
		if(id.length<1||id.length>20){
			$('#idCheck').html('아이디는 1~20자로 작성해주세요.');
			$('#idCheck').css({
				'color': 'red',
				'fontSize' : '0.8rem'
			});
			idcheck=false;
		}else if(id.replace(/[a-z.0-9]/gi,'').length>0){
			$('#idCheck').html('아이디는 영문, 숫자로만 작성해주세요.');
			idcheck=false;
		}else{
			$.ajax({
				type:'Post',
				url:'joinCh?id='+id,
				success:function(resultData){
					if(resultData.message=='ok'){
						$('#iImg').css('visibility','visible');
						$('#idCheck').html('');
						idcheck=true;
						$('#password').focus();
					}else if(resultData.message=='no'){
						$('#idCheck').html('존재하는 아이디입니다.');
						$('#idCheck').css({
							'color': 'red',
							'fontSize' : '0.8rem'
						});
						idcheck=false;
					}
				},
				error:function(){
					alert('서버 에러입니다');
				}
			});
		}
	});
	
	password.addEventListener("focusout", function() {
		var password=$('#password').val();
		if(password.length<1||password.length>20){
			$('#pwCheck').html('비밀번호를 4~16자로 작성해 주세요.');
			$('#pwCheck').css({
				'color': 'red',
				'fontSize' : '0.8rem'
			});
			pwcheck = false;
		}else{
			$('#pwCheck').html('');
			pwcheck=true;
		}
	});
	
	passwordc.addEventListener("focusout", function() {
		var password=$('#password').val();
		var pw=$('#passwordc').val();
		if ( password!=pw ) {
			$('#pwcCheck').html('비밀번호가 일치하지 않습니다.');
			$('#pwcCheck').css({
				'color': 'red',
				'fontSize' : '0.8rem'
			});
			pwccheck = false;
		}else{
			$('#pwcCheck').html('');
			pwccheck=true;
		}
	});
	
	nick.addEventListener("focusout", function() {
		var nick=$('#nick').val();
		$('#nImg').css('visibility','hidden');
		if(nick.length<1||nick.length>10){
			$('#nCheck').html('닉네임은 1~10자로 작성해주세요.');
			$('#nCheck').css({
				'color': 'red',
				'fontSize' : '0.8rem'
			});
			ncheck=false;
		}else if(nick.replace(/[a-z.가-힣.0-9]/gi,'').length > 0){
			$('#nCheck').html('닉네임에 특수문자는 포함할 수 없습니다.');
			ncheck=false;
		}else{
			$.ajax({
				type:'Post',
				url:'joinCh2?nick='+nick,
				success:function(resultData){
					if(resultData.message=='ok'){
						$('#nImg').css('visibility','visible');
						$('#nCheck').html('');
						ncheck=true;
						$('#num').focus();
					}else if(resultData.message=='no'){
						$('#nCheck').html('존재하는 닉네임입니다.');
						$('#nCheck').css({
							'color': 'red',
							'fontSize' : '0.8rem'
						});
						ncheck=false;
					}
				},
				error:function(){
					alert('서버 에러입니다');
				}
			});
		}
	});
	
	num.addEventListener("focusout", function() {
		var num=$('#num').val();
	     var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		if(password.length<1){
			$('#numCheck').html('');
			numcheck = true;
		}else if(num.length>1&&regPhone.test(num) === false){
			$('#numCheck').html('전화번호 형식으로 작성해주세요.');
			$('#numCheck').css({
				'color': 'red',
				'fontSize' : '0.8rem'
			});
			numcheck = false;
		}else{
			$('#numCheck').html('');
			numcheck=true;
		}
	});
});

function inCheck(){
	if ( idcheck && pwcheck && pwccheck && ncheck && numcheck) return true; 
	else return false;
}