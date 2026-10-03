#!/bin/bash
DELIMITER="|"
while true 
do
    echo "==============================" 
    echo "Employee Management System" 
    echo "==============================" 
    echo "1. Add Employee" 
    echo "2. View All Employees" 
    echo "3. Search Employee" 
    echo "4. Exit" 
    echo "=============================="
    read -p "Enter your choice: " choice

    case $choice in
       1)
           read -p "Enter Employye ID: " id
           if [ -f employees.txt] && grep -q "^$id $DELIMITER" employees.txt; then 
               echo "Employee ID already exists. "
           else
               read -p "Enter Employee Name: " name
               read -p "Enter Phone: " phone
               read -p "Enter Department: " department
               read -p "Enter Salary: " salary
        
               echo "$id $DELIMITER $name $DELIMITER $phone $DELIMITER $department $DELIMITER $salary" >> employees.txt
               echo "Employee added successfully. "
           fi
           ;;
       2)
        
           echo "==========================="
           echo "All Employees "
           echo "==========================="

           if [ -f employees.txt ]; then
               cat employees.txt
           else
               echo "No employees found. "
           fi
           ;;
       3)
           read -p "Enter Employee ID to search: " search_id
           if [ -f employees.txt ] && grep -q "^$search_id $DELIMITER" employees.txt; then
               grep "^$search_id $DELIMITER" employees.txt
               echo "Employee found. "
           else
               echo "Employee not found. "
           fi
           ;;
       4)
           echo "Exiting Employee Management System..."
           break
           ;;
       *)
           echo "Invalid choice. Please try again."
           ;;
    esac
done
