// Скролл до указанного элемента
function NgScrollTo($compile) {
	return {
		link: function($scope, element, attrs) {
			element.on('click', function() {
				$('html, body').animate({scrollTop: $(attrs.ngScrollTo).offset().top - 115}, 1000);
				return false;
			});
		}
	};
}