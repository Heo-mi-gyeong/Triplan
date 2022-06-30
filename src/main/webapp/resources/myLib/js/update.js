var pwcheck=false;
var pwccheck=false;
var numcheck=false;

$(function(){
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
	if ( pwcheck && pwccheck && numcheck) return true; 
	else return false;
}