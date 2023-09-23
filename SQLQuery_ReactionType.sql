
 --STEP_1 : # CLEANING DATA

SELECT TOP (1000) [F1]
      ,[Type]
      ,[Sentiment]
      ,[Score]
  FROM [Accenture].[dbo].[ReactionTypes]


  --Remove missing values in the table

  Select *

  From Accenture..ReactionTypes

  --Check out if column has any missing vales and display the total

  SELECT COUNT(*) AS TotalRows
  From Accenture..ReactionTypes 
  WHERE Sentiment IS NULL;


  SELECT COUNT(*) AS TotalRows
  From Accenture..ReactionTypes
  WHERE F1 IS NULL OR Type IS NULL OR Sentiment IS NULL OR Score IS NULL;


    --removing columns which are not relevant to this task. for  Reactions Column----------------

	ALTER TABLE Accenture..ReactionTypes
	DROP COLUMN F1

	Select *

	From Accenture..ReactionTypes

	--To check the data types of values within a specific column in a table, you can use the SQL function DATA_TYPE() combined with the DISTINCT keyword----
	--before you decide to change the data type of any columns its better to check out its data type is true------------------



	SELECT DISTINCT DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'ReactionTypes'
    AND COLUMN_NAME = 'Type';

	---The datatype for type column is nvarchar------------------

	 Select *

     From Accenture..ReactionTypes
	
	SELECT DISTINCT DATA_TYPE
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = 'ReactionTypes'
	AND COLUMN_NAME = 'Score'

	--Converting Float Datatype into Integers using CAST() ABD CONVERTED ()

	SELECT CAST(Score AS int) AS ConvertedValue

    FROM ReactionTypes;



	SELECT DISTINCT Score

    FROM ReactionTypes;

	Select *

	From Accenture..ReactionTypes

	--STEP 2: Data Modelling


