-- Version de prueba de base de datos
create table persons(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    identity_card integer NOT NULL UNIQUE,
    last_names varchar(160) NOT NULL,
    names varchar(160) NOT NULL,
    position varchar(160) NOT NULL,
    department varchar(160) NOT NULL,
    status boolean NOT NULL DEFAULT true
);


-- Version de produccion

-- CREATE SCHEMA carnets;

-- create table carnets.persons(
--     id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
--     identity_card integer NOT NULL UNIQUE,
--     last_names varchar(160) NOT NULL,
--     names varchar(160) NOT NULL,
--     position_id integer NOT NULL,
--     department_id integer NOT NULL,
--     status boolean NOT NULL DEFAULT true
-- );

-- CREATE table carnets.position(
--     id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
--     position varchar(160) NOT NULL UNIQUE
-- );

-- CREATE table carnets.department(
--     id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
--     department varchar(160) NOT NULL UNIQUE
-- );

-- ALTER TABLE carnets.persons ADD CONSTRAINT fk_persons_position_id FOREIGN KEY (position_id) references position(id);
-- ALTER TABLE carnets.persons ADD CONSTRAINT fk_persons_department_id FOREIGN KEY (department_id) references department(id);
