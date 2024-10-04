-- Create tables with private general data

CREATE SCHEMA general;

-- This table is incomplete and this table is for testing
CREATE TABLE IF NOT EXISTS general.workers (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    identity_card integer NOT NULL UNIQUE,
    is_foreign boolean NOT NULL DEFAULT false,
    full_name varchar(160) NOT NULL,
    gender_id integer NOT NULL DEFAULT 1,
    department_id integer NOT NULL,
    position_id integer NOT NULL,
    payroll_type_id integer NOT NULL,
    area_coordination_id integer NOT NULL DEFAULT 0,
    status varchar NOT NULL DEFAULT true,
    created date DEFAULT CURRENT_DATE,
    updated date
);

CREATE TABLE IF NOT EXISTS general.location(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    worker_id integer NOT NULL UNIQUE,
    state_id integer NOT NULL,
    municipality_id integer NOT NULL,
    parish_id integer NOT NULL,
    address text DEFAULT ''
);

CREATE TABLE IF NOT EXISTS general.contact(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    worker_id integer NOT NULL UNIQUE,
    email varchar(200) DEFAULT '',
    email2 varchar(200) DEFAULT '',
    phone varchar(20) DEFAULT '',
    phone2 varchar(20) DEFAULT ''
);

CREATE TABLE IF NOT EXISTS general.department(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    department varchar(200) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS general.position(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    position varchar(200) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS general.payroll_type(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    name varchar(200) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS general.area_coordination(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    area varchar(200) NOT NULL UNIQUE
);

ALTER TABLE general.workers ADD CONSTRAINT fk_workers_gender_id FOREIGN KEY (gender_id) references genders(id);

ALTER TABLE general.workers ADD CONSTRAINT fk_workers_department_id FOREIGN KEY (department_id) references general.department(id);

ALTER TABLE general.workers ADD CONSTRAINT fk_workers_position_id FOREIGN KEY (position_id) references general.position(id);

ALTER TABLE general.workers ADD CONSTRAINT fk_workers_payroll_type_id FOREIGN KEY (payroll_type_id) references general.payroll_type(id);

ALTER TABLE general.workers ADD CONSTRAINT fk_workers_area_coordination_id FOREIGN KEY (area_coordination_id) references general.area_coordination(id);

ALTER TABLE general.location ADD CONSTRAINT fk_location_worker_id FOREIGN KEY (worker_id) references general.workers(id);

ALTER TABLE general.location ADD CONSTRAINT fk_location_state_id FOREIGN KEY (state_id) references states(id);

ALTER TABLE general.location ADD CONSTRAINT fk_location_municipality_id FOREIGN KEY (municipality_id) references municipalities(id);

ALTER TABLE general.location ADD CONSTRAINT fk_location_parish_id FOREIGN KEY (parish_id) references parishes(id);