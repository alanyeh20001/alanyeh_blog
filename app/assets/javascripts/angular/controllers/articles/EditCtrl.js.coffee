@alanyehBlog.controller 'EditCtrl', ['$scope', '$location', '$http', '$route', '$routeParams', 'Auth', ($scope, $location, $http, $route, $routeParams, Auth) ->
  
  $scope.article_id = $routeParams.id
  console.log($scope.article_id)
  
  # Get the original article data
  $http({
    method: "GET",
    url: "/articles/" + $scope.article_id + "/edit",
  }).then((data) ->
    $scope.article = data.data
    console.log($scope.article)
    # Assign the original article data to the form
    $scope.title = $scope.article.title
    $scope.content = $scope.article.content
    $scope.name = $scope.article.category_id
  )
  
  # Update the modified article
  $scope.updateArticle = () ->
    params = {
      title: $scope.title,
      content: $scope.content,
      category_id: $scope.name,
    }
    $http({
      method: "PUT",
      url: "/articles/" + $scope.article_id,
      data: params
    }).then((data) ->
      console.log(data.status)
      $location.path("/articles/"+ $scope.article_id)
    )
  
  
]
