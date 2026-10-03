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
           if [ -f employees.txt ] && grep -q "^$id $DELIMITER" employees.txt; then 
               echo "Employee ID already exists. "
           else
               read -p "Enter Employee Name: " name
               read -p "Enter Phone: " phone
               read -p "Enter Department: " department
               read -p "Enter Salary: " salary
               if [ "$salary" -lt 1500 ]; then
            hra=$(echo "$salary * 0.10" | bc)
            da=$(echo "$salary * 0.90" | bc)
        else
            hra=500
            da=$(echo "$salary * 0.98" | bc)
        fi
        gross=$(echo "$salary + $hra + $da" | bc)
        
               echo "$id $DELIMITER $name $DELIMITER $phone $DELIMITER $department $DELIMITER $salary $DELIMITER $hra $DELIMITER $da $DELIMITER $gross" >> employees.txt
               echo "Employee added successfully. "
               echo "HRA: $hra"
            echo "DA: $da"
            echo "Gross Salary: $gross"
           fi
           ;;
       2)
           echo "=================================================================="
           echo "                         All Employees                            "
           echo "=================================================================="

           if [ ! -f "employees.txt" ] || [ ! -s "employees.txt" ]; then
               echo "No employees found."
           else
               printf "%-8s | %-15s | %-12s | %-12s | %-10s\n" "ID" "Name" "Phone" "Department" "Gross"
               echo "------------------------------------------------------------------"
               while IFS="$DELIMITER" read -r id name phone dept salary hra da gross; do
                   id=$(echo "$id" | xargs)
                   name=$(echo "$name" | xargs)
                   phone=$(echo "$phone" | xargs)
                   dept=$(echo "$dept" | xargs)
                   gross=$(echo "$gross" | xargs)
                   
                   printf "%-8s | %-15s | %-12s | %-12s | %-10s\n" "$id" "$name" "$phone" "$dept" "$gross"
               done < "employees.txt"
           fi
           echo "=================================================================="
           ;;
       3)
           echo "=================================================="
           echo "                SEARCH EMPLOYEE                   "
           echo "=================================================="
           
           if [ ! -f "employees.txt" ] || [ ! -s "employees.txt" ]; then
               echo "No employees found to search."
           else
               echo -n "Enter Employee ID or Name to search: "
               read search_term

               results=$(grep -i "$search_term" "employees.txt")

               if [ -z "$results" ]; then
                   echo "Employee not found."
               else
                   echo "Matching results found:"
                   echo "------------------------------------------------------------------"
                   printf "%-8s | %-15s | %-12s | %-12s | %-10s\n" "ID" "Name" "Phone" "Department" "Gross"
                   echo "------------------------------------------------------------------"
                   
                   while IFS="$DELIMITER" read -r id name phone dept salary hra da gross; do
                       line="$id $DELIMITER $name $DELIMITER $phone $DELIMITER $dept $DELIMITER $salary $DELIMITER $hra $DELIMITER $da $DELIMITER $gross"
                       echo "$line" | grep -i -q "$search_term" && \
                       printf "%-8s | %-15s | %-12s | %-12s | %-10s\n" "$(echo $id | xargs)" "$(echo $name | xargs)" "$(echo $phone | xargs)" "$(echo $dept | xargs)" "$(echo $gross | xargs)"
                   done <<< "$results"
               fi
           fi
           echo "=================================================="
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
