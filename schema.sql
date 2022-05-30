/* Database schema to keep the structure of entire database. */
drop table animals;
CREATE TABLE if not exists animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE NOT NULL,
    escape_attempts FLOAT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);