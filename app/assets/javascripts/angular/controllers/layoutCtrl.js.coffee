@alanyehBlog.controller 'layoutCtrl', ['$scope', '$location', '$http', 'Auth',($scope, $location, $http, Auth) ->
  
  
  # Check if the user has signed in when reloading
  Auth.currentUser().then((user) ->
    $scope.user = user
    console.log("layout load")
    $scope.checkSignInOrNot = true
  , (error) ->
    console.log("layout user load error")
    $scope.checkSignInOrNot = false
  )

  $scope.signOut = () ->
    console.log('sign out ok')
    config = {
      headers: {
        'X-HTTP-Method-Override': 'DELETE'
      }
    }
    Auth.logout(config).then((oldUser) ->
      console.log(oldUser)
      $scope.checkSignInOrNot = false
    , (error) ->
      console.log("sign_out error")
    )
    $scope.$on('devise:logout', (event, oldCurrentUser) ->
    )
  
  # Receive info about user sign_out to change navbar list
  $scope.$on('NavbarChange', (checkSignInOrNot) ->
    $scope.checkSignInOrNot = true
  )

]
