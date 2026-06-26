package edu.fleetpulse.coreservice.entity;

import lombok.*;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "tenants")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Tenant {

    @Id
    @Column(name = "tenant_id", length = 36)
    private String tenantId;

    @Column(name = "company_name", nullable = false)
    private String companyName;

    @Column(name = "business_registration_number", nullable = false, unique = true)
    private String businessRegistrationNumber;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        if (this.tenantId == null) {
            this.tenantId = java.util.UUID.randomUUID().toString();
        }
        this.createdAt = LocalDateTime.now();
    }

}
