var app = angular.module('indexApp',['ngRoute']);
app.config(['$routeProvider',function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl:'/main.html',
            controller:'mainController'
        })
        .when('/login', {
            templateUrl: '/login.html',
            controller: 'loginController'
        })
        .when('/register', {
            templateUrl: '/register.html',
            controller: 'registerController'
        })
        .otherwise({
            redirectTo: '/'
        });
}]);