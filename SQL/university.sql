-- Készíts új adatbázist university_db.
CREATE DATABASE university_db;

-- Készíts students táblát(id, first_name, middle_name, last_name, date_of_birth)
CREATE TABLE IF NOT EXISTS students (
    id SMALLINT UNSIGNED PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    middle_name VARCHAR(128),
    last_name VARCHAR(128) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- Készíts professors táblát(id, first_name, middle_name, last_name, date_of birth)
CREATE TABLE IF NOT EXISTS professors (
    id SMALLINT UNSIGNED PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    middle_name VARCHAR(128),
    last_name VARCHAR(128) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- Készíts courses táblát(id, course_name, professor(FK), description(varchar(100))
CREATE TABLE IF NOT EXISTS courses (
    id SMALLINT UNSIGNED PRIMARY KEY,
    course_name VARCHAR(128) NOT NULL,
    professor_id SMALLINT UNSIGNED,
    description VARCHAR(100),
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);

-- Készíts grades táblát(id, grade, course_id, student_id)
CREATE TABLE IF NOT EXISTS grades (
    id SMALLINT UNSIGNED PRIMARY KEY,
    grade TINYINT UNSIGNED NOT NULL,
    course_id SMALLINT UNSIGNED,
    student_id SMALLINT UNSIGNED,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- Hány embernek van középső neve? 
select count(*) from students where middle_name is not null;
select count(*) from professors where middle_name is not null;