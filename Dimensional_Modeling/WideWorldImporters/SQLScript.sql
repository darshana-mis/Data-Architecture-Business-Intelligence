USE [WideWorldImportersNew]

go


-- Drop Constraint, Rename and Create Table SQL

CREATE TABLE dbo.Dim_Customer
(
    CustomerId   int          IDENTITY(1,1),
    GeoId        int          NULL,
    CustomerSK   int          NOT NULL,
    EmployeeId   int          NULL,
    FirstName    nvarchar(40) NOT NULL,
    LastName     nvarchar(20) NOT NULL,
    Company      nvarchar(80) NULL,
    Phone        nvarchar(24) NULL,
    Fax          nvarchar(24) NULL,
    Email        nvarchar(60) NOT NULL,
    IsCurrent    varchar(10)  NOT NULL,
    StartDate    date         NOT NULL,
    EndDate      date         NOT NULL,
    Created_Date datetime     NULL,
    Created_By   char(10)     NULL,
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


CREATE TABLE dbo.Dim_Employee
(
    EmployeeId   int          IDENTITY(1,1),
    EmployeeSK   int          NOT NULL,
    CustomerId   int          NULL,
    FirstName    nvarchar(20) NOT NULL,
    LastName     nvarchar(20) NOT NULL,
    Title        nvarchar(30) NULL,
    BirthDate    datetime     NULL,
    HireDate     datetime     NULL,
    Phone        nvarchar(24) NULL,
    Fax          nvarchar(24) NULL,
    Email        nvarchar(60) NULL,
    IsCurrent    varchar(10)  NOT NULL,
    Created_Date datetime     NULL,
    Created_By   char(10)     NULL,
    CONSTRAINT PrimaryKey3_Employee
    PRIMARY KEY NONCLUSTERED (EmployeeId)
)
go
IF OBJECT_ID(N'dbo.Dim_Employee') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Dim_Employee >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Dim_Employee >>>'
go


CREATE TABLE dbo.Dim_Geo
(
    GeoId        int          IDENTITY(1,1),
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


CREATE TABLE dbo.Dim_Product
(
    ProductId          int          IDENTITY(1,1),
    ProductSK          int          NOT NULL,
    ProductName        varchar(100) NULL,
    ProductDescription varchar(100) NULL,
    UnitPrice          int          NOT NULL,
    StartDate          date         NOT NULL,
    EndDate            date         NOT NULL,
    WarehouseDate      date         NOT NULL,
    IsCurrent          varchar(10)  NOT NULL,
    Created_Date       datetime     NULL,
    Created_By         char(10)     NULL,
    CONSTRAINT PrimaryKey1_Product
    PRIMARY KEY NONCLUSTERED (ProductId)
)
go
IF OBJECT_ID(N'dbo.Dim_Product') IS NOT NULL
    PRINT N'<<< CREATED TABLE dbo.Dim_Product >>>'
ELSE
    PRINT N'<<< FAILED CREATING TABLE dbo.Dim_Product >>>'
go


CREATE TABLE dbo.Fact_Sales
(
    SalesId          int          IDENTITY(1,1),
    ProductId        int          NOT NULL,
    EmployeeId       int          NOT NULL,
    DateKey          int          NOT NULL,
    CustomerId       int          NOT NULL,
    SalesOrderNumber varchar(100) NULL,
    SalesQuantity    varchar(100) NULL,
    UnitPrice        int          NOT NULL,
    ExtendedPriice   int          NOT NULL,
    TaxAmount        int          NOT NULL,
    ShippingCost     int          NOT NULL,
    TotalAmount      int          NOT NULL,
    Created_Date     datetime     NULL,
    Created_By       char(10)     NULL,
    CONSTRAINT PrimaryKey_Sales
    PRIMARY KEY NONCLUSTERED (SalesId,ProductId,EmployeeId,DateKey,CustomerId)
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
    FOREIGN KEY (GeoId)
    REFERENCES dbo.Dim_Geo (GeoId)
go


ALTER TABLE dbo.Fact_Sales
    ADD 
    FOREIGN KEY (ProductId)
    REFERENCES dbo.Dim_Product (ProductId)
go
