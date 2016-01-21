@alanyehBlog.controller 'HomeCtrl', ['$scope', '$location', '$http', '$route', 'Auth', ($scope, $location, $http, $route, Auth) ->
  
  Auth.currentUser().then((user) ->
    $scope.user = user
    console.log("User_id: " + $scope.user.id)
    # Get user liked articles
    $scope.getUserLikedArticles()
    # Get all articles information
    $scope.getArticles()
  , (error) ->
    console.log("no user here")
    $scope.user = undefined
    $scope.user_liked_articles = []
    # Get all articles information
    $scope.getArticles()
  )

  # Check if user has liked the specific article
  $scope.IfUserLiked = (article_id) ->
    if article_id in $scope.user_liked_articles
      true
    else
      false
  
  # Add or remove like button mechanism
  $scope.addOrRemoveLike = (article_id, index) ->
    if $scope.user != undefined
      if article_id not in $scope.user_liked_articles
        $scope.addLikeList(article_id)
        params = {article_id: article_id, user_id: $scope.user.id}
        $http({
          method: "POST",
          url: "/article_likes/add_like_num_to_article",
          data: params
        }).then((data) ->
          console.log("Like amount:" + data.data)
          $scope.articles[index].like = data.data
        )
        $http({
          method: "POST",
          url: "/article_likes",
          data: params 
        }).then((data) ->
          console.log(data.data)
        )
      else
        $scope.removeLikeList(article_id)
        params = {article_id: article_id, user_id: $scope.user.id}
        $http({
          method: "POST",
          url: "/article_likes/minus_like_num_to_article",
          data: params
        }).then((data) ->
          console.log("Like amount:" + data.data)
          $scope.articles[index].like = data.data
        )
        $http({
          method: "DELETE",
          url: "/article_likes/delete_user_like_records",
          params
        }).then((data) ->
          console.log(data.data)
        )
    else
      $location.path("/login")  
    
  
  # =============== Functions ================
  
  
  
  # Get articles
  $scope.getArticles = () ->
    $http({
      method: "GET",
      url: "/articles",
    }).then((data) ->
      console.log(data)
      $scope.articles = data.data
      console.log($scope.articles)
    )
  
  # Get articles that user liked
  $scope.getUserLikedArticles = () ->
    params = { user_id: $scope.user.id }
    $http({
      method: "GET",
      url: "/article_likes/get_user_like_records",
      params
    }).then((data) ->
      $scope.user_liked_articles = data.data
      console.log($scope.user_liked_articles)
    )
  
  # Add article_id in like list(frontend)
  $scope.addLikeList = (article_id) ->
    $scope.user_liked_articles.push(article_id)
  
  # Remove article_id in like list(frontend)
  $scope.removeLikeList = (article_id) ->
    i = 0
    while article_id != $scope.user_liked_articles[i]
      i++
    $scope.user_liked_articles.splice(i,1)
  
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
