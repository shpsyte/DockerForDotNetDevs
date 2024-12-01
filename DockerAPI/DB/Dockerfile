FROM mcr.microsoft.com/mssql/server:2022-latest 

COPY ./wait-for-db.sh /wait-for-db.sh
COPY ./UpdateDB.sql /UpdateDB.sql

CMD /wait-for-db.sh