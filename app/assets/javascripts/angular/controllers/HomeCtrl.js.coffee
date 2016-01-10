@alanyehBlog.controller 'HomeCtrl', ['$scope', '$location', '$http', 'Auth', ($scope, $location, $http, Auth) ->
  
#  Auth.currentUser().then((user) ->
#    $scope.user = user
#    console.log($scope.checkSignInOrNot)
#    console.log("home load")
#  , (error) ->
#    console.log(error)
#  )
  
  # Get all articles information
  $http({
    method: "GET",
    url: "/articles/get_articles",
  }).then((data) ->
    console.log(data)
    $scope.articles = data.data
    console.log($scope.articles)
  )
  
  # Direct to an specific article page
  $scope.getAnArticle = (article_id) ->
    $location.path("/articles/" + article_id)
  
]
