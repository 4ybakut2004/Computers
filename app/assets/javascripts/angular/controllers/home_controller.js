// Контроллер, управляющий домашней страницей
function HomeController($rootScope, $scope, $location, $route, $routeParams, Request, ngDialog) {
	new WOW().init();

	$scope.ngDialogData = {};

	$scope.createRequest = function() {
		Request.create({ name: $scope.name, phone: $scope.phone }, function(response) {
			ngDialog.open({
				template: 'static_pages/success_dialog',
				className: 'ngdialog-theme-default',
				data: $scope.ngDialogData,
				scope: $scope
			});
		}, function(response) {
			ngDialog.open({
				template: 'static_pages/error_dialog',
				className: 'ngdialog-theme-default',
				data: $scope.ngDialogData,
				scope: $scope
			});
		});
	}
}