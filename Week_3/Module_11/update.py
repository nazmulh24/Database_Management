import mysql.connector

db_name = "python_test_db"

mydbconnection = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="password",
    database=db_name,
)

mycursor = mydbconnection.cursor()

sqlquery = """
            UPDATE Student
            SET Name = 'Nazmul'
            WHERE Name = 'Nazmul Hossain'
            """

mycursor.execute(sqlquery)
mydbconnection.commit()

print("Update table successful")
