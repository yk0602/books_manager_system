app.controller("userInfoController", function($scope, $http) {
    $scope.user = {};
});

app.controller("registerController", function($scope, $http, $location) {
    $scope.user = {};
    $scope.register = function() {
        console.log($scope.user);
        $http.post('http://localhost:8080/register', {username:$scope.user.username, password:$scope.user.password, email:$scope.user.email})
        .success(function(data) {
            console.log(data.status);
            if(data.status === 'failed') {
                $scope.user = {};
            } else {
                $location.path('/login');
            }

        });
    };
});

app.controller("loginController", function($scope, $http, $location) {
    $scope.user = {};
    $scope.login = function() {
        $http.post('http://localhost:8080/login', {email:$scope.user.email, password:$scope.user.password})
        .success(function(data) {
            console.log(data.status);
            if(data.status === 'failed') {
                $scope.user={};
            } else {
                $location.path('/')
            }
        });
    };
});