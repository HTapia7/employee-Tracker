const inquirer = require('inquirer');
const express = require('express')
const mysql  = require('mysql2');
const cTable = require('console.table');

// Database connection
const db = mysql.createConnection(
   {
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'company_db'
   },

   console.log(`Connected to the company_db database`)
 );

const promptUser = () => {
     inquirer.prompt([
      {
        type: 'list',
        name: 'menu',
        message: 'What do you want to do?',
        choices: [ 'Add a department',
                    'Add a role',
                    'Add an employee',
                    'Update Employee Role',
                    'View all departments',
                    'View all employees',
                    'View all roles'
        ]
      }
    ])
    .then((data) => {
      switch(data.menu){
        case 'View all departments':
          viewAllDepartments();
          break;

          case 'View all roles':
            viewAllRoles();
            break;

          case 'Add a department':
            addNewDepartment();
            break;

          


      }
    })
}

promptUser();

const viewAllDepartments = () => {
  db.query(`SELECT * FROM department ` , (err , res) => { 
      console.table(res);
      promptUser();
  }) 
};

const viewAllRoles = () => {
  db.query(`SELECT * FROM role` , (err , res) => {
      console.table(res)
      promptUser()
  })
};

const addNewDepartment = () => {
  inquirer.prompt([

      {
          type: 'input' ,
          message: 'Name of new department?',
          name: 'name'
      }
  ])
  .then((data) => {
      db.query(`INSERT INTO department (department_name) VALUES(?)` , data.name , (err , res) => {
          viewAllDepartments();
      })
  })
};

// const viewAllEmployees = () => {};

// const addRole  = () => {
  
// }
