function check(){
	var id = $('#id').val();
	if(id.length<1){
		alert('로그인 후 이용할 수 있는 서비스입니다.');
		location.href='LoginForm.jsp';
		return false;
	}else{
		return true;		
	}
}
	