INSERT INTO department (department_name)
VALUES ("Sales"),
       ("Engineer"),
       ("Legal"),
       ("Finance");
       
INSERT INTO role (title, salary, department_id)
VALUES ("Sales Manager", 100000, 1),
       ("Sales Lead", 80000, 1),
       ("Sales Associate", 50000, 1),

       ("Engineer Manager", 300000, 2),
       ("Senior Developer", 200000, 2),
       ("JR. Developer", 100000, 2),

       ("Legal Manager", 250000, 3),
       ("Legal Lead", 100000, 3),
       ("Legal Associate", 70000, 3),

       ("Finance Manager", 120000, 4),
       ("Finance Manager", 100000, 4),
       ("Finance Associate", 85000, 4);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Devan", "Wyatt", 1, NULL),
       ("Margaret", "Wilkinson", 2, 1),
       ("Tomas", "Figeroa", 3, 1),
       ("Jaylen", "Dalton", 4, NULL),
       ("Brooks", "Wade", 5, 4),
       ("Karina", "Stanly", 6, 4),
       ("Luz", "Cross", 7, NULL),
       ("Sarah", "Anderson", 8, 7),
       ("Terry", "Howell", 9, 7),
       ("Jeff", "Valentines", 10, NULL),
       ("Javier", "Patterson", 11, 10),
       ("Jeff", "Donald", 12, 10);