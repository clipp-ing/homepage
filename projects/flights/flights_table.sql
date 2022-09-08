USE flight_delays
GO
SET NOCOUNT ON
GO
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON
GO

/*** Airlines Table ***/ 
CREATE TABLE [dbo].Airlines(
	[code] [nvarchar](10) NOT NULL,
	[description] [nvarchar](150),
	PRIMARY KEY (code)
)
/*** Import from CSV ***/
BULK INSERT Airlines
FROM 'M:\data\flights\airlines_min_quote.csv'
WITH
(
    FIRSTROW = 2, -- ignore header
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)
GO

/*** Airports Table ***/
CREATE TABLE [dbo].Airports(
	[code][nchar](3) NOT NULL,
	[name][nvarchar](200) NOT NULL,
	[city][nvarchar](150),
	[state][nvarchar](15) NOT NULL,
	[country][nvarchar](3) NOT NULL,
	[latitude][decimal](8,6),
	[longtitude][decimal](9,6),
	PRIMARY KEY (code)
)
GO

/*** Import from CSV ***/
BULK INSERT Airports
FROM 'M:\data\flights\airports.csv'
WITH
(
    FIRSTROW = 2, -- ignore header
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
)
GO


/*** Flights Table ***/ 
CREATE TABLE [dbo].Flights(
	[row_id] [int] IDENTITY(0,1) NOT NULL,
	[date] [date] NOT NULL,
	[airline] [nvarchar](10) NOT NULL,
	[flight_number] [smallint] NOT NULL,
	[origin] [nchar](3) NOT NULL,
	[destination] [nchar](3) NOT NULL,
	[dep_delay] [smallint],
	[arr_delay] [smallint],
	[crs_elapsed_time] [smallint],
	[actual_elapsed_time] [smallint],
	[distance][smallint],
	PRIMARY KEY (row_id),
    FOREIGN KEY (airline) REFERENCES Airlines(code),
	FOREIGN KEY (origin) REFERENCES Airports(code),
	FOREIGN KEY (destination) REFERENCES Airports(code)
)
GO

/*** Import from CSV ***/
BULK INSERT Flights
FROM 'M:\data\flights\flight_delays.csv'
WITH
(
    FIRSTROW = 2, -- ignore header
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)
GO