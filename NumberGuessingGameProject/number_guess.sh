#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#Ask for username
echo "Enter your username:"
read USERNAME

#Variable of the query for searching the username in the database and getting user_id for future usage
USER_ID=$($PSQL "SELECT user_id FROM user_table WHERE username='$USERNAME'")

#Checks if usernameresponse exists or not
if [ -z $USER_ID ]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO user_table(username) VALUES('$USERNAME')" > /dev/null
else
  #Queries for $GAMES_PLAYED and $BEST_GAME
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games as g LEFT JOIN user_table as u ON g.user_id=u.user_id WHERE g.user_id='$USER_ID'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
#test
#Variable of the query for searching the username in the database and getting user_id for future usage
USER_ID=$($PSQL "SELECT user_id FROM user_table WHERE username='$USERNAME'")

# Prompt for the user's guess
echo "Guess the secret number between 1 and 1000:"

# Read the user's guess and ensure it's a valid integer
read USER_GUESS


#GENERATE SECRET NUMBER
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

#Initialize counter
GUESSES=1

is_integer() {
  [[ $1 =~ ^[0-9]+$ ]]
}

# Ensure the first guess is a valid integer
while ! is_integer $USER_GUESS; do
  echo "That is not an integer, guess again:"
  read USER_GUESS
done

# Start guessing loop
while [ $USER_GUESS -ne $SECRET_NUMBER ]; do
  if [ $USER_GUESS -gt $SECRET_NUMBER ]; then
    echo "It's lower than that, guess again:"
  elif [ $USER_GUESS -lt $SECRET_NUMBER ]; then
    echo "It's higher than that, guess again:"
  fi
  
  # Read the next guess
  read USER_GUESS
  
  # Ensure each guess is a valid integer
  while ! is_integer $USER_GUESS; do
    echo "That is not an integer, guess again:"
    read USER_GUESS
  done

  # Increment the guess count
  ((GUESSES++))
done

$PSQL "INSERT INTO games(guesses,user_id) VALUES('$GUESSES','$USER_ID')" > /dev/null
# When the correct guess is made
echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"


