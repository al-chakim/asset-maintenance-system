CREATE TABLE maintenance_request_histories (
    id BIGSERIAL PRIMARY KEY,

    maintenance_request_id BIGINT NOT NULL,

    status_from VARCHAR(30),

    status_to VARCHAR(30) NOT NULL,

    changed_by BIGINT NOT NULL,

    changed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    notes TEXT,

    CONSTRAINT fk_maintenance_request_histories_request
        FOREIGN KEY (maintenance_request_id)
        REFERENCES maintenance_requests(id),

    CONSTRAINT fk_maintenance_request_histories_changed_by
        FOREIGN KEY (changed_by)
        REFERENCES users(id)
);

CREATE INDEX idx_mrh_request_id
ON maintenance_request_histories(maintenance_request_id);

CREATE INDEX idx_mrh_changed_by
ON maintenance_request_histories(changed_by);

CREATE INDEX idx_mrh_changed_at
ON maintenance_request_histories(changed_at);