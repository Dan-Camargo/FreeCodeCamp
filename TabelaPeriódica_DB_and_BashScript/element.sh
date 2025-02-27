#!/bin/bash

# Check if the user passed an argument
if [ -z "$1" ]; then
  echo "Please provide an element as an argument."
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  # Get the element identifier passed by the user
  ELEMENT_IDENTIFIER=$1

  # Determine the query based on the argument passed
  if [[ "$ELEMENT_IDENTIFIER" =~ ^[0-9]+$ ]]; then
    # If it's a number (atomic number)
    QUERY="SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties AS p LEFT JOIN types AS t ON p.type_id = t.type_id LEFT JOIN elements AS e ON p.atomic_number = e.atomic_number WHERE e.atomic_number = '$ELEMENT_IDENTIFIER'"
  elif [[ "$ELEMENT_IDENTIFIER" =~ ^[A-Za-z]{1,3}$ ]]; then
    # If it's a symbol (1 to 3 characters)
    QUERY="SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties AS p LEFT JOIN types AS t ON p.type_id = t.type_id LEFT JOIN elements AS e ON p.atomic_number = e.atomic_number WHERE e.symbol = '$ELEMENT_IDENTIFIER'"
  else
    # Otherwise, assume it's the name of the element
    QUERY="SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties AS p LEFT JOIN types AS t ON p.type_id = t.type_id LEFT JOIN elements AS e ON p.atomic_number = e.atomic_number WHERE e.name ILIKE '$ELEMENT_IDENTIFIER'"
  fi

  # Fetch the element information
  ELEMENT_INFO=$($PSQL "$QUERY") 

  # If no result is returned, the element was not found
  if [ -z "$ELEMENT_INFO" ]; then
    echo "I could not find that element in the database."
  else
    # Extract values from the result (assuming the query returns them in the correct order)
    IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$ELEMENT_INFO"

    # Display the formatted output
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi