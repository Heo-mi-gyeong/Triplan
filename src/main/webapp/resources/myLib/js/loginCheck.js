$(function(){
	idcheck = false;
	pwcheck = false;
	
	if('${message}'=='0'){
		$('#pwCheck').html('잘못된 아이디나 비밀번호입니다.');
		$('#pwCheck').css({
			'color': 'red',
			'fontSize' : '0.8rem'
		});
	}
	
	id.addEventListener("focusout", function() {
		var id=$('#id').val();
		if(id.length<1){
			$('#idCheck').html('아이디를 입력해주세요.');
			$('#idCheck').css({
				'color': 'red',
				'fontSize' : '0.8rem'
			});
			idcheck = false;
		}else{
			$('#idCheck').html('');
			idcheck=true;
		}
	});
	
	password.addEventListener("focusout", function() {
		var password=$('#password').val();
		if(password.length<1){
			$('#pwCheck').html('비밀번호를 입력해주세요.');
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

});

function inCheck() {
	if ( idcheck && pwcheck ) return true;
	else return false;
}