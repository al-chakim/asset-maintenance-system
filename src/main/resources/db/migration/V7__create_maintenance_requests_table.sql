CREATE TABLE maintenance_requests (
    id BIGSERIAL PRIMARY KEY,

    request_number VARCHAR(50) NOT NULL UNIQUE,

    asset_id BIGINT NOT NULL,
    requester_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    location_id BIGINT NOT NULL,

    title VARCHAR(200) NOT NULL,
    description TEXT,

    priority VARCHAR(20) NOT NULL DEFAULT 'MEDIUM',
    status VARCHAR(30) NOT NULL DEFAULT 'SUBMITTED',

    assigned_to BIGINT,

    requested_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    assigned_at TIMESTAMP,
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    closed_at TIMESTAMP,

    resolution TEXT,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_maintenance_request_asset
        FOREIGN KEY (asset_id)
        REFERENCES assets(id),

    CONSTRAINT fk_maintenance_request_requester
        FOREIGN KEY (requester_id)
        REFERENCES users(id),

    CONSTRAINT fk_maintenance_request_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id),

    CONSTRAINT fk_maintenance_request_location
        FOREIGN KEY (location_id)
        REFERENCES locations(id),

    CONSTRAINT fk_maintenance_request_assigned_to
        FOREIGN KEY (assigned_to)
        REFERENCES users(id),

    CONSTRAINT chk_maintenance_request_priority
        CHECK (priority IN ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL')),

    CONSTRAINT chk_maintenance_request_status
        CHECK (
            status IN (
                'SUBMITTED',
                'PENDING',
                'ASSIGNED',
                'IN_PROGRESS',
                'ON_HOLD',
                'RESOLVED',
                'CLOSED',
                'REJECTED'
            )
        )
);

CREATE INDEX idx_maintenance_requests_asset_id
    ON maintenance_requests(asset_id);

CREATE INDEX idx_maintenance_requests_requester_id
    ON maintenance_requests(requester_id);

CREATE INDEX idx_maintenance_requests_category_id
    ON maintenance_requests(category_id);

CREATE INDEX idx_maintenance_requests_location_id
    ON maintenance_requests(location_id);

CREATE INDEX idx_maintenance_requests_assigned_to
    ON maintenance_requests(assigned_to);

CREATE INDEX idx_maintenance_requests_status
    ON maintenance_requests(status);

CREATE INDEX idx_maintenance_requests_priority
    ON maintenance_requests(priority);

CREATE INDEX idx_maintenance_requests_requested_at
    ON maintenance_requests(requested_at);