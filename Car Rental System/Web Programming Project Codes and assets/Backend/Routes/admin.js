// Function to fetch and display Users
function showUsers() {
    fetch("http://localhost:5000/getUsers")
        .then(response => response.json())
        .then(data => {
            let headers = ["ID", "Name", "Phone", "Address", "License No.", "DOB", "Role", "Email", "Actions"];
            let rows = data.map(user => `
                <tr>
                    <td>${user.user_id}</td>
                    <td>${user.name}</td>
                    <td>${user.phone}</td>
                    <td>${user.address}</td>
                    <td>${user.license_no}</td>
                    <td>${user.dob}</td>
                    <td>${user.role}</td>
                    <td>${user.email}</td>
                    <td>
                        <button class="delete-btn" onclick="deleteUser(${user.user_id})">Delete</button>
                    </td>
                </tr>
            `);
            updateTable("Users List", headers, rows);
        })
        .catch(error => console.error("Error fetching users:", error));
}

// Function to fetch and display Vehicles
function showCars() {
    fetch("http://localhost:5000/getCars")
        .then(response => response.json())
        .then(data => {
            let headers = ["ID", "Name", "Type", "Price/Day", "Rating", "Passengers", "Transmission", "Doors", "Status", "Actions"];
            let rows = data.map(car => `
                <tr>
                    <td>${car.vehicle_id}</td>
                    <td>${car.vehicle_name}</td>
                    <td>${car.vehicle_type}</td>
                    <td>${car.price_per_day}</td>
                    <td>${car.rating}</td>
                    <td>${car.passengers}</td>
                    <td>${car.transmission}</td>
                    <td>${car.doors}</td>
                    <td>${car.availability_status}</td>
                    <td>
                        <button class="delete-btn" onclick="deleteCar(${car.vehicle_id})">Delete</button>
                    </td>
                </tr>
            `);
            updateTable("Cars List", headers, rows);
        })
        .catch(error => console.error("Error fetching cars:", error));
}

// Function to fetch and display Rented Cars
function showRents() {
    fetch("http://localhost:5000/getRents")
        .then(response => response.json())
        .then(data => {
            let headers = ["Booking ID", "User Name", "Vehicle", "Start Date", "End Date", "Status"];
            let rows = data.map(rent => `
                <tr>
                    <td>${rent.booking_id}</td>
                    <td>${rent.user_name}</td>
                    <td>${rent.vehicle_name}</td>
                    <td>${rent.start_date}</td>
                    <td>${rent.end_date || "Ongoing"}</td>
                    <td>${rent.status}</td>
                </tr>
            `);
            updateTable("Rented Vehicles", headers, rows);
        })
        .catch(error => console.error("Error fetching rented vehicles:", error));
}

// Function to fetch and display Drivers
function showDrivers() {
    fetch("http://localhost:5000/getDrivers")
        .then(response => response.json())
        .then(data => {
            let headers = ["ID", "Name", "Phone", "License No.", "Availability"];
            let rows = data.map(driver => `
                <tr>
                    <td>${driver.driver_id}</td>
                    <td>${driver.name}</td>
                    <td>${driver.phone}</td>
                    <td>${driver.license_number}</td>
                    <td>${driver.availability_status}</td>
                </tr>
            `);
            updateTable("Drivers List", headers, rows);
        })
        .catch(error => console.error("Error fetching drivers:", error));
}

// Function to update the table
function updateTable(title, headers, rows) {

    console.log("Updating Table: ", title, headers, rows);
    document.getElementById("section-title").innerText = title;
    document.getElementById("table-header").innerHTML = headers.map(h => `<th>${h}</th>`).join("");
    document.getElementById("table-body").innerHTML = rows.join("");

}

// Function to delete a user
function deleteUser(userId) {
    if (confirm("Are you sure you want to delete this user?")) {
        fetch(`http://localhost:5000/deleteUser/${userId}`, { method: "DELETE" })
            .then(response => response.json())
            .then(() => {
                alert("User deleted successfully!");
                showUsers(); // Refresh user list after deletion
            })
            .catch(error => console.error("Error deleting user:", error));
    }
}

// Function to delete a car
function deleteCar(carId) {
    if (confirm("Are you sure you want to delete this car?")) {
        fetch(`http://localhost:5000/deleteCar/${carId}`, { method: "DELETE" })
            .then(response => response.json())
            .then(() => {
                alert("Car deleted successfully!");
                showCars(); // Refresh car list after deletion
            })
            .catch(error => console.error("Error deleting car:", error));
    }
}

// Fetch and display Popular Deals (Pricing Plans)
function showPopularDeals() {
    fetch("http://localhost:5000/getPlans")
        .then(response => response.json())
        .then(data => {
            let headers = ["Plan ID", "Plan Name", "Vehicle Type", "Price/Hour", "Price/Day", "Actions"];
            let rows = data.map(plan => `
                <tr>
                    <td>${plan.plan_id}</td>
                    <td>${plan.plan_name}</td>
                    <td>${plan.vehicle_type}</td>
                    <td>${plan.price_per_hour}</td>
                    <td>${plan.price_per_day}</td>
                    <td>
                        <button class="delete-btn" onclick="deletePlan(${plan.plan_id})">Delete</button>
                    </td>
                </tr>
            `);
            updateTable("Popular Deals", headers, rows);
        })
        .catch(error => console.error("Error fetching plans:", error));
}

// Fetch and display Reviews
function showReviews() {
    fetch("http://localhost:5000/getReviews")
        .then(response => response.json())
        .then(data => {
            let headers = ["Review ID", "User ID", "Vehicle ID", "Rating", "Review", "Date", "Actions"];
            let rows = data.map(review => `
                <tr>
                    <td>${review.review_id}</td>
                    <td>${review.user_id}</td>
                    <td>${review.vehicle_id}</td>
                    <td>${review.rating}</td>
                    <td>${review.review_text}</td>
                    <td>${review.created_at}</td>
                    <td>
                        <button class="delete-btn" onclick="deleteReview(${review.review_id})">Delete</button>
                    </td>
                </tr>
            `);
            updateTable("Reviews", headers, rows);
        })
        .catch(error => console.error("Error fetching reviews:", error));
}

// Fetch and display Drivers with Salary
function showDriversWithSalary() {
    fetch("http://localhost:5000/getDriversWithSalary")
        .then(response => response.json())
        .then(data => {
            let headers = ["Driver ID", "Name", "Phone", "License No.", "Availability", "Salary ID", "Monthly Salary", "Actions"];
            let rows = data.map(driver => `
                <tr>
                    <td>${driver.driver_id}</td>
                    <td>${driver.name}</td>
                    <td>${driver.phone}</td>
                    <td>${driver.license_number}</td>
                    <td>${driver.availability_status}</td>
                    <td>${driver.salary_id}</td>
                    <td>${driver.monthly_salary}</td>
                    <td>
                        <button class="delete-btn" onclick="deleteDriver(${driver.driver_id})">Delete</button>
                    </td>
                </tr>
            `);
            updateTable("Drivers with Salary", headers, rows);
        })
        .catch(error => console.error("Error fetching drivers:", error));
}

// Function to update the table dynamically
function updateTable(title, headers, rows) {
    document.getElementById("section-title").innerText = title;
    document.getElementById("table-header").innerHTML = headers.map(h => `<th>${h}</th>`).join("");
    document.getElementById("table-body").innerHTML = rows.join("");
}

// Delete functions
function deletePlan(planId) {
    if (confirm("Are you sure you want to delete this plan?")) {
        fetch(`http://localhost:5000/deletePlan/${planId}`, { method: "DELETE" })
            .then(() => {
                alert("Plan deleted successfully!");
                showPopularDeals();
            })
            .catch(error => console.error("Error deleting plan:", error));
    }
}

function deleteReview(reviewId) {
    if (confirm("Are you sure you want to delete this review?")) {
        fetch(`http://localhost:5000/deleteReview/${reviewId}`, { method: "DELETE" })
            .then(() => {
                alert("Review deleted successfully!");
                showReviews();
            })
            .catch(error => console.error("Error deleting review:", error));
    }
}

function deleteDriver(driverId) {
    if (confirm("Are you sure you want to delete this driver?")) {
        fetch(`http://localhost:5000/deleteDriver/${driverId}`, { method: "DELETE" })
            .then(() => {
                alert("Driver deleted successfully!");
                showDriversWithSalary();
            })
            .catch(error => console.error("Error deleting driver:", error));
    }
}

// Fetch and display Bookings
function showBookings() {
    fetch("http://localhost:5000/getBookings")
        .then(response => response.json())
        .then(data => {
            let headers = ["Booking ID", "User ID", "Vehicle ID", "Driver ID", "Plan ID", "Start Date", "End Date", "Total Price", "Status", "Actions"];
            let rows = data.map(booking => `
                <tr>
                    <td>${booking.booking_id}</td>
                    <td>${booking.user_id}</td>
                    <td>${booking.vehicle_id}</td>
                    <td>${booking.driver_id || 'N/A'}</td>
                    <td>${booking.plan_id || 'N/A'}</td>
                    <td>${booking.start_date}</td>
                    <td>${booking.end_date || 'N/A'}</td>
                    <td>${booking.total_price}</td>
                    <td>${booking.status}</td>
                    <td>
                        <button class="delete-btn" onclick="deleteBooking(${booking.booking_id})">Delete</button>
                    </td>
                </tr>
            `);
            updateTable("Bookings", headers, rows);
        })
        .catch(error => console.error("Error fetching bookings:", error));
}

// Fetch and display Payments
function showPayments() {
    fetch("http://localhost:5000/getPayments")
        .then(response => response.json())
        .then(data => {
            let headers = ["Payment ID", "Booking ID", "Amount", "Damage Price", "Total Amount", "Method", "Status", "Actions"];
            let rows = data.map(payment => `
                <tr>
                    <td>${payment.payment_id}</td>
                    <td>${payment.booking_id}</td>
                    <td>${payment.amount}</td>
                    <td>${payment.damage_price}</td>
                    <td>${payment.total_amount}</td>
                    <td>${payment.payment_method}</td>
                    <td>${payment.payment_status}</td>
                    <td>
                        <button class="delete-btn" onclick="deletePayment(${payment.payment_id})">Delete</button>
                    </td>
                </tr>
            `);
            updateTable("Payments", headers, rows);
        })
        .catch(error => console.error("Error fetching payments:", error));
}

// Fetch and display Damage Reports
function showDamageReports() {
    fetch("http://localhost:5000/getDamageReports")
        .then(response => response.json())
        .then(data => {
            let headers = ["Report ID", "Booking ID", "Vehicle ID", "Description", "Damage Cost", "Reported At", "Actions"];
            let rows = data.map(report => `
                <tr>
                    <td>${report.report_id}</td>
                    <td>${report.booking_id}</td>
                    <td>${report.vehicle_id}</td>
                    <td>${report.damage_description}</td>
                    <td>${report.damage_cost}</td>
                    <td>${report.reported_at}</td>
                    <td>
                        <button class="delete-btn" onclick="deleteDamageReport(${report.report_id})">Delete</button>
                    </td>
                </tr>
            `);
            updateTable("Damage Reports", headers, rows);
        })
        .catch(error => console.error("Error fetching damage reports:", error));
}

// Fetch and display Rental Agreements
function showRentalAgreements() {
    fetch("http://localhost:5000/getRentalAgreements")
        .then(response => response.json())
        .then(data => {
            let headers = ["Agreement ID", "Booking ID", "User ID", "Vehicle ID", "Agreement", "Signed At", "Actions"];
            let rows = data.map(agreement => `
                <tr>
                    <td>${agreement.agreement_id}</td>
                    <td>${agreement.booking_id}</td>
                    <td>${agreement.user_id}</td>
                    <td>${agreement.vehicle_id}</td>
                    <td>${agreement.agreement_text.substring(0, 50)}...</td>
                    <td>${agreement.signed_at}</td>
                    <td>
                        <button class="delete-btn" onclick="deleteRentalAgreement(${agreement.agreement_id})">Delete</button>
                    </td>
                </tr>
            `);
            updateTable("Rental Agreements", headers, rows);
        })
        .catch(error => console.error("Error fetching rental agreements:", error));
}


// Logout Function
function logout() {
    localStorage.removeItem("user");
    window.location.href = "../sign-in and sign-up/sign_in.html";
}

// Initially load the users section on page load
document.addEventListener("DOMContentLoaded", () => {
    showUsers();
});
