@alanyehBlog.controller 'SearchCtrl', ['$scope', '$location', '$http', '$route', 'Auth', ($scope, $location, $http, $route, Auth) ->
  
  # Get qualified articles defined by search bar
#  $scope.$on('searchArticles', (searchContent) ->
#   $scope.searchContent = searchContent
#  )
  params = { title: $scope.searchContent }
  console.log(params)
  $http({
    method: "GET",
    url: "/articles",
    params
  }).then((data) ->
    $scope.articles = data.data
    console.log($scope.articles)
  )

  $scope.scrollTop = () ->
    $route.reload()
  
  
]
