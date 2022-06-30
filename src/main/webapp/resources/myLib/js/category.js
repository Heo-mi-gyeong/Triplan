$(function(){
	var cti = $('#contentTypeId').val();
	var midSel=false; var codeSel=false; var smallSel=false;
	$('.drop-down .three').css('display','none');
	
	if(cti=='12'){
		$('.drop-down .three').css('display','block');
		$('.drop-down .one a').css('width','140px');
		$('.drop-down .two a').css('width','150px');
		$('.drop-down .four a').css('width','130px');
		$('.drop-down .five a').css('width','190px');
		$('#select').css('width','110px');
	}else if(cti=='15'||cti=='14'){
		$('#cat1').val('A02');
		midSel=true;
	}else if(cti=='25'){
		$('#cat1').val('C01');
		midSel=true;
	}else if(cti=='28'){
		$('#cat1').val('A03');
		midSel=true;
	}else if(cti=='32'){
		$('#cat1').val('B02');
		midSel=true;
	}else if(cti=='38'){
		$('#cat1').val('A04');
		midSel=true;
	}else if(cti=='39'){
		$('#cat1').val('A05');
		midSel=true;
	}
	
	$(".drop-down .two a").click(function() {
		$('.drop-down .options ul').css('display','none');
		$('.drop-down .options table').css('display','none');
		var areaCode = $('#areaCode').val();
		if(codeSel==true){
			$.ajax({
				type:'Get',
				url:'codeOp?areaCode='+areaCode,
				success:function(resultData){
					for (i = 0; i < resultData.list.length; i++) {
						$('.drop-down .option_one ul .li'+(i+1)).css('display','block');
						$('.drop-down .option_one ul li .name'+(i+1)).html(resultData.list[i].name);
						$('.drop-down .option_one ul li .name'+(i+1)).attr('id',resultData.list[i].code);
					}
					for(var j = i ; j<10; j++){
						$('.drop-down .option_one ul .li'+(j+1)).css('display','none');
					}
				},
				error:function(){
					alert('서버 에러입니다.');
				}
			});
			var $options = $(this).parent().siblings('.options');
			$options.find('> ul').toggle();
		}else{
			alert('여행지역을 먼저 선택해주세요');
		}
	});
	
		$(".drop-down .three a").click(function() {
			$('.drop-down .options ul').css('display','none');
			$('.drop-down .options table').css('display','none');
			$('.drop-down .option_two ul li .name1').html('자연');
			$('.drop-down .option_two ul li .name1').attr('id','A01');
			$('.drop-down .option_two ul li .name2').html('문화/예술/역사');
			$('.drop-down .option_two ul li .name2').attr('id','A02');
			var $options = $(this).parent().siblings('.options');
			$options.find('> ul').toggle();
		});
			
	$(".drop-down .four a").click(function() {
		$('.drop-down .options ul').css('display','none');
		$('.drop-down .options table').css('display','none');
		var cat1 = $('#cat1').val();
		if(midSel==true){
			$.ajax({
				type:'Get',
				url:'midOp?cat1='+cat1+'&contentTypeId='+cti+'&cat2=',
				success:function(resultData){
					for (i = 0; i < resultData.list.length; i++) {
						$('.drop-down .option_three ul .li'+(i+1)).css('display','block');
						$('.drop-down .option_three ul li .name'+(i+1)).html(resultData.list[i].name);
						$('.drop-down .option_three ul li .name'+(i+1)).attr('id',resultData.list[i].code);
					}
					for(var j = i ; j<10; j++){
						$('.drop-down .option_three ul .li'+(j+1)).css('display','none');
					}
				},
				error:function(){
					alert('서버 에러입니다.');
				}
			});
			var $options = $(this).parent().siblings('.options');
			$options.find('> ul').toggle();
		}else{
			alert('대분류를 먼저 선택해주세요');
		}
	});
	
	$(".drop-down .five a").click(function() {
		$('.drop-down .options ul').css('display','none');
		var cat2 = $('#cat2').val(); var cat1 = $('#cat1').val();
		if(smallSel==true){
			$.ajax({
				type:'Get',
				url:'midOp?cat1='+cat1+'&contentTypeId='+cti+'&cat2='+cat2,
				success:function(resultData){
					$('.drop-down .option_four table').css('display','block');
					for (i = 0; i < resultData.list.length; i++) {
						$('.drop-down .option_four table .name'+(i+1)).html(resultData.list[i].name);
						$('.drop-down .option_four table .name'+(i+1)).attr('id',resultData.list[i].code);
					}
					for(var j = i ; j<19; j++){
						$('.drop-down .option_four table .td'+(j+1)).css('display','none');
					}
				},
				error:function(){
					alert('서버 에러입니다.');
				}
			});
			var $options = $(this).parent().siblings('.options');
			$options.find('> table').toggle();
		}else{
			alert('종류를 먼저 선택해주세요');
		}
	});
	
	$(".drop-down .option_four table td a").click(function() {
	    var text = $(this).html();
	    var $five = $(this).closest('.options').siblings('.five');
	    $five.find('> a > span').html(text);
		smallSel=true;
		$('#cat3').val($(this).attr('id'));
	    $(this).closest('table').hide();
	}); 
	
	$(".drop-down .option_three ul li a").click(function() {
	    var text = $(this).html();
	    var $four = $(this).closest('.options').siblings('.four');
	    $four.find('> a > span').html(text);
		smallSel=true;
	    midSel=true;
		$('#cat2').val($(this).attr('id'));
		$('#cat3').val('');
	    $(this).closest('ul').hide();
	}); 
	
	$(".drop-down .one a").click(function() {
		$('.drop-down .options table').css('display','none');
		$('.drop-down .options ul').css('display','none');
		var $options = $(this).parent().siblings('.options');
		$options.find('> ul').toggle();
	});

	$(".drop-down .option_two ul li a").click(function() {
	    var text = $(this).html();
	    var $three = $(this).closest('.options').siblings('.three');
	    $three.find('> a > span').html(text);
		$('#cat1').val($(this).attr('id'));
		$('#cat2').val('');
	    midSel=true;
	    $(this).closest('ul').hide();
	}); 
		
	$(".drop-down .option_one ul li a").click(function() {
	    var text = $(this).html();

	    var $two = $(this).closest('.options').siblings('.two');
	    $two.find('> a > span').html(text);
		$('#sigunguName').val($(this).text());
		$('#sigunguCode').val($(this).attr('id'));
	    codeSel=true;
	    
	    $(this).closest('ul').hide();
	});

	$(".drop-down .option ul li a").click(function() {
	    var text = $(this).html();
	    
	    var $selected = $(this).closest('.options').siblings('.selected');
	    $selected.find('> a > span').html(text);
	    codeSel=true;
	    $('#areaCode').val($(this).attr('id'));
		$('#areaName').val($(this).text());
		$('#sigunguCode').val('');
		$('.two a span').html('시/군/구');
	    $(this).closest('ul').hide();
	}); 
	 
	//페이지의 다른 위치를 클릭하면 옵션 숨기기
	$(document).bind('click', function(e) {
	    var $clicked = $(e.target);
	    if (!$clicked.parents().hasClass("drop-down")){
	            $(".drop-down .options ul").hide();
				$(".drop-down .options table").hide();
	        }
	});
	
	$('#cti'+$('#contentTypeId').val()).css({
	color:'#8E8DBE',
	fontWeight:'bold'
	});
});
