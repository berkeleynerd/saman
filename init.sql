---
CREATE EXTENSION IF NOT EXISTS postgis;

-- Create a test table with a geometry column
CREATE TABLE test_locations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    location GEOMETRY(Point, 4326)
);

-- Insert a test point (Hello World coordinates at NULL ISLAND - 0,0)
INSERT INTO test_locations (name, location)
VALUES ('Hello World', ST_SetSRID(ST_MakePoint(0, 0), 4326));
