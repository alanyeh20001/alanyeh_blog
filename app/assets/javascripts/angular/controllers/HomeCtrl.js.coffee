@alanyehBlog.controller 'HomeCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  
  
  # Get articles information
  $http({
    method: "GET",
    url: "/articles/get_articles",
  }).then((data) ->
    console.log(data)
    $scope.articles = data.data
    console.log($scope.articles)
  )
 
  
  $scope.getAnArticle = (article_id) ->
    $location.path("/articles/" + article_id)
  
]
