@alanyehBlog.controller 'IntroductionCtrl', ['$scope', '$location', '$http', '$route', 'Auth', ($scope, $location, $http, $route, Auth) ->
  
  $scope.image = 'assets/images/me.jpg'
  console.log($scope.image)
]
