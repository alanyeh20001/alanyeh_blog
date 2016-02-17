@alanyehBlog = angular.module('alanyehBlog', ['Devise', 'ngCkeditor'])

@alanyehBlog.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/', {
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    }).
    when('/articles/new', {
      templateUrl: '/templates/articles/new.html',
      controller: 'NewCtrl'
    }).
    when('/articles/:id', {
      templateUrl: '/templates/articles/show.html',
      controller: 'ShowCtrl'
    }).
    when('/articles/:id/edit', {
      templateUrl: '/templates/articles/edit.html',
      controller: 'EditCtrl'
    }).
    when('/login', {
      templateUrl: '../templates/users/login.html',
      controller: 'LoginCtrl'
    }).
    when('/register', {
      templateUrl: '../templates/users/register.html',
      controller: 'RegisterCtrl'
    }).
    when('/archives', {
      templateUrl: '../templates/archives/archive.html',
      controller: 'ArchiveCtrl'
    }).
    when('/introduction', {
      templateUrl: '../templates/introduction/introduction.html',
      controller: 'IntroductionCtrl'
    }).
    when('/search', {
      templateUrl: '../templates/search.html',
      controller: 'SearchCtrl'
    }).
    otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    })
])

@alanyehBlog.config(['AuthProvider', 'AuthInterceptProvider', (AuthProvider, AuthInterceptProvider) ->
  # Customize Login
  #AuthProvider.loginMethod('POST')
  #AuthProvider.loginPath('/users/signin.json')
  
  # Customize logout
  AuthProvider.logoutMethod('DELETE')
  AuthProvider.logoutPath('/users/sign_out.json')
  
  # Customize Register
  AuthProvider.registerMethod('POST')
  AuthProvider.registerPath('/users.json')
  
  # Customize the resource name data use namespaced under
  # Pass false to disable the namespace altogether.
  #AuthProvider.resourceName('customer')
  
  # Customize user parsing
  # NOTE: **MUST** return a truth-y expression
  #AuthProvider.parse(response) ->
  #  response.data.user
  
  # Intercept 401 Unauthorized everywhere
  # Enables 'devise:unauthorized' interceptor
  #AuthInterceptProvider.interceptAuth(true)
])


