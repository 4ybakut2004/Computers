// Создаем AngularJs приложение с указанным в разметке именем
var app = angular.module('App', ['ngRoute', 'ngResource', 'ngDialog']);

app.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
	$locationProvider.html5Mode({
		enabled: true,
		requireBase: false
	});

	$routeProvider.when('/',{
		templateUrl: 'static_pages/home',
		controller: 'HomeController',
		reloadOnSearch: false
	}).otherwise({
		redirectTo: '/'
	});
}]);

app.factory('Request', ['$resource', RequestService]);

// Задействуем контроллер, управляющий приложением
app.controller(
	'HomeController', [
		'$rootScope', '$scope','$location',
		'$route', '$routeParams', 'Request',
		'ngDialog', HomeController
	]
);

app.directive('ngNavigation', ['$compile', NgNavigation]);
app.directive('ngScrollTo', ['$compile', NgScrollTo]);