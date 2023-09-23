SELECT TOP (1000) [F1]
      ,[Content ID]
      ,[User ID]
      ,[Type]
      ,[Category]
      ,[URL]
  FROM [Accenture].[dbo].[Content]


  --remove missing values in URL Column IN THE CONTENT table

  Select *

  From Accenture..Content

  Where URL is null

  DELETE FROM Accenture..Content
  WHERE URL IS NULL OR URL = '';

  SELECT COUNT(*) AS TotalRows
  From Accenture..Content 
  WHERE URL IS NULL;


  SELECT COUNT(*) AS TotalRows
  From Accenture..Content 
  WHERE F1 IS NULL OR [Content ID] IS NULL OR [User ID] IS NULL OR Type IS NULL OR URL IS NULL;

    --removing columns which are not relevant to this task. for  Reactions Column----------------

	ALTER TABLE Accenture..Content
	DROP COLUMN F1

	
  Select *

  From Accenture..Content
  --To check the data types of values within a specific column in a table, you can use the SQL function DATA_TYPE() combined with the DISTINCT keyword----
	--before you decide to change the data type of any columns its better to check out its data type is true------------------

    SELECT DISTINCT DATA_TYPE
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'Content'
	AND COLUMN_NAME = 'Content ID'

	--Content ID Column I find out has the navarchar Datatype and its must be UUID as Data type it described in the problem so we have to change it to UUID Data type
	--To convert an nvarchar (string) datatype column to a UUID data type column in SQL Server, you can follow these steps:

	--1)--Add a new column of UUID data type to your table using the ALTER TABLE statement:

	ALTER TABLE Accenture..Content
    ADD NewColumnName UNIQUEIDENTIFIER;

	--2)--Update the new column with the UUID values converted from the existing nvarchar column. You can use the NEWID() function to generate new UUID values for each row:

	UPDATE Accenture..Content
    SET NewColumnName = NEWID();

	 --To rename the newly added column "NewColumnName" to "New_ContentID" in the table "Reactions" in the "Accenture" schema, you can use the ALTER TABLE statement with the sp_rename system stored procedure. 

	EXEC sp_rename 'Accenture..Content.NewColumnName', 'New_ContentID', 'COLUMN';

	--If necessary, drop the original nvarchar column from the table using the ALTER TABLE statement:

	--ALTER TABLE Accenture..Content
 --   DROP COLUMN Content ID;

 --depend on our target column we decide to remove out unsed column or unecessary column in datasets (User ID & URL) is userless here
  --The error you're encountering is due to the fact that "user" is a reserved keyword in SQL Server. To successfully drop a column with a name that is a reserved keyword, you need to enclose the column name in square brackets ([]). 

   ALTER TABLE Accenture..Content
   DROP COLUMN URL;

   ALTER TABLE Accenture..Content
   DROP COLUMN [User ID];

   --Rename Type Column to Content Type---------------

   EXEC sp_rename 'Accenture..Content.Type', 'Content Type', 'COLUMN';

   --Removing some Quortation marks in the Category column

    UPDATE Accenture..Content
    SET Category = TRIM('"' FROM Category),
    Column3 = TRIM('"' FROM Column3);
    
	UPDATE Accenture..Content
    SET Category = TRIM('"' FROM Category);

   Select *

   From Accenture..Content

   --STEP 2: Data Modelling

