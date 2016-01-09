@alanyehBlog.controller 'layoutCtrl', ['$scope', '$location', '$http', 'Auth',($scope, $location, $http, Auth) ->
  
  $scope.$on('NavbarChange', (checkSignInOrNot) ->
    $scope.checkSignInOrNot = true
  )
  
  Auth.currentUser().then((user) ->
    $scope.user = user
    console.log("layout load")
    $scope.checkSignInOrNot = true
  , (error) ->
    console.log(error)
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
      console.log(error)
    )
    
    $scope.$on('devise:logout', (event, oldCurrentUser) ->
      
    )

]
