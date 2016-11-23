receta = angular.module('receta',[
])

controllers = angular.module('controllers',[])
controllers.controller("MainCtrl", [ '$scope',
  ($scope)->
    $scope.hello = "Hello"
])