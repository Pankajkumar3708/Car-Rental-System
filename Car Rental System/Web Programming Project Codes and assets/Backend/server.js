const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const path = require("path");

const app = express();
const port = process.env.PORT || 5000;  // Define the port variable

app.use(cors({
    origin: ["http://localhost:5500", "http://127.0.0.1:5500"],  // Allow both origins
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type"]
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "@pankaj1234",
    database: "car_rental_system"
});

app.use("/images_vehicles", express.static("C:/Users/pkc40/OneDrive/Desktop/CODE/Web Project/Frontend/Rental Deals/images_vehicles"));

db.connect((err) => {
    if (err) {
        console.error("❌ Database connection failed:", err);
        return;
    }
    console.log("✅ Connected to MySQL Database");
});

// Get all users
app.get("/getUsers", (req, res) => {
    const sql = "SELECT * FROM users";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching users:", err);
            res.status(500).json({ error: "Failed to retrieve users" });
        } else {
            res.json(results);
        }
    });
});

// Get all cars
app.get("/getCars", (req, res) => {
    const sql = "SELECT * FROM vehicles";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching cars:", err);
            res.status(500).json({ error: "Failed to retrieve cars" });
        } else {
            res.json(results);
        }
    });
});

// Get rented cars (where availability_status = 'rented')
app.get("/getRents", (req, res) => {
    const sql = `
        SELECT b.booking_id, u.name AS user_name, v.vehicle_name, b.start_date, b.end_date, b.status
        FROM bookings b
        JOIN users u ON b.user_id = u.user_id
        JOIN vehicles v ON b.vehicle_id = v.vehicle_id
        WHERE v.availability_status = 'rented'
    `;
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching rented cars:", err);
            res.status(500).json({ error: "Failed to retrieve rented cars" });
        } else {
            res.json(results);
        }
    });
});

// Get all drivers
app.get("/getDrivers", (req, res) => {
    const sql = "SELECT * FROM drivers";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching drivers:", err);
            res.status(500).json({ error: "Failed to retrieve drivers" });
        } else {
            res.json(results);
        }
    });
});

// Fetch Pricing Plans
app.get("/getPlans", (req, res) => {
    db.query("SELECT * FROM pricing_plans", (err, results) => {
        if (err) res.status(500).json({ error: "Failed to retrieve plans" });
        else res.json(results);
    });
});

// Fetch Reviews
app.get("/getReviews", (req, res) => {
    db.query("SELECT * FROM reviews", (err, results) => {
        if (err) res.status(500).json({ error: "Failed to retrieve reviews" });
        else res.json(results);
    });
});

// Fetch Drivers with Salary
app.get("/getDriversWithSalary", (req, res) => {
    const sql = `
        SELECT d.driver_id, d.name, d.phone, d.license_number, d.availability_status, 
               ds.salary_id, ds.monthly_salary 
        FROM drivers d 
        LEFT JOIN driver_salary ds ON d.driver_id = ds.driver_id
    `;
    db.query(sql, (err, results) => {
        if (err) res.status(500).json({ error: "Failed to retrieve drivers" });
        else res.json(results);
    });
});

// ---------------------------- DELETE ROUTES ----------------------------

// Delete a user
app.delete("/deleteUser/:user_id", (req, res) => {
    const userId = req.params.user_id;

    // Ensure that dependent records are handled before deleting
    const sql = "DELETE FROM users WHERE user_id = ?";
    db.query(sql, [userId], (err, result) => {
        if (err) {
            console.error("Error deleting user:", err);
            res.status(500).json({ error: "Failed to delete user. Check if there are related bookings." });
        } else if (result.affectedRows === 0) {
            res.status(404).json({ error: "User not found" });
        } else {
            res.json({ message: "User deleted successfully" });
        }
    });
});

// Delete a car
app.delete("/deleteCar/:vehicle_id", (req, res) => {
    const vehicleId = req.params.vehicle_id;

    // Ensure no active rentals exist for this vehicle before deleting
    const sql = "DELETE FROM vehicles WHERE vehicle_id = ?";
    db.query(sql, [vehicleId], (err, result) => {
        if (err) {
            console.error("Error deleting car:", err);
            res.status(500).json({ error: "Failed to delete car. Check if it's currently rented." });
        } else if (result.affectedRows === 0) {
            res.status(404).json({ error: "Car not found" });
        } else {
            res.json({ message: "Car deleted successfully" });
        }
    });
});

// Delete a Pricing Plan
app.delete("/deletePlan/:plan_id", (req, res) => {
    db.query("DELETE FROM pricing_plans WHERE plan_id = ?", [req.params.plan_id], (err) => {
        if (err) res.status(500).json({ error: "Failed to delete plan" });
        else res.json({ message: "Plan deleted successfully" });
    });
});

// Delete a Review
app.delete("/deleteReview/:review_id", (req, res) => {
    db.query("DELETE FROM reviews WHERE review_id = ?", [req.params.review_id], (err) => {
        if (err) res.status(500).json({ error: "Failed to delete review" });
        else res.json({ message: "Review deleted successfully" });
    });
});

// Delete a Driver
app.delete("/deleteDriver/:driver_id", (req, res) => {
    db.query("DELETE FROM drivers WHERE driver_id = ?", [req.params.driver_id], (err) => {
        if (err) res.status(500).json({ error: "Failed to delete driver" });
        else res.json({ message: "Driver deleted successfully" });
    });
});

// ---------------------------- POST ROUTES ----------------------------

// Add a new car
app.post("/addCar", (req, res) => {
    const {
        vehicle_name,
        vehicle_type,
        price_per_day,
        image,
        rating,
        reviews,
        passengers,
        transmission,
        doors
    } = req.body;

    if (!vehicle_name || !vehicle_type || !price_per_day || !passengers || !transmission || !doors) {
        return res.status(400).json({ error: "Missing required fields" });
    }

    const sql = `INSERT INTO vehicles (vehicle_name, vehicle_type, price_per_day, image, rating, reviews, passengers, transmission, doors)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;

    db.query(sql, [vehicle_name, vehicle_type, price_per_day, image, rating, reviews, passengers, transmission, doors],
        (err, result) => {
            if (err) {
                console.error("Error adding car:", err);
                res.status(500).json({ error: "Failed to add car" });
            } else {
                res.json({ message: "Car added successfully", vehicle_id: result.insertId });
            }
        });
});

// ---------------------------- UPDATE ROUTES ----------------------------

// Update vehicle availability status
app.put("/updateCarStatus/:vehicle_id", (req, res) => {
    const { vehicle_id } = req.params;
    const { availability_status } = req.body;

    if (!availability_status) {
        return res.status(400).json({ error: "Missing availability status" });
    }

    const sql = "UPDATE vehicles SET availability_status = ? WHERE vehicle_id = ?";
    db.query(sql, [availability_status, vehicle_id], (err, result) => {
        if (err) {
            console.error("Error updating car status:", err);
            res.status(500).json({ error: "Failed to update car status" });
        } else if (result.affectedRows === 0) {
            res.status(404).json({ error: "Car not found" });
        } else {
            res.json({ message: "Car status updated successfully" });
        }
    });
});


// Fetch data
app.get("/getBookings", (req, res) => db.query("SELECT * FROM bookings", (err, results) => res.json(results)));
app.get("/getPayments", (req, res) => db.query("SELECT * FROM payments", (err, results) => res.json(results)));
app.get("/getDamageReports", (req, res) => db.query("SELECT * FROM damage_reports", (err, results) => res.json(results)));
app.get("/getRentalAgreements", (req, res) => db.query("SELECT * FROM rental_agreements", (err, results) => res.json(results)));

// Delete data
app.delete("/deleteBooking/:booking_id", (req, res) => db.query("DELETE FROM bookings WHERE booking_id = ?", [req.params.booking_id], (err) => res.json({ message: "Booking deleted" })));
app.delete("/deletePayment/:payment_id", (req, res) => db.query("DELETE FROM payments WHERE payment_id = ?", [req.params.payment_id], (err) => res.json({ message: "Payment deleted" })));
app.delete("/deleteDamageReport/:report_id", (req, res) => db.query("DELETE FROM damage_reports WHERE report_id = ?", [req.params.report_id], (err) => res.json({ message: "Report deleted" })));
app.delete("/deleteRentalAgreement/:agreement_id", (req, res) => db.query("DELETE FROM rental_agreements WHERE agreement_id = ?", [req.params.agreement_id], (err) => res.json({ message: "Agreement deleted" })));

// ✅ API to get vehicle data
app.get("/vehicles", (req, res) => {
    db.query("SELECT * FROM vehicles", (err, results) => {
        if (err) {
            console.error("Error fetching vehicle data:", err);
            return res.status(500).json({ error: "Database query failed" });
        }

        // ✅ Ensure correct image paths before sending response
        results.forEach(vehicle => {
            vehicle.image = `http://localhost:${port}/images_vehicles/${path.basename(vehicle.image)}`;
        });

        res.json(results);
    });
});

// API to fetch drivers with their salary and cost per day
app.get('/api/drivers', (req, res) => {
    let sql = `
        SELECT d.driver_id, d.name, d.availability_status, d.license_number, 
               COALESCE(ds.monthly_salary, 0) AS monthly_salary 
        FROM drivers d 
        LEFT JOIN driver_salary ds ON d.driver_id = ds.driver_id
    `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error('❌ Error fetching driver data:', err);
            res.status(500).json({ error: 'Database error' });
        } else {
            res.json(results);
        }
    });
});

// API route to get pricing plans
app.get('/api/pricing-plans', (req, res) => {
    let sql = "SELECT plan_id, plan_name, vehicle_type, price_per_hour, price_per_day FROM pricing_plans";
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching pricing plans:', err);
            return res.status(500).json({ error: 'Database error' });
        }
        res.json(results);
    });
});

// **Get Reviews with Pagination & Sorting**
app.get("/getReviews", (req, res) => {
    let { page = 1, limit = 5, sort = "latest" } = req.query;
    page = parseInt(page);
    limit = parseInt(limit);
    let order = sort === "latest" ? "DESC" : "ASC";

    const sql = `
        SELECT r.review_id, u.name AS user_name, v.vehicle_name, r.rating, r.review_text, r.created_at
        FROM reviews r
        JOIN users u ON r.user_id = u.user_id
        JOIN vehicles v ON r.vehicle_id = v.vehicle_id
        ORDER BY r.created_at ${order}
        LIMIT ? OFFSET ?
    `;
    db.query(sql, [limit, (page - 1) * limit], (err, results) => {
        if (err) {
            console.error("Error fetching reviews:", err);
            res.status(500).json({ error: "Failed to retrieve reviews" });
        } else {
            res.json(results);
        }
    });
});

// **Submit a Review**
app.post("/addReview", (req, res) => {
    const { user_id, vehicle_id, rating, review_text } = req.body;

    if (!user_id || !vehicle_id || !rating || !review_text) {
        return res.status(400).json({ error: "All fields are required" });
    }

    const sql = `INSERT INTO reviews (user_id, vehicle_id, rating, review_text) VALUES (?, ?, ?, ?)`;

    db.query(sql, [user_id, vehicle_id, rating, review_text], (err, result) => {
        if (err) {
            console.error("Error adding review:", err);
            res.status(500).json({ error: "Failed to add review" });
        } else {
            res.json({ message: "Review added successfully" });
        }
    });
});

// ✅ User Sign-in API
app.post("/signin", (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ error: "Email and password are required" });
    }

    const query = "SELECT * FROM users WHERE email = ?";
    db.query(query, [email], (err, results) => {
        if (err) {
            console.error("Sign-in error:", err);
            return res.status(500).json({ error: "Something went wrong, please try again" });
        }

        if (results.length === 0) {
            return res.status(401).json({ error: "User not found" });
        }

        const user = results[0];

        // ✅ Check Password (No Hashing)
        if (user.password !== password) {
            return res.status(401).json({ error: "Incorrect password" });
        }

        // ✅ Check if the user is Admin
        const isAdmin = email.endsWith("@rentcars.in");

        res.status(200).json({
            message: "Login successful",
            user: {
                name: user.name,
                email: user.email,
                role: isAdmin ? "admin" : "customer"
            }
        });
    });
});

// ✅ User Signup API
app.post("/signup", (req, res) => {
    const { name, password, email, phone, license_no, dob, address } = req.body;

    if (!name || !password || !email || !phone || !license_no || !dob || !address) {
        return res.status(400).json({ error: "All fields are required" });
    }

    // ✅ Convert DOB to YYYY-MM-DD format
    const formattedDob = new Date(dob).toISOString().split("T")[0];

    const query = "INSERT INTO users (name, email, password, phone, license_no, dob, address, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    db.query(query, [name, email, password, phone, license_no, formattedDob, address, "customer"], (err, result) => {
        if (err) {
            console.error("Signup failed:", err);
            return res.status(500).json({ error: "Database error" });
        }
        res.status(201).json({ message: "Signup successful!" });
    });
});

app.listen(port, () => {
    console.log(`🚀 Server running on http://localhost:${port}`);
});