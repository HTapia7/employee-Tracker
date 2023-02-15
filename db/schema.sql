DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;

USE company_db;


CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(30) NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE role (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL NOT NULL,
  department_id INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (department_id)
  REFERENCES department(id)
);


CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT NOT NULL,
  manager_id INT REFERENCES employee(id),

  PRIMARY KEY (id),
  FOREIGN KEY (role_id)
  REFERENCES role(id)
);

CREATE VIEW employee_info AS
(SELECT
role.id AS role_id,
role.title,
role.salary,
department_name AS department_name
FROM role
JOIN department
on role.department_id = department.id);

CREATE VIEW employees_with_managers AS
(SELECT emp.id,
emp.first_name,
emp.last_name,
emp.role_id,
CONCAT(manager.first_name, ' ', manager.last_name) AS manager_name
FROM employee AS manager RIGHT OUTER JOIN employee AS emp ON manager.id = emp.manager_id);