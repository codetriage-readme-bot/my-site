romasks = angular.module('romasks',[
])

controllers = angular.module('controllers',[])
controllers.controller("MainCtrl", [ '$scope',
  ($scope)->
    $scope.hello = "Hello"
])