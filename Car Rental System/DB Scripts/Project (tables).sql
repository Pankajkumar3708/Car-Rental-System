create database car_rental_system;
use car_rental_system;

-- users table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    license_no VARCHAR(30) UNIQUE NOT NULL,
    dob DATE NOT NULL,
    address TEXT NOT NULL,
    role ENUM('customer', 'admin') NOT NULL DEFAULT 'customer'
);

-- admin table (for admin-specific details)
create table admins (
    admin_id int primary key auto_increment,
    user_id int unique,
    access_level enum('super_admin', 'manager', 'staff') default 'manager',
    foreign key (user_id) references users(user_id) on delete cascade
);

-- vehicles table
create table vehicles (
    vehicle_id int primary key auto_increment,
    vehicle_name varchar(100) not null,
    vehicle_type enum('car', 'bike') not null,
    price_per_day decimal(10,2) not null,
    image varchar(255) not null,
    rating decimal(3,1) not null,
    reviews int not null,
    passengers int not null,
    transmission enum('manual', 'automatic') not null,
    doors int not null,
    availability_status enum('available', 'rented', 'maintenance') default 'available'
);

-- pricing plans table
create table pricing_plans (
    plan_id int primary key auto_increment,
    plan_name varchar(50) not null,
    vehicle_type enum('car', 'bike') not null,
    price_per_hour decimal(10,2) not null,
    price_per_day decimal(10,2) not null
);

-- drivers table
create table drivers (
    driver_id int primary key auto_increment,
    name varchar(100) not null,
    phone varchar(15) unique not null,
    license_number varchar(50) unique not null,
    availability_status enum('available', 'unavailable', 'on_trip') default 'available'
);

-- driver salary table
create table driver_salary (
    salary_id int primary key auto_increment,
    driver_id int,
    monthly_salary decimal(10,2) not null,
    foreign key (driver_id) references drivers(driver_id) on delete cascade
);

-- bookings table
create table bookings (
    booking_id int primary key auto_increment,
    user_id int,
    vehicle_id int,
    driver_id int null,
    plan_id int default null,
    start_date datetime not null,
    end_date datetime null,
    total_price decimal(10,2) not null,
    status enum('pending', 'confirmed', 'completed', 'cancelled') default 'pending',
    foreign key (user_id) references users(user_id) on delete cascade,
    foreign key (vehicle_id) references vehicles(vehicle_id) on delete cascade,
    foreign key (driver_id) references drivers(driver_id) on delete set null,
    foreign key (plan_id) references pricing_plans(plan_id) on delete set null
);

-- payments table
create table payments (
    payment_id int primary key auto_increment,
    booking_id int,
    amount decimal(10,2) not null,
    damage_price decimal(10,2) default 0,
    total_amount decimal(10,2) not null,
    payment_method enum('credit_card', 'debit_card', 'upi', 'wallet') not null,
    payment_status enum('pending', 'completed', 'failed') default 'pending',
    foreign key (booking_id) references bookings(booking_id) on delete cascade
);

-- booking driver table
create table booking_driver (
    booking_driver_id int primary key auto_increment,
    booking_id int,
    driver_id int,
    driver_cost decimal(10,2) not null,
    foreign key (booking_id) references bookings(booking_id) on delete cascade,
    foreign key (driver_id) references drivers(driver_id) on delete cascade
);

-- reviews table
create table reviews (
    review_id int primary key auto_increment,
    user_id int,
    vehicle_id int,
    rating int check (rating between 1 and 5),
    review_text text,
    created_at timestamp default current_timestamp,
    foreign key (user_id) references users(user_id) on delete cascade,
    foreign key (vehicle_id) references vehicles(vehicle_id) on delete cascade
);

-- damage reports table
create table damage_reports (
    report_id int primary key auto_increment,
    booking_id int,
    vehicle_id int,
    damage_description text,
    damage_cost decimal(10,2) default 0 not null,
    reported_at timestamp default current_timestamp,
    foreign key (booking_id) references bookings(booking_id) on delete cascade,
    foreign key (vehicle_id) references vehicles(vehicle_id) on delete cascade
);

-- rental agreements table
create table rental_agreements (
    agreement_id int primary key auto_increment,
    booking_id int,
    user_id int,
    vehicle_id int,
    agreement_text longtext not null,
    signed_at timestamp default current_timestamp,
    foreign key (booking_id) references bookings(booking_id) on delete cascade,
    foreign key (user_id) references users(user_id) on delete cascade,
    foreign key (vehicle_id) references vehicles(vehicle_id) on delete cascade
);

