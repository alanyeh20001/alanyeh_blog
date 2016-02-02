@alanyehBlog.controller 'NewCtrl', ['$scope', '$rootScope', '$location', '$http', '$route', '$routeParams', 'Auth', ($scope, $rootScope, $location, $http, $route, $routeParams, Auth) ->
  
  Auth.currentUser().then((user) ->
    $scope.user = user
    console.log($scope.user)
  , (error) ->
    console.log(error)
    $rootScope.RedirectUrl = $location.url()
    $location.path("/login")
  )
  
  $scope.createArticle = () ->
    params = {
      title: $scope.title,
      content: $scope.content,
      category_id: $scope.name,
      like: 0,
      browse_times: 0,
      user_id: $scope.user.id
    }
    console.log(params)
    $http({
      method: "POST",
      url: "/articles",
      data: params
    }).then((data) ->
      console.log(data)
      article_id = data.data.article_id
      $location.path("/articles/"+ article_id)
    )
    
]

