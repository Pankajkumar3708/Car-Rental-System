var app = angular.module("rentalApp", []);

app.controller("SignupController", function ($scope, $http, $window) {
    $scope.user = {};
    $scope.successMessage = "";
    $scope.errorMessage = "";

    $scope.registerUser = function () {
        // Validate password match
        if ($scope.user.password !== $scope.user.confirmPassword) {
            $scope.errorMessage = "Passwords do not match!";
            $scope.successMessage = "";
            return;
        }

        var userData = {
            name: $scope.user.name,
            phone: $scope.user.phone,
            email: $scope.user.email,
            password: $scope.user.password,
            license_no: $scope.user.license_no,
            dob: $scope.user.dob,
            address: $scope.user.address
        };

        // Send data to the backend
        $http.post("http://localhost:5000/signup", userData)
            .then(function (response) {
                $scope.successMessage = "Registration successful!";
                $scope.errorMessage = "";

                // Store user details in localStorage
                localStorage.setItem("user", JSON.stringify({
                    name: userData.name,
                    email: userData.email
                }));

                // Redirect to Home Page after signup
                setTimeout(function () {
                    $window.location.href = "../Home Page/index.html";
                }, 1000);
            })
            .catch(function (error) {
                $scope.errorMessage = "Registration failed. Please try again.";
                $scope.successMessage = ""; // Ensure the success message is cleared
                console.error("Error:", error);
            });
    };
});
