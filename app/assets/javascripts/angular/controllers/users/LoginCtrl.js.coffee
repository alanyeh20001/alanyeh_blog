@alanyehBlog.controller 'LoginCtrl', ['$scope', '$rootScope', '$location', '$http', '$route', 'Auth', ($scope, $rootScope, $location, $http, $route, Auth) ->
  
  $scope.redirectUrl = $rootScope.RedirectUrl
  console.log($scope.redirectUrl)
  $scope.logIn = () ->
    credentials = {
      email: $scope.email,
      password: $scope.password
    }
    
    config = {
      headers: {
        'X-HTTP-Method-Override': 'POST'
      }
    }
    console.log(credentials)
    Auth.login(credentials, config).then((user) ->
      console.log(user)
      $scope.$emit('NavbarChange', $scope.checkSignInOrNot)
      $location.path($scope.redirectUrl)
    , (error) ->
      console.log("log_in error")
    )
    
    $scope.$on('devise:login', (event, currentUser) ->
    )
    
    $scope.$on('devise:new-session', (event, currentUser) ->
    )
  
]
