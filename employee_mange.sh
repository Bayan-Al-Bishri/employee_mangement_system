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
