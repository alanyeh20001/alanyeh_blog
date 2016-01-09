@alanyehBlog.controller 'ShowCtrl', ['$scope', '$location', '$http', '$route', '$routeParams', 'Auth', ($scope, $location, $http, $route, $routeParams, Auth) ->
  
  $scope.article_id = $routeParams.id
  
  $scope.article = []
  
  # Get article by article_id
  $http({
    method: "GET",
    url: "/articles/" + $scope.article_id
  }).then((data) ->
    console.log(data)
    $scope.article = data.data
  )
  
  
  
]
