#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner ]]; then
    # Verifica se o time vencedor já existe no banco
    EXISTE_WINNER=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER' LIMIT 1")

    # Se o time vencedor não existir, insere
    if [[ -z $EXISTE_WINNER ]]; then
      INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_RESULT == "INSERT 0 1" ]]; then
        echo "Time $WINNER inserido."
      fi
    fi

    # Verifica se o time adversário já existe no banco
    EXISTE_OPPONENT=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT' LIMIT 1")

    # Se o time adversário não existir, insere
    if [[ -z $EXISTE_OPPONENT ]]; then
      INSERT_RESULT2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_RESULT2 == "INSERT 0 1" ]]; then
        echo "Time $OPPONENT inserido."
      fi
    fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner ]]; then
    # get winner ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # get opponent ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # insert games into games table
    echo "$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS')")"
  fi
done