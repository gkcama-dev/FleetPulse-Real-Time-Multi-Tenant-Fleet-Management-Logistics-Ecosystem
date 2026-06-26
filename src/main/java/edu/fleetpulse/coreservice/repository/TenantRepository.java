package edu.fleetpulse.coreservice.repository;

import edu.fleetpulse.coreservice.entity.Tenant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TenantRepository extends JpaRepository<Tenant,String> {
}
