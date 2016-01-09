@alanyehBlog.controller 'RegisterCtrl', ['$scope', '$location', '$http', 'Auth', ($scope, $location, $http, Auth) ->
  
  $scope.register = () ->
    credentials = {
      email: $scope.email,
      password: $scope.password,
      password_confirmation: $scope.password_confirm,
      name: $scope.name
    }
    
    config = {
      headers: {
        'X-HTTP-Method-Override': 'POST'
      }
    }
    
    Auth.register(credentials, config).then((registeredUser) ->
      console.log(registeredUser)
      $scope.$emit('NavbarChange', $scope.checkSignInOrNot)
      $location.path('/')
    , (error) ->
      console.log(error)
    )
    
    $scope.$on('devise:new-registration', (event, user) ->
    )

]
