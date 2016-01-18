app.controller("mainController", function($scope, user) {
    $scope.user = user;
});

app.controller("registerController", function($scope, register) {
    $scope.user = {};
    $scope.register = function() {
        register($scope, $scope.user.username, $scope.user.password, $scope.user.email);
    };
});

app.controller("loginController", function($scope, login) {
    $scope.user = {};
    $scope.loginResult = true;
    $scope.login = function() {
        login($scope, $scope.user.email, $scope.user.password);
        console.log($scope.loginResult)
    };
});