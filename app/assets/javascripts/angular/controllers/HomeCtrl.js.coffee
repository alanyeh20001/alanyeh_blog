@alanyehBlog.controller 'HomeCtrl', ['$scope', '$location', '$http', '$route', 'Auth', ($scope, $location, $http, $route, Auth) ->
  
  Auth.currentUser().then((user) ->
    $scope.user = user
    # Get all articles information
    $scope.getArticles()
  , (error) ->
    console.log("no user here")
    $scope.user = undefined
    # Get all articles information
    $scope.getArticles()
  )
  
  # get articles function
  $scope.getArticles = () ->
    $http({
      method: "GET",
      url: "/articles",
    }).then((data) ->
      console.log(data)
      $scope.articles = data.data
      console.log($scope.articles)
    )
  
  # Create a new article
  $scope.createNewArticle = () ->
    $location.path("/articles/new")
  
  # Direct to article edit page
  $scope.editAnArticle = (article_id) ->
    $location.path("/articles/" + article_id + "/edit")
  
  # Direct to article show page
  $scope.getAnArticle = (article_id) ->
    $location.path("/articles/" + article_id)
  
  # Delete an article
  $scope.deleteAnArticle = (article_id) ->
    $http({
      method: "DELETE",
      url: "/articles/" + article_id
    }).then((data) ->
      console.log(data.status)
      $route.reload()
    )

]
