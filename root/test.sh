#!/usr/bin/env sh

function checkError {
        if [ $1 -ne 0 ]; then
                echo "ERROR"
                exit $1
        fi
        echo "OK"
}

rc=0 

echo "Starting service ${SERVICE_NAME}"
/opt/web-monolith/web-monolith &
SERVICE_PID=$!

sleep 5

echo "Testing service ${SERVICE_NAME}"
CURRENT_VERSION=$(curl -sS localhost:8080)
if [ $? -ne 0 ]; then
	sleep 5
	CURRENT_VERSION=$(curl -sS localhost:8080)
fi

SERVICE_EXPECTED="Inventory microservice version ${SERVICE_VERSION}"

if [ "$CURRENT_VERSION" != "$SERVICE_EXPECTED" ]; then
        echo "ERROR got $CURRENT_VERSION expected $SERVICE_EXPECTED"
        rc=1
fi

echo "OK"
echo "Stoping service ${SERVICE_NAME}"
kill -15 $SERVICE_PID
exit $rc