create table tblAuthor
(
AuthorID int identity(1,1) primary key,
Name nvarchar(500)
)

create table tblEdition
(
EdiID int identity(1,1) primary key,
Edi int,
)

create table tblPublisher
(
PubID int identity(1,1) primary key,
PubName nvarchar(MAX),
DetailsID int null,
Constraint [FK_tblPublisher_tblEdition] FOREIGN KEY ([DetailsID]) REFERENCES [tblAuthor]([AuthorID])
)

create table tblLanguage
(
LanguID int identity(1,1) primary key,
LangName nvarchar(500)
)

create table tblLanguage
(
LanguID int identity(1,1) primary key,
LangName nvarchar(500)
)