USE [MovieRental]

go


-- Drop Constraint, Rename and Create Table SQL

CREATE TABLE dbo.Dim_Customer
(
    CustomerId   int          IDENTITY(1,1),
    RentalId     int          NULL,
    PaymentId    int          NULL,
    CustomerSK   int          NOT NULL,
    StaffId      int          NULL,
    FirstName    nvarchar(40) NOT NULL,
    LastName     nvarchar(20) NOT NULL,
    Phone        nvarchar(24) NULL,
    Fax          nvarchar(24) NULL,
    Email        nvarchar(60) NOT NULL,
    OnboardDate  date         NOT NULL,
    IsCurrent    varchar(10)  NOT NULL,
    StartDate    date         NOT NULL,
    EndDate      date         NOT NULL,
    Created_Date datetime     NULL,
    Created_By   char(10)     NULL,
    GeoId        int          NOT NULL,
    CONSTRAINT PrimaryKey5_Customer
    PRIMARY KEY NONCLUSTERED (CustomerId)
)
go
IF OBJECT_ID(N'dbo.Dim_Customer') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Dim_Customer >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Dim_Customer >>>'
go


CREATE TABLE dbo.Dim_Date
(
    DateKey      int      IDENTITY(1,1),
    DateSK       int      NOT NULL,
    [Date]       date     NOT NULL,
    [Day]        char(10) NOT NULL,
    [Month]      char(10) NOT NULL,
    Season       char(10) NULL,
    Quarter      char(10) NOT NULL,
    [Year]       char(10) NOT NULL,
    WeekOfYear   char(10) NOT NULL,
    IsHoliday    char(10) NOT NULL,
    Created_Date datetime NULL,
    Created_By   char(10) NULL,
    CONSTRAINT PrimaryKey2_Date
    PRIMARY KEY NONCLUSTERED (DateKey)
)
go
IF OBJECT_ID(N'dbo.Dim_Date') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Dim_Date >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Dim_Date >>>'
go


CREATE TABLE dbo.Dim_Geo
(
    GeoId        int          IDENTITY(1,1),
    GeoSK        int          NOT NULL,
    Address      char(10)     NULL,
    City         char(10)     NULL,
    State        char(10)     NULL,
    Country      varchar(100) NOT NULL,
    ZipCode      char(10)     NULL,
    StartDate    date         NOT NULL,
    EndDate      date         NOT NULL,
    IsCurrent    char(10)     NOT NULL,
    Created_Date datetime     NULL,
    Created_By   char(10)     NULL,
    CONSTRAINT PrimaryKey4_Geo
    PRIMARY KEY NONCLUSTERED (GeoId)
)
go
IF OBJECT_ID(N'dbo.Dim_Geo') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Dim_Geo >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Dim_Geo >>>'
go


CREATE TABLE dbo.Dim_Movie
(
    MovieId      int         IDENTITY(1,1),
    MovieSK      int         NOT NULL,
    MovieTitle   varchar(10) NOT NULL,
    Genre        varchar(10) NOT NULL,
    ReleaseYear  date        NOT NULL,
    IsCurrent    varchar(10) NOT NULL,
    StartDate    date        NOT NULL,
    EndDate      date        NOT NULL,
    Created_Date datetime    NULL,
    Created_By   char(10)    NULL,
    CONSTRAINT PrimaryKey5_Customer_1
    PRIMARY KEY NONCLUSTERED (MovieId)
)
go
IF OBJECT_ID(N'dbo.Dim_Movie') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Dim_Movie >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Dim_Movie >>>'
go


CREATE TABLE dbo.Dim_Staff
(
    StaffId      int          IDENTITY(1,1),
    RentalId     int          NULL,
    PaymentId    int          NULL,
    StaffSK      int          NOT NULL,
    CustomerId   int          NULL,
    GeoId        int          NOT NULL,
    FirstName    nvarchar(20) NOT NULL,
    LastName     nvarchar(20) NOT NULL,
    Title        nvarchar(30) NULL,
    HireDate     datetime     NULL,
    Phone        nvarchar(24) NULL,
    Fax          nvarchar(24) NULL,
    Email        nvarchar(60) NULL,
    IsCurrent    varchar(10)  NOT NULL,
    Created_Date datetime     NULL,
    Created_By   char(10)     NULL,
    CONSTRAINT PrimaryKey3_Employee
    PRIMARY KEY NONCLUSTERED (StaffId)
)
go
IF OBJECT_ID(N'dbo.Dim_Staff') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Dim_Staff >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Dim_Staff >>>'
go


CREATE TABLE dbo.Dim_Store
(
    StoreId      int         IDENTITY(1,1),
    StoreSK      int         NOT NULL,
    GeoId        int         NOT NULL,
    StoreName    varchar(10) NOT NULL,
    IsCurrent    varchar(10) NOT NULL,
    StartDate    date        NOT NULL,
    EndDate      date        NOT NULL,
    Created_Date datetime    NULL,
    Created_By   char(10)    NULL,
    CONSTRAINT PrimaryKey5_Customer_1_1
    PRIMARY KEY NONCLUSTERED (StoreId)
)
go
IF OBJECT_ID(N'dbo.Dim_Store') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Dim_Store >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Dim_Store >>>'
go


CREATE TABLE dbo.Fact_Payment
(
    PaymentId        int          IDENTITY(1,1),
    DateKey          int          NULL,
    RentalId         int          NOT NULL,
    MovieId          int          NOT NULL,
    StaffId          int          NOT NULL,
    CustomerId       int          NOT NULL,
    StoreId          int          NOT NULL,
    SalesOrderNumber varchar(100) NULL,
    PaymentAmount    varchar(18)  NOT NULL,
    PaymentDate      date         NOT NULL,
    PaymentMethod    varchar(10)  NOT NULL,
    Created_Date     datetime     NULL,
    Created_By       char(10)     NULL,
    CONSTRAINT PrimaryKey_Sales_1
    PRIMARY KEY NONCLUSTERED (PaymentId)
)
go
IF OBJECT_ID(N'dbo.Fact_Payment') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Fact_Payment >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Fact_Payment >>>'
go


CREATE TABLE dbo.Fact_Rental
(
    RentalId      int         IDENTITY(1,1),
    PaymentId     int         NOT NULL,
    StoreId       int         NULL,
    MovieId       int         NULL,
    DateKey       int         NULL,
    StaffId       int         NOT NULL,
    CustomerId    int         NOT NULL,
    SalesId       int         NOT NULL,
    RentalDate    date        NOT NULL,
    Revenue       varchar(10) NOT NULL,
    RetalQuantity varchar(10) NOT NULL,
    ReturnDate    date        NOT NULL,
    Created_Date  datetime    NULL,
    Created_By    char(10)    NULL,
    CONSTRAINT PrimaryKey_Sales_1_1
    PRIMARY KEY NONCLUSTERED (RentalId,PaymentId)
)
go
IF OBJECT_ID(N'dbo.Fact_Rental') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Fact_Rental >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Fact_Rental >>>'
go


CREATE TABLE dbo.Fact_Sales
(
    SalesId          int          IDENTITY(1,1),
    PaymentId        int          NOT NULL,
    RentalId         int          NOT NULL,
    GeoId            int          NULL,
    StoreId          int          NULL,
    CustomerId       int          NULL,
    DateKey          int          NULL,
    MovieId          int          NULL,
    StaffId          int          NULL,
    SalesOrderNumber varchar(100) NULL,
    SalesQuantity    varchar(100) NULL,
    UnitPrice        int          NOT NULL,
    ExtendedPriice   int          NOT NULL,
    TaxAmount        int          NOT NULL,
    TotalAmount      int          NOT NULL,
    TotalRevenue     int          NOT NULL,
    Created_Date     datetime     NULL,
    Created_By       char(10)     NULL,
    CONSTRAINT PrimaryKey_Sales
    PRIMARY KEY NONCLUSTERED (SalesId,PaymentId,RentalId)
)
go
IF OBJECT_ID(N'dbo.Fact_Sales') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Fact_Sales >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Fact_Sales >>>'
go



-- Add Referencing Foreign Keys SQL


ALTER TABLE dbo.Dim_Customer
    ADD 
    FOREIGN KEY (RentalId,PaymentId)
    REFERENCES dbo.Fact_Rental (RentalId,PaymentId)
go


ALTER TABLE dbo.Dim_Staff
    ADD 
    FOREIGN KEY (RentalId,PaymentId)
    REFERENCES dbo.Fact_Rental (RentalId,PaymentId)
go


ALTER TABLE dbo.Fact_Payment
    ADD 
    FOREIGN KEY (DateKey)
    REFERENCES dbo.Dim_Date (DateKey)
go


ALTER TABLE dbo.Fact_Rental
    ADD 
    FOREIGN KEY (PaymentId)
    REFERENCES dbo.Fact_Payment (PaymentId)
go


ALTER TABLE dbo.Fact_Sales
    ADD 
    FOREIGN KEY (GeoId)
    REFERENCES dbo.Dim_Geo (GeoId)
go

