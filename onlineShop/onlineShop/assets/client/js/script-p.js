// ===== back-to-top =====
var amountScrolled = 300;

$(window).scroll(function() {
	if ( $(window).scrollTop() > amountScrolled ) {
		$('.back-to-top').fadeIn('slow');
	} else {
		$('.back-to-top').fadeOut('slow');
	}
});
$(window).scroll(function() {
	if ( $(window).scrollTop() > 300 ) {
		$('.sub-item1').addClass('sub-item11 animated slideInDown');
	}
	if ( $(window).scrollTop() > 600 ) {
		$('.sub-item2').addClass('sub-item11 animated slideInUp');
	}
	if ( $(window).scrollTop() > 1300 ) {
		$('.sub-item3').addClass('sub-item11 animated slideInDown');
	}
	if ( $(window).scrollTop() > 1600 ) {
		$('.sub-item4').addClass('sub-item11 animated slideInUp');
	}
	if ( $(window).scrollTop() > 2000 ) {
		$('.sub-item5').addClass('sub-item11 animated slideInDown');
	}
	if ( $(window).scrollTop() > 2300 ) {
		$('.sub-item6').addClass('sub-item11 animated slideInUp');
	}
});

$('.back-to-top').click(function() {
	$('html, body').animate({
		scrollTop: 0
	}, 700);
	return false;
});

// ===== huong dan mua hang =====
$(".huong-dan").click(function() {
    $('html,body').animate({
        scrollTop: $(".how-it-works").offset().top},
        'slow');
});

// ===== button search =====
$(function() {
	 
	$( ".openSearch" ).click(function(){
		$('#searchForm').slideToggle(350);
	});
	
});

// ===== scroll for top products =====
$(window).scroll(function() {
	if ( $(window).scrollTop() > amountScrolled ) {
		$('.top1').addClass('magictime slideUpRetourn');
	}
});
// ===== for tooltip =====
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
// main

$(document).ready(function(){
	$(".tab1 .single-bottom").hide();
	$(".tab2 .single-bottom").hide();
	$(".tab3 .single-bottom").hide();
	$(".tab4 .single-bottom").hide();
	$(".tab5 .single-bottom").hide();
								
	$(".tab1 ul").click(function(){
		$(".tab1 .single-bottom").slideToggle(300);
		$(".tab2 .single-bottom").hide();
		$(".tab3 .single-bottom").hide();
		$(".tab4 .single-bottom").hide();
		$(".tab5 .single-bottom").hide();
	})
	$(".tab2 ul").click(function(){
		$(".tab2 .single-bottom").slideToggle(300);
		$(".tab1 .single-bottom").hide();
		$(".tab3 .single-bottom").hide();
		$(".tab4 .single-bottom").hide();
		$(".tab5 .single-bottom").hide();
	})
	$(".tab3 ul").click(function(){
		$(".tab3 .single-bottom").slideToggle(300);
		$(".tab4 .single-bottom").hide();
		$(".tab5 .single-bottom").hide();
		$(".tab2 .single-bottom").hide();
		$(".tab1 .single-bottom").hide();
	})
	$(".tab4 ul").click(function(){
		$(".tab4 .single-bottom").slideToggle(300);
		$(".tab5 .single-bottom").hide();
		$(".tab3 .single-bottom").hide();
		$(".tab2 .single-bottom").hide();
		$(".tab1 .single-bottom").hide();
	})	
	$(".tab5 ul").click(function(){
		$(".tab5 .single-bottom").slideToggle(300);
		$(".tab4 .single-bottom").hide();
		$(".tab3 .single-bottom").hide();
		$(".tab2 .single-bottom").hide();
		$(".tab1 .single-bottom").hide();
	})	
});
