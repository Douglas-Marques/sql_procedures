USE [DS_TRAINING]
GO
/****** Object:  StoredProcedure [dbo].[SP_WRK_CLIENTES]    Script Date: 7/1/2018 9:49:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Douglas Marques
-- Create date: 20180630
-- Description:	PROCEDURE que cria a TAB WRK_CLIENTES
-- =============================================

ALTER PROCEDURE [dbo].[SP_WRK_CLIENTES]

AS
BEGIN

-- =============================================
--  DROP TABLE
-- =============================================
IF OBJECT_ID('WRK_CLIENTES') IS NOT NULL
DROP TABLE [dbo].[WRK_CLIENTES]

-- =============================================
--  CRIAÇÃO DA TABELA
-- =============================================
CREATE TABLE WRK_CLIENTES
			(
			   [RowTable]		INT IDENTITY
			  ,[Customer ID]    VARCHAR(100)
			  ,[City]			VARCHAR(100)
			  ,[ZipCode]		VARCHAR(10)
			  ,[Gender]			CHAR(1)
			  ,[Age]			FLOAT
			)

-- =============================================
--  TRUNCATE DA TABELA
-- =============================================
TRUNCATE TABLE [dbo].[WRK_CLIENTES]

-- =============================================
--  INSERÇÃO DOS DADOS
-- =============================================
INSERT INTO [dbo].[WRK_CLIENTES]
           (
				[Customer ID]
			   ,[City]
			   ,[ZipCode]
			   ,[Gender]
			   ,[Age]
		   )
SELECT 
       RIGHT('0000000'+[Customer ID], 7)
      ,[City]
      ,[ZipCode]
      ,[Gender]
      ,[Age]
  FROM [DS_TRAINING].[dbo].[RAW_Clientes_20180626]

END
