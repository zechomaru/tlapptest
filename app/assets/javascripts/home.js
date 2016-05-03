(function($){
	$(document).ready(function(){
	$(".active").find(".hide_hover").addClass("menu_hide");
                    $(".active").find(".show_hover").addClass("menu_show");
		// Isotope filters
		//-----------------------------------------------
		if ($('.isotope-container').length>0) {
			$(window).load(function() {
				$('.isotope-container').fadeIn();
				var $container = $('.isotope-container').isotope({
					itemSelector: '.isotope-item',
					layoutMode: 'masonry',
					transitionDuration: '0.6s',
					filter: "*"
				});
				// filter items on button click
				$('.filters').on( 'click', 'div a', function() {
					var filterValue = $(this).attr('data-filter');
                    $(".active").find(".hide_hover").removeClass("menu_hide");
                    $(".active").find(".show_hover").removeClass("menu_show");
					$(".filters").find("div a.active").removeClass("active");
					$(this).addClass("active");
                    $(".active").find(".hide_hover").addClass("menu_hide");
                    $(".active").find(".show_hover").addClass("menu_show");
                    
                    //$(this).find("div a.active").addClass("active");
					$container.isotope({ filter: filterValue });
					return false;
				});
			});
		};



	}); // End document ready
})(this.jQuery);