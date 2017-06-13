// Создаем AngularJs приложение с указанным в разметке именем
var app = angular.module('App', ['ngRoute', 'ngResource', 'ngDialog']);

$(document).on('ready page:load', function() {
	angular.bootstrap(document.getElementById('App'), ['App']);
});