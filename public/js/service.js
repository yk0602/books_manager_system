app.factory('user', function() {
    return {};
});

app.factory('register', function($http, $location) {
   return(function($scope, username, password, email) {
       $http.post('http://localhost:8080/register', {username:username, password:password, email:email})
           .success(function(data) {
               if(data.status === 'failed') {
                   $scope.user = {};
                   console.log('注册失败');
                   return false;
               } else {
                   $location.path('/login');
                   console.log('注册成功');
                   return true;
               }
           });
   });
});

app.factory('login', function($http, $location, user) {
    return(function($scope, email, password) {
        $http.post('http://localhost:8080/login', {email:email, password:password})
            .success(function(data) {
                if(data.status === 'failed') {
                    $scope.user={};
                    $scope.loginResult = false;
                    console.log('登录失s败');
                } else {
                    user.username = data.username;
                    $location.path('/');
                    console.log('登录成功');
                }
            });
    });
});