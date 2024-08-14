#!/bin/bash
# Create Arithematic Calculator
# 1. Prompt the user to take two integers. Validate if the input is integer or not. Let the user know if the input is string or any char which 
# we cannot perform the calculations on.
# 2. Prompt user to select the operation they want to run (add, subtract, multiply, divide)
# 3. Use conditionals ('if`, `elif`, `else') to perform the chosen operation.
# 4. Display the result of the operation.
# 5. Handle division by zero with an appropriate error message.

# helper function to check if the user input is an integer or not. Returning boolean value based on the user input.
is_integer() {
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    return 0
  fi
  return 1
}

# Prompt the user to take two integers. Validate if the input is integer or not. Let the user know if the input is string or any char which 
# we cannot perform the calculations on.
while true; do

  read -p "Enter the first integer number: " num1
  if ! is_integer "$num1"; then
    echo "You entered "$num1", this is not an integer. Please enter an integer."
    continue
  fi
  read -p "Enter the second integer number: " num2
  if ! is_integer "$num2"; then
    echo "You entered "$num2", this is not an integer. Please enter an integer."
    continue
  fi
  break
done


# Prompt user to select the operation they want to run (add, subtract, multiply, divide)
while true; do
  read -p "Select operation (+, -, *, /): " op
  if [[ "$op" == "+" || "$op" == "-" || "$op" == "*" || "$op" == "/" ]]; then
    break
  else
    echo "Invalid operation. Please select +, -, *, or /."
  fi
done

# peerforming the calculation based on user inputs using CASE statement
case "$op" in
  +)
    result=$((num1 + num2))
    ;;
  -)
    result=$((num1 - num2))
    ;;
  *)
    result=$((num1 * num2))
    ;;
  /)
    if [ "$num2" -eq 0 ]; then
      echo "Error: Division by zero"
    else
      result=$((num1 / num2))
    fi
    ;;
esac

echo "you can see the numbers and operation you selected with the result below"
echo "$num1" "$op" "$num2" : "$result"
