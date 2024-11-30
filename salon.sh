#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -c"

SERVICES() {
    if [[ -z $1 ]]; then
        echo "Welcome to My Salon, how can I help you?

1) cut
2) color
3) perm
4) style
5) trim"

        read SERVICE_ID_SELECTED
    else
        echo "
I could not find that service. What would you like today?

1) cut
2) color
3) perm
4) style
5) trim"
        
        read SERVICE_ID_SELECTED

if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]; then
  SERVICES "invalid"
fi
    fi
}

echo "
~~~~~ MY SALON ~~~~~
"
SERVICES

if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]; then
    SERVICES "invalid"
fi

case $SERVICE_ID_SELECTED in
    1)
        SERVICE="cut"
        ;;
    2)
        SERVICE="color"
        ;;
    3)
        SERVICE="perm"
        ;;
    4)
        SERVICE="style"
        ;;
    5)
        SERVICE="trim"
        ;;
esac

# ----------------------------------
echo ""
echo "What's your phone number?"
read CUSTOMER_PHONE

$PSQL_NO_HEADER="psql --username=freecodecamp --dbname=salon -t -A -c"

CHECK_PHONE_NUMBER=$PSQL_NO_HEADER "SELECT count(*) FROM customers WHERE phone='$CUSTOMER_PHONE'"

echo $CHECK_PHONE_NUMBER

if [[ -z $CHECK_PHONE_NUMBER ]]; then
  echo ""
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME

  echo ""
  echo "What time would you like your cut, Fabio?"
  read SERVICE_TIME

  echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."

  else
  echo "salah"

fi