@alanyehBlog.controller 'ArchiveCtrl', ['$scope', '$location', '$http', '$route', '$routeParams', 'Auth', ($scope, $location, $http, $route, $routeParams, Auth) ->
  
  # Get all articles information
  $http({
    method: "GET",
    url: "/articles"
  }).then((data) ->
    $scope.articles = data.data
  
    # Sort the articles by category
    # 1 for "Coding", 2 for "Travel", 3 for "Movie", 4 for "Others"
    $scope.categoryCoding = []
    $scope.categoryTravel = []
    $scope.categoryMovie = []
    $scope.categoryOthers = []
    $scope.categoryTechnology = []
    $scope.categoryCommerce = []
    $scope.categoryMood = []
    for i in [0..$scope.articles.length-1]
      switch $scope.articles[i].category_id
        when 1 then $scope.categoryCoding.push($scope.articles[i])
        when 2 then $scope.categoryTravel.push($scope.articles[i])
        when 3 then $scope.categoryMovie.push($scope.articles[i])
        when 5 then $scope.categoryTechnology.push($scope.articles[i])
        when 6 then $scope.categoryCommerce.push($scope.articles[i])
        when 7 then $scope.categoryMood.push($scope.articles[i])
        else $scope.categoryOthers.push($scope.articles[i])
  )

  # List order by "time" or "category"
  $scope.listByTime = true
  $scope.listByTimeOrCategory = (num) ->
    if num == 1
      $scope.listByTime = true
    else 
      $scope.listByTime = false
  
  # Determine which category to display
  $scope.displayCategory = (num) ->
    if num == 1
      $scope.categoryItem = 1
    else if num == 2
      $scope.categoryItem = 2
    else if num == 3
      $scope.categoryItem = 3
    else if num == 5
      $scope.categoryItem = 5
    else if num == 6
      $scope.categoryItem = 6
    else if num == 7
      $scope.categoryItem = 7
    else
      $scope.categoryItem = 4
  
  # Direct to article show page & add browse times
  $scope.getAnArticle = (article_id) ->
    params = {article_id: article_id}
    $http({
      method: "POST",
      url: "/articles/add_browse_times",
      data: params
    }).then((data) ->
      console.log(data.status)
    )
    $location.path("/articles/" + article_id)
    
  # Scroll to the top of the page
  $scope.scrollTop = () ->
    $route.reload()  
  
  
]

@alanyehBlog.filter('StringSliceFilter', () ->
  (items, begin, end) ->
    items.slice(begin, end)
)

