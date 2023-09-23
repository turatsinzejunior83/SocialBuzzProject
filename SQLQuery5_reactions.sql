--# removing rows that have values which are missing,

   ---------------Reactions  ------------------
   --Loading datasets

   Select *
   From Accenture..Reactions

   --# removing rows that have values which are missing,from Reactions Table

  Select *
  From Accenture..Reactions
  Where [Type] is null

  DELETE FROM Accenture..Reactions
  WHERE [User ID] IS NULL OR [User ID] = '';

   Select *
  From Accenture..Reactions
  Where [User ID] is null

  Select *

  From Accenture..Reactions
  
  Where Type is null

   --Check out if column has any missing vales and display the total

  SELECT COUNT(*) AS TotalRows
  From Accenture..Reactions
  WHERE [User ID] IS NULL;


  SELECT COUNT(*) AS TotalRows
  From Accenture..Reactions
  WHERE F1 IS NULL OR [Content ID] IS NULL OR [User ID] IS NULL OR Type IS NULL OR Datetime IS NULL;


  --removing columns which are not relevant to this task. for  Reactions Column----------------

 

  ALTER TABLE Accenture..Reactions

  DROP COLUMN  F1


  --To check the data types of values within a specific column in a table, you can use the SQL function DATA_TYPE() combined with the DISTINCT keyword----
	--before you decide to change the data type of any columns its better to check out its data type is true------------------

    SELECT DISTINCT DATA_TYPE
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Reactions'
	AND COLUMN_NAME = 'Content ID'

  --Content ID Column I find out has the navarchar Datatype and its must be UUID as Data type it described in the problem so we have to change it to UUID Data type
	--To convert an nvarchar (string) datatype column to a UUID data type column in SQL Server, you can follow these steps:

	--1)--Add a new column of UUID data type to your table using the ALTER TABLE statement:

	ALTER TABLE Accenture..Reactions
    ADD NewColumnName UNIQUEIDENTIFIER;

	--2)--Update the new column with the UUID values converted from the existing nvarchar column. You can use the NEWID() function to generate new UUID values for each row:

	UPDATE Accenture..Reactions
    SET NewColumnName = NEWID();

	--To rename the newly added column "NewColumnName" to "New_ContentID" in the table "Reactions" in the "Accenture" schema, you can use the ALTER TABLE statement with the sp_rename system stored procedure. 

	EXEC sp_rename 'Accenture..Reactions.NewColumnName', 'New_Content ID', 'COLUMN';

	------Check for User ID Data type----------------
	SELECT DISTINCT DATA_TYPE
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Reactions'
	AND COLUMN_NAME = 'User ID'

	--CONVERTING NVARCHAR TO UUID-----

	ALTER TABLE Accenture..Reactions
    ADD NewColumnName UNIQUEIDENTIFIER;

	UPDATE Accenture..Reactions
    SET NewColumnName = NEWID();

	EXEC sp_rename 'Accenture..Reactions.NewColumnName', 'New_User ID', 'COLUMN';

	------Check for Datetime Data type----------------

	SELECT DISTINCT DATA_TYPE
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Reactions'
	AND COLUMN_NAME = 'Datetime'

	--can convert a datetime value into a timestamp using the CAST or CONVERT function. The timestamp data type in SQL Server is a unique identifier for a row and represents the relative sequence of modifications within a database
	--ALTER TABLE YourTableName
 --   ALTER COLUMN YourDateTimeColumn TIMESTAMP;
 ----IF IT SAYS ERROR USE DATETIME---------

	ALTER TABLE Accenture..Reactions
    ALTER COLUMN Datetime DATETIME;

	--If necessary, drop the original nvarchar column from the table using the ALTER TABLE statement:

	--ALTER TABLE YourTableName
 --   DROP COLUMN YourColumnName;

 --depend on our target column we decide to remove out unsed column or unecessary column in datasets (User - ID) is userless here
  --The error you're encountering is due to the fact that "User" is a reserved keyword in SQL Server. To successfully drop a column with a name that is a reserved keyword, you need to enclose the column name in square brackets ([]). 

   ALTER TABLE Accenture..Reactions
   DROP COLUMN [User ID];

    Select *

    From Accenture..Reactions

	--STEP 2: Data Modelling----