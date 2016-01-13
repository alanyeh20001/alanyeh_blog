@alanyehBlog.controller 'ShowCtrl', ['$scope', '$location', '$http', '$route', '$routeParams', 'Auth', ($scope, $location, $http, $route, $routeParams, Auth) ->
  
  $scope.article_id = $routeParams.id
  
  $scope.article = []
  
  # Get user id to check if author
  Auth.currentUser().then((user) ->
    $scope.user = user
    $scope.getAnArticle()
  , (error) ->
    console.log(error)
    $scope.user = undefined
    $scope.getAnArticle()
    
  )
  
  # Get article by article_id
  $scope.getAnArticle = () ->
    $http({
      method: "GET",
      url: "/articles/" + $scope.article_id
    }).then((data) ->
      console.log(data)
      $scope.article = data.data
    )
  
  $scope.scrollTop = () ->
    $route.reload()
  
  # Direct to article edit page
  $scope.editAnArticle = () ->
    $location.path("/articles/" + $scope.article_id + "/edit")
  
  # Delete an article
  $scope.deleteAnArticle = () ->
    $http({
      method: "DELETE",
      url: "/articles/" + $scope.article_id
    }).then((data) ->
      console.log(data.status)
      $location.path("/")
    )
]
