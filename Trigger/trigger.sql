DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
   id INT GENERATED ALWAYS AS IDENTITY,
   first_name VARCHAR(40) NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE employee_audits (
   id INT GENERATED ALWAYS AS IDENTITY,
   employee_id INT NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   changed_on TIMESTAMP(6) NOT NULL
);



CREATE OR REPLACE FUNCTION log_last_name_changes()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(new.id,new.last_name,now());
	

	RETURN NEW;
END;
$$

CREATE TRIGGER last_name_changes
  after insert or update
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();
 
DROP TRIGGER last_name_changes
ON employees;
 
 
 
 
 
INSERT INTO employees (first_name, last_name)
VALUES ('John', 'Doe');

INSERT INTO employees (first_name, last_name)
VALUES ('Lily', 'Bush');
 

SELECT * FROM employees;


UPDATE employees
SET last_name = 'Akshay'
WHERE ID = 17;


SELECT * FROM employee_audits;


INSERT INTO employees (first_name, last_name)
VALUES ('tukadiya', 'bhavesh');



