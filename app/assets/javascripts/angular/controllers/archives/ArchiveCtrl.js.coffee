@alanyehBlog.controller 'ArchiveCtrl', ['$scope', '$location', '$http', '$route', '$routeParams', 'Auth', ($scope, $location, $http, $route, $routeParams, Auth) ->
  
  # Get all articles information
  $http({
    method: "GET",
    url: "/articles"
  }).then((data) ->
    $scope.articles = data.data
  
    # Sort the articles by category
    # 1 for "Coding", 2 for "Traveling", 3 for "Photos", none for "Others"
    $scope.categoryCoding = []
    $scope.categoryTraveling = []
    $scope.categoryPhotos = []
    $scope.categoryOthers = []
    for i in [0..$scope.articles.length-1]
      switch $scope.articles[i].category_id
        when 1 then $scope.categoryCoding.push($scope.articles[i])
        when 2 then $scope.categoryTraveling.push($scope.articles[i])
        when 3 then $scope.categoryPhotos.push($scope.articles[i])
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
    else
      $scope.categoryItem = 4
  
  # Scroll to the top of the page
  $scope.scrollTop = () ->
    $route.reload()  
  
  
]

@alanyehBlog.filter('StringSliceFilter', () ->
  (items, begin, end) ->
    items.slice(begin, end)
)

