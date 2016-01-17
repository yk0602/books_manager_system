var app = angular.module('indexApp',['ngRoute']);
app.config(['$routeProvider',function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl:'/main.html'
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