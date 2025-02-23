#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo "~~~~~ MY SALON ~~~~~"

echo "Welcome to My Salon, how can I help you?"

while true; do
  while IFS='|' read -r SERVICE_ID NAME; do
    if [[ $NAME != name ]]; then
      echo "$SERVICE_ID) $NAME"
    fi
  done <<< $($PSQL "SELECT service_id, name FROM services")

  SERVICES_COUNT=$($PSQL "SELECT COUNT(service_id) FROM services")
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")


  if (($SERVICE_ID_SELECTED < 1 || $SERVICE_ID_SELECTED > $SERVICES_COUNT)); then
    echo "I could not find that service. What would you like today?"
  else
    break
  fi
done

echo "What's your phone number?"
read CUSTOMER_PHONE

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_ID ]]; then

 echo "I don't have a record for that phone number, what's your name?"
 read CUSTOMER_NAME

 echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
 read SERVICE_TIME

 echo -s "$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")"
 CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

 echo -s "$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")"
 echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

else
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id='$CUSTOMER_ID'")
  echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  echo "$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")"
  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi