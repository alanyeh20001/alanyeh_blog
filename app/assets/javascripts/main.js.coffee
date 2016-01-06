@alanyehBlog = angular.module('alanyehBlog', [])

@alanyehBlog.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/', {
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    }).
    when('/articles/:id', {
      templateUrl: '../templates/articles/show.html',
      controller: 'ShowCtrl'
    }).
    otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    })

])
