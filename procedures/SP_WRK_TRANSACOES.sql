USE [DS_TRAINING]
GO
/****** Object:  StoredProcedure [dbo].[SP_WRK_TRANSACOES]    Script Date: 7/1/2018 9:49:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Douglas Marques
-- Create date: 20180630
-- Description:	PROCEDURE que cria TAB WRK_TRANSACOES
-- =============================================
ALTER PROCEDURE [dbo].[SP_WRK_TRANSACOES] 
	
AS
BEGIN

-- =============================================
--  DROP TABLE
-- =============================================
IF OBJECT_ID('WRK_TRANSACOES') IS NOT NULL
DROP TABLE [dbo].[WRK_TRANSACOES]

-- =============================================
-- CREATE TABLE
-- =============================================
	CREATE TABLE WRK_TRANSACOES
	(
	   [RowTable]		INT IDENTITY
	  ,[Order ID]		VARCHAR(100)
      ,[Order Date]		DATE
      ,[Customer ID]	VARCHAR(100)
      ,[Region]			VARCHAR(10)
      ,[Rep]			VARCHAR(100)
      ,[Item]			VARCHAR(100)
      ,[Units]			INT
      ,[Unit Price]		FLOAT
	)

-- =============================================
--  TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [dbo].[WRK_TRANSACOES]

-- =============================================
--  INSERT DATA
-- =============================================
INSERT INTO [dbo].[WRK_TRANSACOES]
           (
			    [Order ID]
			   ,[Order Date]
			   ,[Customer ID]
			   ,[Region]
			   ,[Rep]
			   ,[Item]
			   ,[Units]
			   ,[Unit Price]
		   )
SELECT 
	   [Order ID]
      ,[Order Date]
      ,RIGHT('0000000' + [Customer ID], 7)
      ,[Region]
      ,[Rep]
      ,[Item]
      ,[Units]
      ,[Unit Price]
  FROM [DS_TRAINING].[dbo].[RAW_Transacoes_20180701]

END
