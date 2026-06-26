-- 1. Tenants Table
CREATE TABLE tenants (
                         tenant_id VARCHAR(36) PRIMARY KEY,
                         company_name VARCHAR(255) NOT NULL,
                         business_registration_number VARCHAR(100) UNIQUE NOT NULL,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Users Table
CREATE TABLE users (
                       user_id VARCHAR(36) PRIMARY KEY,
                       tenant_id VARCHAR(36) NOT NULL,
                       email VARCHAR(255) UNIQUE NOT NULL,
                       password_hash VARCHAR(255) NOT NULL,
                       role VARCHAR(50) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       FOREIGN KEY (tenant_id) REFERENCES tenants(tenant_id) ON DELETE CASCADE
);

-- 3. Drivers Table
CREATE TABLE drivers (
                         driver_id VARCHAR(36) PRIMARY KEY,
                         tenant_id VARCHAR(36) NOT NULL,
                         user_id VARCHAR(36) NOT NULL,
                         license_number VARCHAR(100) UNIQUE NOT NULL,
                         phone_number VARCHAR(20) NOT NULL,
                         status VARCHAR(50) NOT NULL DEFAULT 'AVAILABLE',
                         FOREIGN KEY (tenant_id) REFERENCES tenants(tenant_id) ON DELETE CASCADE,
                         FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 4. Vehicles Table
CREATE TABLE vehicles (
                          vehicle_id VARCHAR(36) PRIMARY KEY,
                          tenant_id VARCHAR(36) NOT NULL,
                          vehicle_number VARCHAR(50) UNIQUE NOT NULL,
                          vehicle_type VARCHAR(50) NOT NULL,
                          status VARCHAR(50) NOT NULL DEFAULT 'IDLE',
                          FOREIGN KEY (tenant_id) REFERENCES tenants(tenant_id) ON DELETE CASCADE
);

-- 5. Trips Table
CREATE TABLE trips (
                       trip_id VARCHAR(36) PRIMARY KEY,
                       tenant_id VARCHAR(36) NOT NULL,
                       vehicle_id VARCHAR(36) NOT NULL,
                       driver_id VARCHAR(36) NOT NULL,
                       start_location VARCHAR(255) NOT NULL,
                       end_location VARCHAR(255) NOT NULL,
                       status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       started_at TIMESTAMP NULL,
                       ended_at TIMESTAMP NULL,
                       FOREIGN KEY (tenant_id) REFERENCES tenants(tenant_id) ON DELETE CASCADE,
                       FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
                       FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);