@alanyehBlog.controller 'ShowCtrl', ['$scope', '$location', '$http', '$route', '$routeParams', ($scope, $location, $http, $route, $routeParams) ->
  
  $scope.article_id = $routeParams.id
  $scope.article = []
  console.log($routeParams)
  $http({
    method: "GET",
    url: "/articles/" + $scope.article_id
  }).then((data) ->
    console.log(data)
    $scope.article = data.data
  )
  
  
  
]
