#!/bin/bash
set -e

paymentuser=paymentuser
paymentpassword=paymentpassword
paymentdb=paymentdb
POSTGRES_USER=postgres
POSTGRES_DB=payment_db_dotnet
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $paymentuser WITH PASSWORD '$paymentpassword';
    CREATE DATABASE $paymentdb;
    GRANT ALL PRIVILEGES ON DATABASE $paymentdb TO $paymentuser;
EOSQL