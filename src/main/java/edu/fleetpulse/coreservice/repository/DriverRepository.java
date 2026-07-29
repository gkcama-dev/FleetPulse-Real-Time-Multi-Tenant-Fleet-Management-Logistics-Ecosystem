package edu.fleetpulse.coreservice.repository;

import edu.fleetpulse.coreservice.entity.Driver;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DriverRepository extends JpaRepository<Driver, String> {
}
