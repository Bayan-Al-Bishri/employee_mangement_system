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
        echo "Add Employee selected"
        ;;
    2)
        echo "View All Employees selected"
        ;;
    3)
        echo "Search Employee selected"
        ;;
    4)
        echo "Exiting the system..."
        break
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

echo ""
done
echo "====================================="
echo "Employee Management System"
echo "====================================="
while true; do
   read -p "Enter Employee ID: " id
   if [ -z "$id" ];then
     echo "ID cannot be empty. try again. "
     continue 
     fi
if [ -f "employees.txt" ]; then
if cut -d "|" -f 1 "employees.txt" | grep -q "^$id$"; then
echo "Error: Employee ID already exists! Enter a unique ID."
continue 
fi
fi
break
done
read -p "Enter Employee Name: " name
read -p "Enter Phone Number: " phone
read -p "Enter Department: " department
read -p "Enter Basic Salary: " basic_salary
echo "$id|$name|$phone|$department|$basic_salary" >> "employees.txt
echo ""
echo "Employee Information"
echo "==========================="
echo "Employee ID: $id"
echo "Employee Name: $name"
echo "Phone Number: $phone"
echo "Department: $department"
echo "Basic Salary: $basic_salary"
;;
