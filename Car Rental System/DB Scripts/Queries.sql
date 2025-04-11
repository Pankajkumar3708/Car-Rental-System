use car_rental_system;

select * from users;

select * from vehicles where availability_status='rented';

SELECT vehicle_name, vehicle_type, price_per_day
FROM vehicles
WHERE availability_status = 'available';

SELECT b.booking_id, u.name, v.vehicle_name, b.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
WHERE b.status = 'completed';

SELECT v.vehicle_name, COUNT(b.booking_id) AS total_bookings
FROM vehicles v
JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_name;

SELECT vehicle_name, rating
FROM vehicles
ORDER BY rating DESC;

SELECT vehicle_type, AVG(price_per_day) AS avg_price
FROM vehicles
GROUP BY vehicle_type;

SELECT SUM(total_amount) AS total_earnings
FROM payments
WHERE payment_status = 'completed';

SELECT name, phone
FROM drivers
WHERE availability_status = 'available';

SELECT DISTINCT u.name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE b.driver_id IS NOT NULL;

SELECT vehicle_name, price_per_day
FROM vehicles
WHERE price_per_day > (SELECT AVG(price_per_day) FROM vehicles);

SELECT booking_id, start_date, end_date
FROM bookings
WHERE start_date >= NOW() - INTERVAL 7 DAY;

SELECT u.name, COUNT(b.booking_id) AS total_bookings
FROM users u
JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.name;

SELECT vehicle_name, reviews
FROM vehicles
ORDER BY reviews DESC
LIMIT 3;

SELECT d.name, ds.monthly_salary
FROM drivers d
JOIN driver_salary ds ON d.driver_id = ds.driver_id
WHERE ds.monthly_salary > 20000;

SELECT payment_id, booking_id, total_amount
FROM payments
WHERE payment_status = 'pending';

SELECT damage_description, damage_cost
FROM damage_reports
WHERE damage_cost > 0;

SELECT v.vehicle_name, pp.plan_name
FROM bookings b
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
JOIN pricing_plans pp ON b.plan_id = pp.plan_id;

SELECT vehicle_type, COUNT(*) AS total
FROM vehicles
GROUP BY vehicle_type;

select * from admins;