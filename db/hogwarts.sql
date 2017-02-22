DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students; 

CREATE TABLE students(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house VARCHAR(255),
  age INT4
);

CREATE TABLE houses(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  logo VARCHAR(255)
);


ALTER TABLE students DROP COLUMN house;
ALTER TABLE students ADD COLUMN house_id INT4;
ALTER TABLE students ADD FOREIGN KEY (house_id) REFERENCES houses;
