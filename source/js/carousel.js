$(document).ready(function () {
	list = $("#carousel_list li")
	first = $("#carousel_list li:first-child")
	$(list).each(function (index) {
	  $(this).css('left', $(first).width() * index);
	});
	$(first).css('left', '0px');
	
	$(window).resize(function() {
      $(list).each(function (index) {
	    $(this).css('left', $(first).width() * index);
	  });
    });
});