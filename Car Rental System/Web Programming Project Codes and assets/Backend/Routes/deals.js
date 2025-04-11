var app = angular.module("rentalApp", []);

app.controller("CarController", function ($scope, $http) {

    $http.get("http://localhost:5000/vehicles")
        .then(function (response) {
            console.log("API Response:", response.data);

            $scope.cars = response.data;

            $scope.visibleCars = 4;
        })
        .catch(function (error) {
            console.error("Error fetching vehicle data:", error);
        });

    $scope.showAll = function () {
        $scope.visibleCars = $scope.cars.length;
    };
});
