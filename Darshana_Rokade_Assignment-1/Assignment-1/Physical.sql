USE [DAMG7370SU24]

go


-- Drop Referencing Constraints SQL

ALTER TABLE dbo.Track
    DROP CONSTRAINT FK_TrackAlbumId
go


ALTER TABLE dbo.Album
    DROP CONSTRAINT FK_AlbumArtistId
go

ALTER TABLE dbo.Invoice
    DROP CONSTRAINT FK_InvoiceCustomerId
go


ALTER TABLE dbo.Customer
    DROP CONSTRAINT FK_CustomerSupportRepId
go

ALTER TABLE dbo.Employee
    DROP CONSTRAINT FK_EmployeeReportsTo
go

ALTER TABLE dbo.Track
    DROP CONSTRAINT FK_TrackGenreId
go

ALTER TABLE dbo.InvoiceLine
    DROP CONSTRAINT FK_InvoiceLineInvoiceId
go


ALTER TABLE dbo.InvoiceLine
    DROP CONSTRAINT FK_InvoiceLineTrackId
go

ALTER TABLE dbo.Track
    DROP CONSTRAINT FK_TrackMediaTypeId
go

ALTER TABLE dbo.PlaylistTrack
    DROP CONSTRAINT FK_PlaylistTrackPlaylistId
go


ALTER TABLE dbo.PlaylistTrack
    DROP CONSTRAINT FK_PlaylistTrackTrackId
go


-- Drop Other Constraints SQL


ALTER TABLE dbo.Album
    DROP CONSTRAINT PK_Album
go


ALTER TABLE dbo.Artist
    DROP CONSTRAINT PK_Artist
go


ALTER TABLE dbo.Customer
    DROP CONSTRAINT PK_Customer
go


ALTER TABLE dbo.Employee
    DROP CONSTRAINT PK_Employee
go


ALTER TABLE dbo.Genre
    DROP CONSTRAINT PK_Genre
go


ALTER TABLE dbo.Invoice
    DROP CONSTRAINT PK_Invoice
go

ALTER TABLE dbo.InvoiceLine
    DROP CONSTRAINT PK_InvoiceLine
go


ALTER TABLE dbo.MediaType
    DROP CONSTRAINT PK_MediaType
go


ALTER TABLE dbo.Playlist
    DROP CONSTRAINT PK_Playlist
go

ALTER TABLE dbo.PlaylistTrack
    DROP CONSTRAINT PK_PlaylistTrack
go


ALTER TABLE dbo.Track
    DROP CONSTRAINT PK_Track
go


-- Drop Constraint, Rename and Create Table SQL


EXEC sp_rename N'dbo.Album',N'Album_d359bdf1',N'OBJECT'
go
CREATE TABLE dbo.Album
(
    AlbumId    int           IDENTITY(1,1),
    Title      nvarchar(160) NOT NULL,
    ArtistId   int           NOT NULL,
    Created_Dt datetime      NULL,
    Created_By varchar(100)  NULL
)
go
SET IDENTITY_INSERT dbo.Album ON
go
INSERT INTO dbo.Album
( AlbumId,
  Title,
  ArtistId,
  Created_Dt,
  Created_By ) 
SELECT
AlbumId,
Title,
ArtistId,
Created_Dt,
Created_By
FROM dbo.Album_d359bdf1
go
SET IDENTITY_INSERT dbo.Album OFF
go
IF OBJECT_ID(N'dbo.Album') IS NOT NULL
DROP TABLE dbo.Album_d359bdf1
ELSE
    EXEC sp_rename N'dbo.Album_d359bdf1',N'Album',N'OBJECT'
go



EXEC sp_rename N'dbo.Artist',N'Artist_6dc82e4c',N'OBJECT'
go
CREATE TABLE dbo.Artist
(
    ArtistId   int           IDENTITY(1,1),
    Name       nvarchar(120) NULL,
    Created_Dt datetime      NULL,
    Created_By varchar(100)  NULL
)
go
SET IDENTITY_INSERT dbo.Artist ON
go
INSERT INTO dbo.Artist
( ArtistId,
  Name,
  Created_Dt,
  Created_By ) 
SELECT
ArtistId,
Name,
Created_Dt,
Created_By
FROM dbo.Artist_6dc82e4c
go
SET IDENTITY_INSERT dbo.Artist OFF
go
IF OBJECT_ID(N'dbo.Artist') IS NOT NULL
DROP TABLE dbo.Artist_6dc82e4c
ELSE
    EXEC sp_rename N'dbo.Artist_6dc82e4c',N'Artist',N'OBJECT'
go



EXEC sp_rename N'dbo.Customer',N'Customer_78e49901',N'OBJECT'
go
CREATE TABLE dbo.Customer
(
    CustomerId   int          IDENTITY(1,1),
    FirstName    nvarchar(40) NOT NULL,
    LastName     nvarchar(20) NOT NULL,
    Company      nvarchar(80) NULL,
    Address      nvarchar(70) NULL,
    City         nvarchar(40) NULL,
    State        nvarchar(40) NULL,
    Country      nvarchar(40) NULL,
    PostalCode   nvarchar(10) NULL,
    Phone        nvarchar(24) NULL,
    Fax          nvarchar(24) NULL,
    Email        nvarchar(60) NOT NULL,
    SupportRepId int          NULL,
    Created_Dt   datetime     NULL,
    Created_By   varchar(100) NULL
)
go
SET IDENTITY_INSERT dbo.Customer ON
go
INSERT INTO dbo.Customer
( CustomerId,
  FirstName,
  LastName,
  Company,
  Address,
  City,
  State,
  Country,
  PostalCode,
  Phone,
  Fax,
  Email,
  SupportRepId,
  Created_Dt,
  Created_By ) 
SELECT
CustomerId,
FirstName,
LastName,
Company,
Address,
City,
State,
Country,
PostalCode,
Phone,
Fax,
Email,
SupportRepId,
Created_Dt,
Created_By
FROM dbo.Customer_78e49901
go
SET IDENTITY_INSERT dbo.Customer OFF
go
IF OBJECT_ID(N'dbo.Customer') IS NOT NULL
DROP TABLE dbo.Customer_78e49901
ELSE
    EXEC sp_rename N'dbo.Customer_78e49901',N'Customer',N'OBJECT'
go



EXEC sp_rename N'dbo.Employee',N'Employee_c1c948e1',N'OBJECT'
go
CREATE TABLE dbo.Employee
(
    EmployeeId int          IDENTITY(1,1),
    LastName   nvarchar(20) NOT NULL,
    FirstName  nvarchar(20) NOT NULL,
    Title      nvarchar(30) NULL,
    ReportsTo  int          NULL,
    BirthDate  datetime     NULL,
    HireDate   datetime     NULL,
    Address    nvarchar(70) NULL,
    City       nvarchar(40) NULL,
    State      nvarchar(40) NULL,
    Country    nvarchar(40) NULL,
    PostalCode nvarchar(10) NULL,
    Phone      nvarchar(24) NULL,
    Fax        nvarchar(24) NULL,
    Email      nvarchar(60) NULL,
    Created_Dt datetime     NULL,
    Created_By varchar(100) NULL
)
go
SET IDENTITY_INSERT dbo.Employee ON
go
INSERT INTO dbo.Employee
( EmployeeId,
  LastName,
  FirstName,
  Title,
  ReportsTo,
  BirthDate,
  HireDate,
  Address,
  City,
  State,
  Country,
  PostalCode,
  Phone,
  Fax,
  Email,
  Created_Dt,
  Created_By ) 
SELECT
EmployeeId,
LastName,
FirstName,
Title,
ReportsTo,
BirthDate,
HireDate,
Address,
City,
State,
Country,
PostalCode,
Phone,
Fax,
Email,
Created_Dt,
Created_By
FROM dbo.Employee_c1c948e1
go
SET IDENTITY_INSERT dbo.Employee OFF
go
IF OBJECT_ID(N'dbo.Employee') IS NOT NULL
DROP TABLE dbo.Employee_c1c948e1
ELSE
    EXEC sp_rename N'dbo.Employee_c1c948e1',N'Employee',N'OBJECT'
go



EXEC sp_rename N'dbo.Genre',N'Genre_37e286e5',N'OBJECT'
go
CREATE TABLE dbo.Genre
(
    GenreId    int           IDENTITY(1,1),
    Name       nvarchar(120) NULL,
    Created_By varchar(100)  NULL,
    Created_Dt datetime      NULL
)
go
SET IDENTITY_INSERT dbo.Genre ON
go
INSERT INTO dbo.Genre
( GenreId,
  Name,
  Created_By,
  Created_Dt ) 
SELECT
GenreId,
Name,
Created_By,
Created_Dt
FROM dbo.Genre_37e286e5
go
SET IDENTITY_INSERT dbo.Genre OFF
go
IF OBJECT_ID(N'dbo.Genre') IS NOT NULL
DROP TABLE dbo.Genre_37e286e5
ELSE
    EXEC sp_rename N'dbo.Genre_37e286e5',N'Genre',N'OBJECT'
go



EXEC sp_rename N'dbo.Invoice',N'Invoice_20db8ab9',N'OBJECT'
go
CREATE TABLE dbo.Invoice
(
    InvoiceId         int           IDENTITY(1,1),
    CustomerId        int           NOT NULL,
    InvoiceDate       datetime      NOT NULL,
    BillingAddress    nvarchar(70)  NULL,
    BillingCity       nvarchar(40)  NULL,
    BillingState      nvarchar(40)  NULL,
    BillingCountry    nvarchar(40)  NULL,
    BillingPostalCode nvarchar(10)  NULL,
    Total             numeric(10,2) NOT NULL,
    Created_Dt        datetime      NULL,
    Created_By        varchar(100)  NULL
)
go
SET IDENTITY_INSERT dbo.Invoice ON
go
INSERT INTO dbo.Invoice
( InvoiceId,
  CustomerId,
  InvoiceDate,
  BillingAddress,
  BillingCity,
  BillingState,
  BillingCountry,
  BillingPostalCode,
  Total,
  Created_Dt,
  Created_By ) 
SELECT
InvoiceId,
CustomerId,
InvoiceDate,
BillingAddress,
BillingCity,
BillingState,
BillingCountry,
BillingPostalCode,
Total,
Created_Dt,
Created_By
FROM dbo.Invoice_20db8ab9
go
SET IDENTITY_INSERT dbo.Invoice OFF
go
IF OBJECT_ID(N'dbo.Invoice') IS NOT NULL
DROP TABLE dbo.Invoice_20db8ab9
ELSE
    EXEC sp_rename N'dbo.Invoice_20db8ab9',N'Invoice',N'OBJECT'
go



EXEC sp_rename N'dbo.InvoiceLine',N'InvoiceLine_dde2ab0f',N'OBJECT'
go
CREATE TABLE dbo.InvoiceLine
(
    InvoiceLineId int           IDENTITY(1,1),
    InvoiceId     int           NOT NULL,
    TrackId       int           NOT NULL,
    UnitPrice     numeric(10,2) NOT NULL,
    Quantity      int           NOT NULL,
    Created_Dt    datetime      NULL,
    Created_By    varchar(100)  NULL
)
go
SET IDENTITY_INSERT dbo.InvoiceLine ON
go
INSERT INTO dbo.InvoiceLine
( InvoiceLineId,
  InvoiceId,
  TrackId,
  UnitPrice,
  Quantity,
  Created_Dt,
  Created_By ) 
SELECT
InvoiceLineId,
InvoiceId,
TrackId,
UnitPrice,
Quantity,
Created_Dt,
Created_By
FROM dbo.InvoiceLine_dde2ab0f
go
SET IDENTITY_INSERT dbo.InvoiceLine OFF
go
IF OBJECT_ID(N'dbo.InvoiceLine') IS NOT NULL
DROP TABLE dbo.InvoiceLine_dde2ab0f
ELSE
    EXEC sp_rename N'dbo.InvoiceLine_dde2ab0f',N'InvoiceLine',N'OBJECT'
go



EXEC sp_rename N'dbo.MediaType',N'MediaType_17605c04',N'OBJECT'
go
CREATE TABLE dbo.MediaType
(
    MediaTypeId int           IDENTITY(1,1),
    Name        nvarchar(120) NULL,
    Created_Dt  datetime      NULL,
    Created_By  varchar(100)  NULL
)
go
SET IDENTITY_INSERT dbo.MediaType ON
go
INSERT INTO dbo.MediaType
( MediaTypeId,
  Name,
  Created_Dt,
  Created_By ) 
SELECT
MediaTypeId,
Name,
Created_Dt,
Created_By
FROM dbo.MediaType_17605c04
go
SET IDENTITY_INSERT dbo.MediaType OFF
go
IF OBJECT_ID(N'dbo.MediaType') IS NOT NULL
DROP TABLE dbo.MediaType_17605c04
ELSE
    EXEC sp_rename N'dbo.MediaType_17605c04',N'MediaType',N'OBJECT'
go



EXEC sp_rename N'dbo.Playlist',N'Playlist_b226d33d',N'OBJECT'
go
CREATE TABLE dbo.Playlist
(
    PlaylistId int           IDENTITY(1,1),
    Name       nvarchar(120) NULL,
    Created_Dt datetime      NULL,
    Created_By varchar(100)  NULL
)
go
SET IDENTITY_INSERT dbo.Playlist ON
go
INSERT INTO dbo.Playlist
( PlaylistId,
  Name,
  Created_Dt,
  Created_By ) 
SELECT
PlaylistId,
Name,
Created_Dt,
Created_By
FROM dbo.Playlist_b226d33d
go
SET IDENTITY_INSERT dbo.Playlist OFF
go
IF OBJECT_ID(N'dbo.Playlist') IS NOT NULL
DROP TABLE dbo.Playlist_b226d33d
ELSE
    EXEC sp_rename N'dbo.Playlist_b226d33d',N'Playlist',N'OBJECT'
go



EXEC sp_rename N'dbo.PlaylistTrack',N'PlaylistTrack_dd240f1a',N'OBJECT'
go
CREATE TABLE dbo.PlaylistTrack
(
    PlaylistId int          NOT NULL,
    TrackId    int          NOT NULL,
    Created_Dt datetime     NULL,
    Created_By varchar(100) NULL
)
go
INSERT INTO dbo.PlaylistTrack
( PlaylistId,
  TrackId,
  Created_Dt,
  Created_By ) 
SELECT
PlaylistId,
TrackId,
Created_Dt,
Created_By
FROM dbo.PlaylistTrack_dd240f1a
go
IF OBJECT_ID(N'dbo.PlaylistTrack') IS NOT NULL
DROP TABLE dbo.PlaylistTrack_dd240f1a
ELSE
    EXEC sp_rename N'dbo.PlaylistTrack_dd240f1a',N'PlaylistTrack',N'OBJECT'
go



EXEC sp_rename N'dbo.Track',N'Track_fc88569d',N'OBJECT'
go
CREATE TABLE dbo.Track
(
    TrackId      int           IDENTITY(1,1),
    Name         nvarchar(200) NOT NULL,
    AlbumId      int           NULL,
    MediaTypeId  int           NOT NULL,
    GenreId      int           NULL,
    Composer     nvarchar(220) NULL,
    Milliseconds int           NOT NULL,
    Bytes        int           NULL,
    UnitPrice    numeric(10,2) NOT NULL,
    Created_Dt   datetime      NULL,
    Created_By   varchar(100)  NULL
)
go
SET IDENTITY_INSERT dbo.Track ON
go
INSERT INTO dbo.Track
( TrackId,
  Name,
  AlbumId,
  MediaTypeId,
  GenreId,
  Composer,
  Milliseconds,
  Bytes,
  UnitPrice,
  Created_Dt,
  Created_By ) 
SELECT
TrackId,
Name,
AlbumId,
MediaTypeId,
GenreId,
Composer,
Milliseconds,
Bytes,
UnitPrice,
Created_Dt,
Created_By
FROM dbo.Track_fc88569d
go
SET IDENTITY_INSERT dbo.Track OFF
go
IF OBJECT_ID(N'dbo.Track') IS NOT NULL
DROP TABLE dbo.Track_fc88569d
ELSE
    EXEC sp_rename N'dbo.Track_fc88569d',N'Track',N'OBJECT'
go



-- Add Constraint SQL


ALTER TABLE dbo.Album
    ADD CONSTRAINT PK_Album
    PRIMARY KEY NONCLUSTERED (AlbumId)
go


ALTER TABLE dbo.Artist
    ADD CONSTRAINT PK_Artist
    PRIMARY KEY NONCLUSTERED (ArtistId)
go


ALTER TABLE dbo.Customer
    ADD CONSTRAINT PK_Customer
    PRIMARY KEY NONCLUSTERED (CustomerId)
go


ALTER TABLE dbo.Employee
    ADD CONSTRAINT PK_Employee
    PRIMARY KEY NONCLUSTERED (EmployeeId)
go


ALTER TABLE dbo.Genre
    ADD CONSTRAINT PK_Genre
    PRIMARY KEY NONCLUSTERED (GenreId)
go


ALTER TABLE dbo.Invoice
    ADD CONSTRAINT PK_Invoice
    PRIMARY KEY NONCLUSTERED (InvoiceId)
go


ALTER TABLE dbo.InvoiceLine
    ADD CONSTRAINT PK_InvoiceLine
    PRIMARY KEY NONCLUSTERED (InvoiceLineId)
go


ALTER TABLE dbo.MediaType
    ADD CONSTRAINT PK_MediaType
    PRIMARY KEY NONCLUSTERED (MediaTypeId)
go


ALTER TABLE dbo.Playlist
    ADD CONSTRAINT PK_Playlist
    PRIMARY KEY NONCLUSTERED (PlaylistId)
go


ALTER TABLE dbo.PlaylistTrack
    ADD CONSTRAINT PK_PlaylistTrack
    PRIMARY KEY NONCLUSTERED (PlaylistId,TrackId)
go


ALTER TABLE dbo.Track
    ADD CONSTRAINT PK_Track
    PRIMARY KEY NONCLUSTERED (TrackId)
go


-- Add Referencing Foreign Keys SQL


ALTER TABLE dbo.Album
    ADD CONSTRAINT FK_AlbumArtistId
    FOREIGN KEY (ArtistId)
    REFERENCES dbo.Artist (ArtistId)
go


ALTER TABLE dbo.Track
    ADD CONSTRAINT FK_TrackAlbumId
    FOREIGN KEY (AlbumId)
    REFERENCES dbo.Album (AlbumId)
go


ALTER TABLE dbo.Customer
    ADD CONSTRAINT FK_CustomerSupportRepId
    FOREIGN KEY (SupportRepId)
    REFERENCES dbo.Employee (EmployeeId)
go


ALTER TABLE dbo.Invoice
    ADD CONSTRAINT FK_InvoiceCustomerId
    FOREIGN KEY (CustomerId)
    REFERENCES dbo.Customer (CustomerId)
go


ALTER TABLE dbo.Employee
    ADD CONSTRAINT FK_EmployeeReportsTo
    FOREIGN KEY (ReportsTo)
    REFERENCES dbo.Employee (EmployeeId)
go


ALTER TABLE dbo.Track
    ADD CONSTRAINT FK_TrackGenreId
    FOREIGN KEY (GenreId)
    REFERENCES dbo.Genre (GenreId)
go


ALTER TABLE dbo.InvoiceLine
    ADD CONSTRAINT FK_InvoiceLineInvoiceId
    FOREIGN KEY (InvoiceId)
    REFERENCES dbo.Invoice (InvoiceId)
go


ALTER TABLE dbo.InvoiceLine
    ADD CONSTRAINT FK_InvoiceLineTrackId
    FOREIGN KEY (TrackId)
    REFERENCES dbo.Track (TrackId)
go


ALTER TABLE dbo.Track
    ADD CONSTRAINT FK_TrackMediaTypeId
    FOREIGN KEY (MediaTypeId)
    REFERENCES dbo.MediaType (MediaTypeId)
go


ALTER TABLE dbo.PlaylistTrack
    ADD CONSTRAINT FK_PlaylistTrackPlaylistId
    FOREIGN KEY (PlaylistId)
    REFERENCES dbo.Playlist (PlaylistId)
go


ALTER TABLE dbo.PlaylistTrack
    ADD CONSTRAINT FK_PlaylistTrackTrackId
    FOREIGN KEY (TrackId)
    REFERENCES dbo.Track (TrackId)
go

