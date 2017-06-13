// Директива для шапки
function NgNavigation($compile) {
	return {
		link: function($scope, element, attrs) {
			// Navigation Scroll
			$(window).scroll(function(event) {
				Scroll();
			});

			element.find('ul li a').on('click', function() {  
				$('html, body').animate({scrollTop: $(this.hash).offset().top - 115}, 1000);
				return false;
			});

			// User define function
			function Scroll() {
				var contentTop      =   [];
				var contentBottom   =   [];
				var winTop      =   $(window).scrollTop();
				var rangeTop    =   200;
				var rangeBottom =   500;
				element.find('.scroll a').each(function(){
					contentTop.push( $( $(this).attr('href') ).offset().top);
					contentBottom.push( $( $(this).attr('href') ).offset().top + $( $(this).attr('href') ).height() );
				})
				if(attrs.setActive) {
					$.each( contentTop, function(i){
						if ( winTop > contentTop[i] - rangeTop ){
							element.find('li.scroll')
							.removeClass('active')
							.eq(i).addClass('active');
						}
					});
				}
			};
		}
	};
}

app.directive('ngNavigation', ['$compile', NgNavigation]);