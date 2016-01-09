@alanyehBlog.controller 'LoginCtrl', ['$scope', '$location', '$http', '$route', 'Auth', ($scope, $location, $http, $route, Auth) ->
  
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
      $location.path("/")
    , (error) ->
      console.log(error)
    )
    
    $scope.$on('devise:login', (event, currentUser) ->
    )
    
    $scope.$on('devise:new-session', (event, currentUser) ->
    )
    
]
