// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require_tree .

function showTransitions(){
	time = 500;
	$('#threesome .section .row .col.s12.m4.transition').each(function(){
		var a = $(this);
		setTimeout( function(){
			a.fadeIn("slow");
		}
		, time);		
		time += 500;		
	})	
}

window.onload =function(){
	var threesomeFlag = false;
	var trans = null;	
	//$( "#threesome" ).fadeIn("slow");
	//$('#threesome .section .row .col.s12.m4.transition').hide();
	showTransitions();
}



$(document).ready(function(){
	

  $('.parallax').parallax();
  console.log('parallax initialized');
  
  var scrollFireOptions = [
    {selector: '#tsdfhreesome', offset: 0, callback:  'showTransitions();'},
    {selector: '#staggered-test', offset: 205, callback: 'Materialize.toast("Please continue scrolling!", 1500 )' },
    {selector: '#staggered-test', offset: 400, callback:  'Materialize.toast("Please continue scrolling!", 1500 )'},
    {selector: '#image-test', offset: 500, callback: 'Materialize.fadeInImage("#image-test")' }
  ];
  Materialize.scrollFire(scrollFireOptions);
      
})
