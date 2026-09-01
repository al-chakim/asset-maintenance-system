CREATE TABLE assets (
    id BIGSERIAL PRIMARY KEY,

    asset_code VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL,

    category_id BIGINT NOT NULL,
    location_id BIGINT NOT NULL,

    description VARCHAR(255),

    status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',

    purchase_date DATE,
    purchase_price NUMERIC(15, 2),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_assets_category
        FOREIGN KEY (category_id)
        REFERENCES categories(id),

    CONSTRAINT fk_assets_location
        FOREIGN KEY (location_id)
        REFERENCES locations(id)
);