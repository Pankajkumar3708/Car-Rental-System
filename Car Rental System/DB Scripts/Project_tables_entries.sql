use car_rental_system;

select * from users;

INSERT INTO vehicles (vehicle_name, vehicle_type, price_per_day, image, rating, reviews, passengers, transmission, doors, availability_status) 
VALUES 
('Alto', 'car', 2000.00, 'images_vehicles/alto-car.webp', 4.8, 2436, 4, 'Manual', 4, 'available'),
('Swift', 'car', 1500.00, 'images_vehicles/swift-car.webp', 4.6, 1936, 4, 'Manual', 4, 'available'),
('Mahindra Scorpio', 'car', 2500.00, 'images_vehicles/scorpio-car.webp', 4.5, 2036, 6, 'Manual', 5, 'available'),
('Honda City', 'car', 2000.00, 'images_vehicles/honda-city.webp', 4.3, 2236, 4, 'Manual', 4, 'available'),
('Toyota Fortuner', 'car', 3500.00, 'images_vehicles/fortuner-car.webp', 4.7, 2150, 7, 'Manual', 5, 'available'),
('Mahindra Thar', 'car', 2500.00, 'images_vehicles/thar-car.webp', 4.4, 1900, 4, 'Manual', 3, 'available'),
('Mahindra XUV 700', 'car', 3200.00, 'images_vehicles/xuv-700.webp', 4.8, 2300, 7, 'Manual', 5, 'available'),
('Kia Seltos', 'car', 2300.00, 'images_vehicles/kia-seltos.png', 4.5, 1700, 5, 'Manual', 4, 'available');

update vehicles set price_per_day = 4000 where vehicle_name = 'Mahindra Thar';
update vehicles set price_per_day = 4200 where vehicle_name = 'Mahindra XUV 700';
update vehicles set price_per_day = 3500 where vehicle_name = 'Kia Seltos';
update vehicles set price_per_day = 3600 where vehicle_name = 'Mahindra Scorpio';

INSERT INTO vehicles (vehicle_name, vehicle_type, price_per_day, image, rating, reviews, passengers, transmission, doors, availability_status) 
VALUES
('Creta', 'car', 3000.00, 'images_vehicles/creta-car.webp', 4.8, 2436, 4, 'Manual', 4, 'rented');

INSERT INTO vehicles (vehicle_name, vehicle_type, price_per_day, image, rating, reviews, passengers, transmission, doors, availability_status) 
VALUES 
('Baleno', 'car', 3000.00, 'images_vehicles/baleno-car.jpeg', 4.1, 1436, 4, 'Manual', 4, 'rented'),
('i20', 'car', 2500.00, 'images_vehicles/i20-car.jpeg', 4.9, 436, 4, 'Manual', 4, 'rented'),
('Innova', 'car', 4000.00, 'images_vehicles/innova-car.jpeg', 4.0, 236, 4, 'Manual', 6, 'rented'),
('Verna', 'car', 3000.00, 'images_vehicles/verna-car.jpeg', 3.8, 243, 4, 'Manual', 4, 'rented');

select * from vehicles;

select * from vehicles where availability_status='rented';
select * from users;
select * from bookings;
select email,phone from users where password='ashu1234';

ALTER TABLE users AUTO_INCREMENT = 33;

DELETE FROM users WHERE user_id BETWEEN 303 AND 332;


INSERT INTO users (name, phone, email, password, license_no, dob, address, role) VALUES
('Amit Sharma', '9876543210', 'amit.sharma@gmail.com', 'Amit1234', 'DL1234567890', '1995-05-14', 'Delhi, India', 'customer'),
('Rohan Verma', '9876543211', 'rohan.verma@gmail.com', 'Rohan1234', 'DL1234567891', '1993-06-20', 'Mumbai, India', 'customer'),
('Sneha Gupta', '9876543212', 'sneha.gupta@gmail.com', 'Sneha1234', 'DL1234567892', '1997-07-25', 'Bangalore, India', 'customer'),
('Vikas Yadav', '9876543213', 'vikas.yadav@gmail.com', 'Vikas1234', 'DL1234567893', '1992-08-30', 'Kolkata, India', 'customer'),
('Pooja Mehta', '9876543214', 'pooja.mehta@gmail.com', 'Pooja1234', 'DL1234567894', '1996-09-10', 'Chennai, India', 'customer'),
('Rahul Singh', '9876543215', 'rahul.singh@gmail.com', 'Rahul1234', 'DL1234567895', '1994-10-12', 'Pune, India', 'customer'),
('Anjali Nair', '9876543216', 'anjali.nair@gmail.com', 'Anjali1234', 'DL1234567896', '1998-11-15', 'Hyderabad, India', 'customer'),
('Suresh Kumar', '9876543217', 'suresh.kumar@gmail.com', 'Suresh1234', 'DL1234567897', '1990-12-20', 'Ahmedabad, India', 'customer'),
('Kavita Joshi', '9876543218', 'kavita.joshi@gmail.com', 'Kavita1234', 'DL1234567898', '1999-01-05', 'Jaipur, India', 'customer'),
('Deepak Malhotra', '9876543219', 'deepak.malhotra@gmail.com', 'Deepak1234', 'DL1234567899', '1991-02-18', 'Lucknow, India', 'customer'),
('Manish Kapoor', '9876543220', 'manish.kapoor@gmail.com', 'Manish1234', 'DL1234567800', '1995-03-22', 'Indore, India', 'customer'),
('Swati Bansal', '9876543221', 'swati.bansal@gmail.com', 'Swati1234', 'DL1234567801', '1993-04-28', 'Chandigarh, India', 'customer'),
('Neha Tandon', '9876543222', 'neha.tandon@gmail.com', 'Neha1234', 'DL1234567802', '1997-05-30', 'Bhopal, India', 'customer'),
('Arjun Khanna', '9876543223', 'arjun.khanna@gmail.com', 'Arjun1234', 'DL1234567803', '1992-06-10', 'Goa, India', 'customer'),
('Ritika Saxena', '9876543224', 'ritika.saxena@gmail.com', 'Ritika1234', 'DL1234567804', '1996-07-19', 'Nagpur, India', 'customer'),
('Aditya Roy', '9876543225', 'aditya.roy@gmail.com', 'Aditya1234', 'DL1234567805', '1994-08-21', 'Dehradun, India', 'customer'),
('Meenal Sharma', '9876543226', 'meenal.sharma@gmail.com', 'Meenal1234', 'DL1234567806', '1998-09-23', 'Mysore, India', 'customer'),
('Karan Patel', '9876543227', 'karan.patel@gmail.com', 'Karan1234', 'DL1234567807', '1991-10-27', 'Surat, India', 'customer'),
('Simran Kaur', '9876543228', 'simran.kaur@gmail.com', 'Simran1234', 'DL1234567808', '1993-11-29', 'Amritsar, India', 'customer'),
('Nitin Saxena', '9876543229', 'nitin.saxena@gmail.com', 'Nitin1234', 'DL1234567809', '1997-12-31', 'Kanpur, India', 'customer'),

('Rajesh Malhotra', '9876543230', 'rajesh.malhotra@rentcars.in', 'Rajesh1234', 'DL1234567810', '1990-01-01', 'Panchkula, Haryana, India', 'admin'),
('Preeti Sinha', '9876543231', 'preeti.sinha@rentcars.in', 'Preeti1234', 'DL1234567811', '1995-02-02', 'Mohali, Punjab, India', 'admin'),
('Ankur Chawla', '9876543232', 'ankur.chawla@rentcars.in', 'Ankur1234', 'DL1234567812', '1992-03-03', 'Chandigarh, India', 'admin'),
('Divya Reddy', '9876543233', 'divya.reddy@rentcars.in', 'Divya1234', 'DL1234567813', '1998-04-04', 'Delhi, India', 'admin'),
('Vivek Aggarwal', '9876543234', 'vivek.aggarwal@rentcars.in', 'Vivek1234', 'DL1234567814', '1993-05-05', 'Panchkula, Haryana, India', 'admin'),
('Tanya Kapoor', '9876543235', 'tanya.kapoor@rentcars.in', 'Tanya1234', 'DL1234567815', '1996-06-06', 'Mohali, Punjab, India', 'admin'),
('Aakash Jain', '9876543236', 'aakash.jain@rentcars.in', 'Aakash1234', 'DL1234567816', '1991-07-07', 'Chandigarh, India', 'admin'),
('Geeta Nair', '9876543237', 'geeta.nair@rentcars.in', 'Geeta1234', 'DL1234567817', '1994-08-08', 'Delhi, India', 'admin'),
('Rohit Bansal', '9876543238', 'rohit.bansal@rentcars.in', 'Rohit1234', 'DL1234567818', '1997-09-09', 'Panchkula, Haryana, India', 'admin'),
('Shweta Das', '9876543239', 'shweta.das@rentcars.in', 'Shweta1234', 'DL1234567819', '1995-10-10', 'Mohali, Punjab, India', 'admin');

INSERT INTO users (name, phone, email, password, license_no, dob, address, role) VALUES
('Ankit', '9876543201', 'ankit01@gmail.com', 'Ankit1234', 'DL-10-12345', '1998-02-15', 'New Delhi', 'customer'),
('Rajat', '9876543202', 'rajat02@gmail.com', 'Rajat1234', 'PB-20-67890', '1997-05-10', 'Ludhiana, Punjab', 'customer'),
('Vikas', '9876543203', 'vikas03@gmail.com', 'Vikas1234', 'CH-30-54321', '1996-07-08', 'Chandigarh', 'customer'),
('Simran', '9876543204', 'simran04@gmail.com', 'Simran1234', 'HR-40-98765', '1999-01-25', 'Panchkula, Haryana', 'customer'),
('Neha', '9876543205', 'neha05@gmail.com', 'Neha1234', 'UP-50-13579', '2000-11-20', 'Lucknow, Uttar Pradesh', 'customer'),
('Rohit', '9876543206', 'rohit06@gmail.com', 'Rohit1234', 'MP-60-24680', '1995-09-12', 'Bhopal, Madhya Pradesh', 'customer'),
('Priya', '9876543207', 'priya07@gmail.com', 'Priya1234', 'GJ-70-98765', '1998-03-30', 'Ahmedabad, Gujarat', 'customer'),
('Aman', '9876543208', 'aman08@gmail.com', 'Aman1234', 'RJ-80-12345', '1997-08-19', 'Jaipur, Rajasthan', 'customer'),
('Pooja', '9876543209', 'pooja09@gmail.com', 'Pooja1234', 'TN-90-54321', '1996-06-07', 'Chennai, Tamil Nadu', 'customer'),
('Kunal', '9876543019', 'kunal10@gmail.com', 'Kunal1234', 'MH-100-67890', '1995-12-25', 'Mumbai, Maharashtra', 'customer'),
('Sneha', '9876543011', 'sneha11@gmail.com', 'Sneha1234', 'KL-110-98765', '1998-07-14', 'Kochi, Kerala', 'customer'),
('Manish', '9876543012', 'manish12@gmail.com', 'Manish1234', 'WB-120-54321', '1999-04-22', 'Kolkata, West Bengal', 'customer'),
('Deepika', '9876540213', 'deepika13@gmail.com', 'Deepika1234', 'AP-130-67890', '2001-02-18', 'Vijayawada, Andhra Pradesh', 'customer'),
('Arjun', '9876543014', 'arjun14@gmail.com', 'Arjun1234', 'TS-140-13579', '1997-10-05', 'Hyderabad, Telangana', 'customer'),
('Divya', '9876043215', 'divya15@gmail.com', 'Divya1234', 'JK-150-24680', '1996-09-11', 'Jammu, Jammu & Kashmir', 'customer'),
('Suresh', '9876540216', 'suresh16@gmail.com', 'Suresh1234', 'BR-160-98765', '1995-05-27', 'Patna, Bihar', 'customer'),
('Kiran', '9876043217', 'kiran17@gmail.com', 'Kiran1234', 'OR-170-54321', '1998-12-01', 'Bhubaneswar, Odisha', 'customer'),
('Rahul', '987043218', 'rahul18@gmail.com', 'Rahul1234', 'AS-180-67890', '1997-07-09', 'Guwahati, Assam', 'customer'),
('Tanya', '9870543219', 'tanya19@gmail.com', 'Tanya1234', 'HP-190-13579', '1999-06-16', 'Shimla, Himachal Pradesh', 'customer'),
('Yash', '9876503229', 'yash20@gmail.com', 'Yash1234', 'CG-200-24680', '1996-03-05', 'Raipur, Chhattisgarh', 'customer'),
('Isha', '8876543228', 'isha21@gmail.com', 'Isha1234', 'UK-210-98765', '2000-08-29', 'Dehradun, Uttarakhand', 'customer'),
('Rajeev', '8870543222', 'rajeev22@gmail.com', 'Rajeev1234', 'MN-220-54321', '1998-11-10', 'Imphal, Manipur', 'customer'),
('Sonakshi', '9806543223', 'sonakshi23@gmail.com', 'Sakshi1234', 'TR-230-67890', '1995-04-23', 'Agartala, Tripura', 'customer'),
('Harsh', '8806543224', 'harsh24@gmail.com', 'Harsh1234', 'ML-240-13579', '1997-09-14', 'Shillong, Meghalaya', 'customer'),
('Megha', '8076543225', 'megha25@gmail.com', 'Megha1234', 'MZ-250-24680', '1999-05-31', 'Aizawl, Mizoram', 'customer'),
('Nitin', '8876543226', 'nitin26@gmail.com', 'Nitin1234', 'NL-260-98765', '1996-07-18', 'Kohima, Nagaland', 'customer'),
('Swati', '8876543227', 'swati27@gmail.com', 'Swati1234', 'SK-270-54321', '2001-01-22', 'Gangtok, Sikkim', 'customer'),
('Varun', '8876543220', 'varun28@gmail.com', 'Varun1234', 'AR-280-67890', '1998-12-09', 'Itanagar, Arunachal Pradesh', 'customer'),
('Pankaj', '8876543229', 'pankaj29@gmail.com', 'Pankaj1234', 'GA-290-13579', '1997-06-03', 'Panaji, Goa', 'customer'),
('Reema', '8876543230', 'reema30@gmail.com', 'Reema1234', 'PY-300-24680', '1995-11-26', 'Puducherry', 'customer');


INSERT INTO admins (user_id, access_level)
SELECT user_id, 
       CASE 
           WHEN email = 'rajesh.malhotra@rentcars.in' THEN 'super_admin' 
           WHEN email = 'preeti.sinha@rentcars.in' THEN 'manager' 
           ELSE 'staff' 
       END
FROM users
WHERE role = 'admin';

select * from admins;

INSERT INTO drivers (name, phone, license_number, availability_status) VALUES
('Ramesh Yadav', '9876512340', 'DL2023010001', 'on_trip'),
('Sohan Kumar', '9876512341', 'DL2023010002', 'unavailable'),
('Amit Verma', '9876512342', 'DL2023010003', 'unavailable'),
('Manoj Sharma', '9876512343', 'DL2023010004', 'unavailable'),
('Rahul Gupta', '9876512344', 'DL2023010005', 'available'),
('Vikram Singh', '9876512345', 'DL2023010006', 'available'),
('Pankaj Tiwari', '9876512346', 'DL2023010007', 'available'),
('Anil Chauhan', '9876512347', 'DL2023010008', 'available'),
('Ravi Mehta', '9876512348', 'DL2023010009', 'available'),
('Sunil Joshi', '9876512349', 'DL2023010010', 'available');
select * from drivers;

INSERT INTO driver_salary (driver_id, monthly_salary)
SELECT driver_id, 
       FLOOR(RAND() * (21)) * 1000 + 30000
FROM drivers;
select * from driver_salary;

INSERT INTO pricing_plans (plan_name, vehicle_type, price_per_hour, price_per_day)
VALUES 
    ('Economy', 'car', 150.00, 1500.00),
    ('Standard', 'car', 200.00, 2000.00),
    ('Premium', 'car', 300.00, 3000.00),
    ('Business', 'car', 350.00, 3500.00),
    ('Luxury', 'car', 500.00, 5000.00),
    ('SUV Basic', 'car', 400.00, 4000.00),
    ('SUV Premium', 'car', 600.00, 6000.00),
    ('Family Comfort', 'car', 450.00, 4500.00),
    ('Sports Edition', 'car', 700.00, 7000.00),
    ('Ultra Luxury', 'car', 1000.00, 10000.00);
    
select * from pricing_plans;

INSERT INTO bookings (user_id, vehicle_id, driver_id, plan_id, start_date, end_date, total_price, status) VALUES
    (5, 1, 2, 3, '2025-03-02 10:00:00', '2025-03-07 12:00:00', 10000.00, 'confirmed'),
    (8, 3, 1, 5, '2025-03-05 09:30:00', '2025-03-10 11:45:00', 12500.00, 'completed'),
    (12, 4, 7, 2, '2025-03-10 14:15:00', '2025-03-14 16:30:00', 8000.00, 'pending'),
    (15, 5, 3, 8, '2025-03-12 08:00:00', '2025-03-19 10:00:00', 31500.00, 'confirmed'),
    (19, 2, 6, 6, '2025-03-06 11:00:00', '2025-03-11 13:30:00', 20000.00, 'cancelled'),
    (21, 7, 4, 1, '2025-03-03 07:00:00', '2025-03-08 09:45:00', 7500.00, 'completed'),
    (22, 8, 5, 10, '2025-03-15 12:30:00', '2025-03-20 15:00:00', 50000.00, 'confirmed'),
    (25, 6, 9, 4, '2025-03-18 10:00:00', '2025-03-25 13:15:00', 28000.00, 'pending'),
    (30, 3, 10, 7, '2025-03-07 06:45:00', '2025-03-12 09:00:00', 30000.00, 'completed'),
    (31, 1, 8, 9, '2025-03-05 14:30:00', '2025-03-10 16:45:00', 35000.00, 'cancelled'),

    (10, 4, 2, 3, '2025-03-01 09:00:00', '2025-03-06 12:00:00', 10000.00, 'confirmed'),
    (11, 5, 6, 5, '2025-03-09 10:30:00', '2025-03-14 14:45:00', 12500.00, 'completed'),
    (16, 6, 7, 2, '2025-03-14 13:15:00', '2025-03-19 15:30:00', 8000.00, 'pending'),
    (18, 7, 3, 8, '2025-03-11 07:00:00', '2025-03-16 09:00:00', 31500.00, 'confirmed'),
    (23, 8, 9, 6, '2025-03-08 08:30:00', '2025-03-13 10:45:00', 20000.00, 'cancelled'),
    (24, 2, 10, 1, '2025-03-17 10:15:00', '2025-03-22 12:30:00', 7500.00, 'completed'),
    (27, 3, 1, 10, '2025-03-04 12:45:00', '2025-03-09 15:00:00', 50000.00, 'confirmed'),
    (29, 5, 5, 4, '2025-03-13 11:00:00', '2025-03-20 14:15:00', 28000.00, 'pending'),
    (33, 7, 8, 7, '2025-03-16 07:30:00', '2025-03-21 09:45:00', 30000.00, 'completed'),
    (35, 1, 4, 9, '2025-03-19 15:30:00', '2025-03-24 17:45:00', 35000.00, 'cancelled'),

    (36, 3, 7, 5, '2025-03-10 12:15:00', '2025-03-15 14:30:00', 12500.00, 'confirmed'),
    (38, 6, 2, 3, '2025-03-07 09:45:00', '2025-03-12 11:15:00', 10000.00, 'pending'),
    (40, 8, 5, 7, '2025-03-12 08:00:00', '2025-03-17 10:30:00', 30000.00, 'completed'),
    (41, 2, 10, 1, '2025-03-04 10:00:00', '2025-03-09 13:00:00', 7500.00, 'cancelled'),
    (43, 5, 9, 6, '2025-03-14 07:30:00', '2025-03-19 10:00:00', 20000.00, 'confirmed'),
    (45, 1, 6, 9, '2025-03-17 14:30:00', '2025-03-22 17:00:00', 35000.00, 'pending'),
    (46, 7, 3, 4, '2025-03-05 11:00:00', '2025-03-10 13:30:00', 28000.00, 'completed'),
    (48, 4, 8, 10, '2025-03-02 09:45:00', '2025-03-07 11:15:00', 50000.00, 'cancelled'),
    (49, 6, 1, 8, '2025-03-11 07:30:00', '2025-03-16 10:00:00', 31500.00, 'confirmed'),
    (50, 8, 3, 5, '2025-03-10 09:30:00', '2025-03-15 12:00:00', 12500.00, 'completed');
select * from bookings;

SELECT status, COUNT(*) AS total_count
FROM bookings
WHERE status IN ('confirmed', 'completed')
GROUP BY status;

ALTER TABLE bookings AUTO_INCREMENT = 1;
delete from bookings where booking_id between 61 and 90;

INSERT INTO booking_driver (booking_id, driver_id, driver_cost) VALUES
(1, 2, 1500.00),
(2, 5, 1800.00),
(3, 8, 1200.00),
(4, 10, 1700.00),
(5, 3, 1600.00),
(6, 7, 1400.00),
(7, 6, 2000.00),
(8, 4, 1300.00),
(9, 1, 1900.00),
(10, 9, 1100.00),
(11, 2, 1800.00),
(12, 4, 1000.00),
(13, 6, 1500.00),
(14, 8, 1750.00),
(15, 10, 1950.00),
(16, 1, 1400.00),
(17, 3, 1250.00),
(18, 5, 1350.00),
(19, 7, 1550.00),
(20, 9, 1450.00);
select * from booking_driver;

INSERT INTO payments (booking_id, amount, damage_price, total_amount, payment_method, payment_status) VALUES
(1, 10000.00, 0, 11500.00, 'credit_card', 'completed'),
(2, 12500.00, 500.00, 14800.00, 'upi', 'completed'),
(4, 31500.00, 0, 33200.00, 'debit_card', 'completed'),
(6, 7500.00, 300.00, 9200.00, 'wallet', 'pending'),
(7, 50000.00, 0, 52000.00, 'upi', 'completed'),
(9, 30000.00, 1000.00, 32900.00, 'credit_card', 'completed'),
(11, 10000.00, 200.00, 12000.00, 'debit_card', 'pending'),
(12, 12500.00, 500.00, 15000.00, 'wallet', 'completed'),
(14, 31500.00, 1000.00, 34250.00, 'upi', 'completed'),
(16, 20000.00, 0, 20000.00, 'credit_card', 'failed'),
(18, 7500.00, 150.00, 9150.00, 'debit_card', 'completed'),
(19, 50000.00, 2000.00, 54500.00, 'wallet', 'completed'),
(21, 28000.00, 0, 28000.00, 'upi', 'pending'),
(23, 30000.00, 500.00, 31950.00, 'credit_card', 'completed'),
(25, 35000.00, 0, 36400.00, 'debit_card', 'completed'),
(27, 10000.00, 250.00, 11750.00, 'wallet', 'pending'),
(29, 31500.00, 0, 33000.00, 'upi', 'completed'),
(30, 12500.00, 300.00, 14600.00, 'credit_card', 'completed');

select* from payments;

INSERT INTO reviews (user_id, vehicle_id, rating, review_text) VALUES
(5, 2, 5, 'Amazing experience! The car was clean and well-maintained.\nSmooth ride, would definitely rent again.'),
(12, 4, 4, 'Good service overall, but the car had a minor scratch.\nStill, the performance was excellent.'),
(18, 1, 5, 'Fantastic rental! Booking was easy, and the car was in great condition.\nHighly recommended.'),
(22, 6, 3, 'Decent experience, but the AC was not working properly.\nCould have been better.'),
(31, 3, 5, 'Loved the experience! The car was spotless and drove perfectly.\nWill book again.'),
(9, 5, 2, 'The car was okay but had some engine noise.\nExpected better maintenance.'),
(14, 7, 4, 'Very good service, and the car was in great shape.\nJust wish the fuel tank was full at pickup.'),
(27, 9, 3, 'Okay experience, but the brakes were a bit rough.\nNot bad for the price.'),
(39, 2, 5, 'Perfect rental experience! Smooth ride and great customer service.\nWould highly recommend this service.'),
(45, 8, 4, 'Good car, but pickup took longer than expected.\nOtherwise, no complaints.'),
(11, 1, 5, 'Best rental experience so far! The car felt brand new.\nCustomer support was helpful too.'),
(19, 4, 3, 'Car was decent, but the tires seemed a little worn out.\nHope they improve maintenance.'),
(33, 6, 4, 'Nice experience, friendly staff, and a clean car.\nWould consider renting again.'),
(41, 3, 2, 'The car was not fully cleaned at pickup.\nDrives well, but cleanliness is a concern.'),
(50, 5, 4, 'Very satisfied! Smooth booking and excellent vehicle condition.\nGreat value for money.'),
(8, 7, 5, 'Fantastic experience! Loved driving this car.\nThe return process was seamless.'),
(16, 9, 3, 'Average experience, as the car had some minor dents.\nCould use better maintenance.'),
(26, 2, 4, 'Good service, but a slight delay in receiving the car.\nOverall, happy with the experience.'),
(37, 8, 5, 'Exceptional service! Best rental experience ever.\nHighly recommended for long drives.'),
(48, 1, 2, 'Not a great experience. The car had a weird smell inside.\nWould prefer better cleaning next time.'),
(3, 4, 5, 'Wonderful ride! The car handled beautifully.\nVery satisfied with my booking.'),
(20, 6, 3, 'Okay service, but the car was delivered 30 minutes late.\nThe vehicle condition was good though.'),
(29, 3, 4, 'Good rental car. Smooth driving and good mileage.\nA bit expensive but worth it.'),
(35, 5, 2, 'Disappointed with the cleanliness of the car.\nExpected better service.'),
(44, 7, 5, 'Amazing rental! The car was luxurious and fun to drive.\nDefinitely renting again.'),
(52, 9, 3, 'Average experience. The car worked fine, but some features were not functioning properly.\nHope they improve.'),
(60, 2, 4, 'Very well-maintained vehicle, smooth drive.\nA little pricey but worth it.'),
(6, 8, 5, 'Loved it! Best experience I’ve had with a rental service.\nQuick and easy booking.'),
(17, 1, 4, 'Good service and a comfortable car.\nWould recommend to friends.'),
(30, 4, 3, 'Car was decent, but I expected better interior maintenance.\nOverall, okay experience.'),
(7, 2, 1, 'Terrible experience! The car broke down in the middle of the trip.\nCustomer support was unhelpful.'),
(15, 5, 1, 'Worst rental ever! The car had engine issues from the start.\nHad to return it early.'),
(21, 7, 1, 'Not satisfied at all. The car smelled bad and was not clean.\nWould never rent again.'),
(32, 9, 2, 'The car was below average. The seats were uncomfortable.\nExpected better quality.'),
(40, 3, 1, 'Very bad experience! The car had major alignment issues.\nNot safe to drive at high speed.'),
(51, 6, 2, 'Not great. The brakes were not responsive enough.\nCould have been dangerous.'),
(58, 8, 1, 'The worst rental experience ever! The car stopped working twice.\nWould give zero stars if possible.'),
(24, 1, 2, 'Mediocre at best. The AC was weak and the car felt old.\nNot worth the money.'),
(10, 4, 1, 'Completely dissatisfied. The car stalled multiple times.\nHighly disappointed.'),
(36, 5, 2, 'Car was okay, but the fuel efficiency was very poor.\nHad to refuel too often.'),
(28, 7, 1, 'Pathetic service! The car had low tire pressure and nobody checked before pickup.\nHighly unprofessional.'),
(13, 9, 2, 'Not worth it. The car was outdated and had a broken mirror.\nBetter options elsewhere.'),
(43, 3, 1, 'The worst car rental I’ve used! Customer service was rude.\nWould never recommend.'),
(57, 8, 1, 'Disappointed! The car broke down on a highway.\nTook hours for help to arrive.');

select * from reviews;

INSERT INTO damage_reports (booking_id, vehicle_id, damage_description, damage_cost) VALUES
(1, 2, 'Minor scratch on the front bumper.', 150.00),
(3, 5, 'Dent on the rear left door due to a small collision.', 600.00),
(5, 3, 'Cracked windshield, needs replacement.', 2500.00),
(7, 7, 'Side mirror broken while parking.', 800.00),
(9, 1, 'Deep scratches on the hood, possibly key damage.', 1200.00),
(11, 4, 'Rear bumper slightly damaged due to a hit.', 750.00),
(13, 6, 'Flat tire and minor rim damage.', 450.00),
(15, 9, 'Front headlight broken after a minor accident.', 1300.00),
(17, 2, 'Interior damage: Torn leather seat cover.', 950.00),
(19, 8, 'Brake system issue reported by customer.', 1800.00),
(21, 5, 'Paint chipped off on multiple areas.', 400.00),
(23, 3, 'Major dent on the right side panel.', 2000.00),
(25, 6, 'Excessive scratches all over the body.', 1100.00),
(27, 7, 'Engine overheating issue reported, requires inspection.', 3000.00),
(29, 9, 'Back windshield shattered.', 2800.00);

select * from damage_reports;

INSERT INTO rental_agreements (booking_id, user_id, vehicle_id, agreement_text) VALUES
(1, 5, 2, 'This agreement outlines the terms and conditions for the rental of Vehicle ID 2. The renter agrees to return the vehicle in the same condition.'),
(2, 8, 3, 'The renter agrees to abide by all traffic laws and return the vehicle fully fueled. Any damages will be covered by the renter.'),
(3, 12, 4, 'This rental agreement states that the vehicle must be returned by the due date, and any late returns will be charged extra.'),
(4, 15, 5, 'The renter is responsible for any parking tickets incurred during the rental period. The vehicle must be kept clean.'),
(5, 19, 2, 'The rental period is for 5 days. Any unauthorized extension will result in additional charges as per company policy.'),
(6, 21, 7, 'Vehicle ID 7 is rented under the condition that no modifications or repairs will be made without approval.'),
(7, 22, 8, 'The renter acknowledges that they have inspected the vehicle before renting and found it to be in good condition.'),
(8, 25, 6, 'The agreement states that the vehicle is for personal use only and cannot be used for commercial purposes.'),
(9, 30, 3, 'If the renter returns the vehicle with any damage, the cost of repairs will be deducted from their deposit.'),
(10, 31, 1, 'The vehicle must not be driven outside the designated geographical area as mentioned in the agreement.'),
(11, 10, 4, 'The renter agrees to return the vehicle with a full tank of fuel. Any shortage will be charged at a premium rate.'),
(12, 11, 5, 'This agreement confirms that Vehicle ID 5 has been rented for 7 days and must be returned in good condition.'),
(13, 16, 6, 'The renter is responsible for all toll charges and parking fees incurred during the rental period.'),
(14, 18, 7, 'The vehicle must be returned by the specified end date. A late fee applies if returned past the deadline.'),
(15, 23, 8, 'Vehicle ID 8 is provided in excellent condition. The renter must report any damages immediately.'),
(16, 24, 2, 'Smoking inside the vehicle is strictly prohibited. Any violation will result in an additional cleaning fee.'),
(17, 27, 3, 'The renter agrees not to use the vehicle for any illegal activities. Failure to comply will lead to legal action.'),
(18, 29, 5, 'Pets are not allowed in the vehicle unless specified. Any damages from pets will be charged accordingly.'),
(19, 33, 7, 'The renter must return the vehicle to the designated rental location, failure to do so will incur a fee.'),
(20, 35, 1, 'In case of an accident, the renter must inform the rental company immediately and follow the given procedures.');

select * from rental_agreements;

insert into drivers(name, phone, license_number,availability_status) values 
('Pranshu Joshi', '7973724858', 'DL2023010011', 'available');

update drivers set availability_status = 'on_trip' where name = 'Pranshu Joshi';  

SET SQL_SAFE_UPDATES = 0;

select * from drivers;
select * from bookings;

insert into bookings(user_id, vehicle_id, driver_id, plan_id, start_date, end_date, total_price, status) values
(14, 9, 3, 7, '2025-04-05', '2025-04-13', 24000, 'confirmed'),
(13, 12, 5, 10, '2025-04-06', '2025-04-07', 4000, 'confirmed'),
(6, 10, 7, 1, '2025-04-18', '2025-04-23', 15000, 'confirmed'),
(5, 11, 7, 9, '2025-04-13', '2025-04-14', 4000, 'confirmed'),
(20, 13, 2, 8, '2025-04-04', '2025-04-09', 15000, 'confirmed');
