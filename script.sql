CREATE DATABASE InnowiseDB
GO
use [InnowiseDB]
GO
CREATE TABLE [Account](
	[Id] INT IDENTITY(1,1) NOT NULL,
	[ClientId] INT NOT NULL,
	[Balance] MONEY NOT NULL,
	[BankId] INT NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY (Id)
)
GO

CREATE TABLE [Bank](
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY (Id) 
)

GO
CREATE TABLE [Branch](
	[CityId] INT NOT NULL,
	[BankId] INT NOT NULL,
	[Id] INT IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY (Id) 
)
GO
CREATE TABLE [Card](
	[Id] INT IDENTITY(1,1) NOT NULL,
	[AccountId] INT NOT NULL,
	[Balance] MONEY NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY (Id) 
)
GO
CREATE TABLE [City](
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY (Id) 
)
GO
CREATE TABLE [Client](
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[SecondName] NVARCHAR(50) NOT NULL,
	[DateOfBirth] DATE NOT NULL,
	[StatusId] INT NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY (Id)  
)
GO
CREATE TABLE [Social Status](
	[Id] INT IDENTITY(1,1) NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
 CONSTRAINT [PK_Social Status] PRIMARY KEY (Id)  
)
GO
SET IDENTITY_INSERT [Account] ON 
INSERT [Account] ([Id], [ClientId], [Balance], [BankId]) VALUES (1, 1, 1300.0000, 2)
INSERT [Account] ([Id], [ClientId], [Balance], [BankId]) VALUES (2, 2, 810.0000, 1)
INSERT [Account] ([Id], [ClientId], [Balance], [BankId]) VALUES (3, 3, 1100.0000, 3)
INSERT [Account] ([Id], [ClientId], [Balance], [BankId]) VALUES (5, 6, 1600.0000, 5)
INSERT [Account] ([Id], [ClientId], [Balance], [BankId]) VALUES (8, 7, 1800.0000, 4)
SET IDENTITY_INSERT [Account] OFF
GO
SET IDENTITY_INSERT [Bank] ON 
INSERT [Bank] ([Id], [Name]) VALUES (1, N'Alpha Bank')
INSERT [Bank] ([Id], [Name]) VALUES (2, N'Belarusbank')
INSERT [Bank] ([Id], [Name]) VALUES (3, N'Sber Bank')
INSERT [Bank] ([Id], [Name]) VALUES (4, N'Paritet Bank')
INSERT [Bank] ([Id], [Name]) VALUES (5, N'Priorbank')
SET IDENTITY_INSERT [Bank] OFF
GO

SET IDENTITY_INSERT [Branch] ON 
INSERT [Branch] ([CityId], [BankId], [Id]) VALUES (1, 2, 1)
INSERT [Branch] ([CityId], [BankId], [Id]) VALUES (2, 1, 2)
INSERT [Branch] ([CityId], [BankId], [Id]) VALUES (3, 4, 3)
INSERT [Branch] ([CityId], [BankId], [Id]) VALUES (4, 5, 4)
INSERT [Branch] ([CityId], [BankId], [Id]) VALUES (5, 3, 5)
INSERT [Branch] ([CityId], [BankId], [Id]) VALUES (1, 3, 6)
SET IDENTITY_INSERT [Branch] OFF 

GO
SET IDENTITY_INSERT [Card] ON 
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (1, 1, 600.0000)
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (2, 2, 310.0000)
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (3, 3, 900.0000)
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (4, 5, 1600.0000)
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (5, 8, 1200.0000)
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (6, 1, 400.0000)
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (7, 2, 500.0000)
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (8, 3, 50.0000)
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (9, 8, 200.0000)
INSERT [Card] ([Id], [AccountId], [Balance]) VALUES (10, 8, 0.0000)
SET IDENTITY_INSERT [Card] OFF

GO
SET IDENTITY_INSERT [City] ON
INSERT [City] ([Id], [Name]) VALUES (1, N'Gomel')
INSERT [City] ([Id], [Name]) VALUES (2, N'Vitebsk')
INSERT [City] ([Id], [Name]) VALUES (3, N'Minsk')
INSERT [City] ([Id], [Name]) VALUES (4, N'Grodno')
INSERT [City] ([Id], [Name]) VALUES (5, N'Brest')
SET IDENTITY_INSERT [City] OFF

GO
SET IDENTITY_INSERT [Client] ON 
INSERT [Client] ([Id], [Name], [SecondName], [DateOfBirth], [StatusId]) VALUES (1, N'Novikov', N'Lavrentiy', CAST(N'1987-02-13' AS Date), 3)
INSERT [Client] ([Id], [Name], [SecondName], [DateOfBirth], [StatusId]) VALUES (2, N'Petrov', N'Pavel', CAST(N'2001-06-24' AS Date), 5)
INSERT [Client] ([Id], [Name], [SecondName], [DateOfBirth], [StatusId]) VALUES (3, N'Zuev', N'Akim', CAST(N'1949-09-13' AS Date), 2)
INSERT [Client] ([Id], [Name], [SecondName], [DateOfBirth], [StatusId]) VALUES (6, N'Elena', N'Lazareva', CAST(N'1925-07-29' AS Date), 1)
INSERT [Client] ([Id], [Name], [SecondName], [DateOfBirth], [StatusId]) VALUES (7, N'Polina', N'Chernova', CAST(N'1951-04-02' AS Date), 4)
SET IDENTITY_INSERT [Client] OFF

GO
SET IDENTITY_INSERT [Social Status] ON 
INSERT [Social Status] ([Id], [Name]) VALUES (1, N'Veteran')
INSERT [Social Status] ([Id], [Name]) VALUES (2, N'Disabled')
INSERT [Social Status] ([Id], [Name]) VALUES (3, N'State employee')
INSERT [Social Status] ([Id], [Name]) VALUES (4, N'Pensioner')
INSERT [Social Status] ([Id], [Name]) VALUES (5, N'Student')
SET IDENTITY_INSERT [Social Status] OFF
GO

ALTER TABLE [Account] ADD  CONSTRAINT [UQ_Account_Client_Bank] UNIQUE  
(
	[BankId] ASC,
	[ClientId] ASC
)
GO
ALTER TABLE [Account]  ADD  CONSTRAINT [FK_Account_Bank] FOREIGN KEY([BankId])
REFERENCES [Bank] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Account]  ADD  CONSTRAINT [FK_Account_Client] FOREIGN KEY([ClientId])
REFERENCES [Client] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Branch] ADD  CONSTRAINT [FK_Branch_Bank] FOREIGN KEY([BankId])
REFERENCES [Bank] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Branch]  ADD  CONSTRAINT [FK_Branch_City] FOREIGN KEY([CityId])
REFERENCES [City] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Card] ADD  CONSTRAINT [FK_Card_Account] FOREIGN KEY([AccountId])
REFERENCES [Account] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Client] ADD  CONSTRAINT [FK_Client_Social Status] FOREIGN KEY([StatusId])
REFERENCES [Social Status] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
CREATE PROCEDURE [ReplenishTheBalanceWithTenDollars] 
	@socialId INT
AS
DECLARE @amountOfCardsWithGivenSocialId INT
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * 
				  FROM [Social Status]
				  WHERE Id = @socialId
		)
			BEGIN
				;THROW 99901, '0 associated social statuses with the given social status id already exists',1
			END
		SELECT @amountOfCardsWithGivenSocialId = COUNT(*)
		FROM Account
			JOIN Client ON Client.Id = Account.Id
		WHERE Client.StatusId=@socialId
		IF(@amountOfCardsWithGivenSocialId = 0)
			BEGIN
				; THROW 99902, '0 accounts with given status',1
			END
		UPDATE Account
		SET Balance += 10
		FROM
		(SELECT Account.Id 
		FROM Account 
		JOIN Client ON Client.Id = ClientId
		WHERE Client.StatusId = @socialId
		) as Selected
		WHERE Selected.Id = Account.Id
	END TRY
	BEGIN CATCH
		PRINT 'Error ' + CONVERT(VARCHAR, ERROR_NUMBER()) + ':' + ERROR_MESSAGE()
	END CATCH
END	

GO
CREATE PROCEDURE [TransferFundsFromGivenAccountToGivenCard] 
	@accountId INT,
	@cardId INT,
	@fundsToTrunsfer MONEY
AS
DECLARE @accountBalance MONEY
DECLARE @cardsSummaryBalance MONEY
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
		IF (@fundsToTrunsfer <= 0)
			BEGIN
				;THROW 99904, 'Funds to be transfered must be more than zero',1
			END
		IF NOT EXISTS(SELECT * 
				  FROM Account
				  WHERE Id = @accountId
		)
			BEGIN
				;THROW 99901, '0 associated accounts with the given account id already exists',1
			END
		IF NOT EXISTS(SELECT * 
				  FROM [Card]
				  WHERE Id = @cardId
		)
			BEGIN
				;THROW 99902, '0 associated card with the given card id already exists',1
			END
		IF NOT EXISTS(SELECT * 
				  FROM [Card]
				  WHERE Id = @cardId and AccountId = @accountId
		)
			BEGIN
				;THROW 99903, 'given card is not linked to given account',1
			END
		

		UPDATE [Card]
		SET Balance += @fundsToTrunsfer
		FROM
		(SELECT Card.Id 
		FROM Card 
		WHERE Id = @cardId
		) as Selected
		WHERE Selected.Id = [Card].Id


		SELECT @accountBalance = Balance
		FROM Account
		WHERE Id = @accountId


		SELECT @cardsSummaryBalance = SUM(Balance)
		FROM [Card]
		WHERE AccountId = @accountId


		IF (@accountBalance < @cardsSummaryBalance)
			BEGIN 
				; THROW 99906, 'Insufficient funds on the given account',1
			END

	END TRY
	BEGIN CATCH
		PRINT 'Error ' + CONVERT(VARCHAR, ERROR_NUMBER()) + ':' + ERROR_MESSAGE()
		ROLLBACK TRANSACTION

		RETURN
	END CATCH
	COMMIT TRANSACTION
END	
GO
CREATE TRIGGER Account_update
ON Account
AFTER UPDATE
AS
IF ((SELECT inserted.Balance
	 FROM inserted) >= (SELECT SUM([Card].Balance) 
					    FROM inserted
						JOIN [Card] ON [Card].AccountId = inserted.Id))
RETURN
; THROW 99910, 'Funds on the account cannot be less than on the cards',1
ROLLBACK TRANSACTION
RETURN 
GO
CREATE TRIGGER Cards_update
ON [Card]
AFTER UPDATE
AS

DECLARE @insertedBalance MONEY
DECLARE @insertedCardId INT
DECLARE @insertedCardAccountId INT

SELECT @insertedBalance = Balance,
	   @insertedCardId = Id,
	   @insertedCardAccountId = AccountId
FROM inserted

IF ((SELECT Account.Balance
	 FROM Account
	 WHERE Account.Id = @insertedCardAccountId) >= (SELECT SUM([Card].Balance) 
													FROM [Card]
													WHERE [Card].AccountId = @insertedCardAccountId))
RETURN
; THROW 99910, 'Funds on the account cannot be less than on the cards',1
ROLLBACK TRANSACTION
RETURN 

GO

SELECT Bank.[Name] 
FROM Branch
	JOIN Bank ON BankId = Bank.Id
	JOIN City ON CityId = City.Id
WHERE City.[Name] = 'Gomel'

GO

SELECT Client.[Name],[Card].Balance,Bank.[Name]  
FROM Account
	JOIN [Card] ON [Card].AccountId = Account.Id
	JOIN Client ON Client.Id = ClientId
	JOIN Bank ON Bank.Id = BankId

SELECT DISTINCT Account.Id,
				(Account.Balance - (SELECT SUM(Balance) 
				FROM [Card]
				WHERE AccountId = Account.Id)) as [Difference]
FROM Account
	JOIN [Card] ON [Card].AccountId = Account.Id
WHERE Account.Balance > ((SELECT SUM(Balance) 
						  FROM [Card]
				          WHERE AccountId = Account.Id) )


SELECT [Social Status].[Name],
COUNT([Card].Id) as [Amount of cards]
FROM [Social Status]
	JOIN Client ON Client.StatusId = [Social Status].Id
	JOIN Account ON Account.ClientId = Client.Id
	JOIN [Card] ON [Card].AccountId = Account.Id
GROUP BY [Social Status].[Name]


SELECT  SC.[Name],
	   (SELECT COUNT(*) 
	    FROM [Social Status]
			JOIN Client ON Client.StatusId = [Social Status].Id
			JOIN Account ON Account.ClientId = Client.Id
			JOIN [Card] ON [Card].AccountId = Account.Id 
		WHERE [Social Status].Id = SC.Id) as [Amount of cards]
FROM [Social Status] AS SC


SELECT DISTINCT Account.Balance
FROM [Social Status]
	JOIN Client ON Client.StatusId = 3
	JOIN Account ON Client.Id = Account.ClientId

EXEC [ReplenishTheBalanceWithTenDollars] 3

SELECT DISTINCT Account.Balance
FROM [Social Status]
	JOIN Client ON Client.StatusId = 3
	JOIN Account ON Client.Id = Account.ClientId

SELECT DISTINCT Client.[Name],
				(Account.Balance - (SELECT SUM(Balance) 
				FROM [Card]
				WHERE AccountId = Account.Id)) as [Available funds for transfer]
FROM Account
	JOIN [Card] ON [Card].AccountId = Account.Id
	JOIN Client ON Client.Id = Account.ClientId
WHERE Account.Balance > ((SELECT SUM(Balance) 
						  FROM [Card]
						  WHERE AccountId = Account.Id) )

SELECT DISTINCT *
FROM [Account]
	JOIN [Card] ON [Card].AccountId = 1
WHERE [Account].Id = 1

EXEC TransferFundsFromGivenAccountToGivenCard 1,6,300

SELECT DISTINCT *
FROM [Account]
	JOIN [Card] ON [Card].AccountId = 1
WHERE [Account].Id = 1