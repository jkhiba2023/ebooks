create  table tblAuthors(
AuthID  int identity(1,1)  primary key,
AuthorName nvarchar(250)
)

create  table tblEdition(
EdID  int identity(1,1)  primary key,
Edition nvarchar(100)
)

create table tblCategory
(
CatID int identity(1,1) primary key,
CatName nvarchar(MAX)
)

create table tblSubCategory
(
SubCatID int identity(1,1) primary key,
SubCatName nvarchar(MAX),
MainCatID int null,
Constraint [FK_tblSubCategory_tblCategory] FOREIGN KEY ([MainCatID]) REFERENCES [tblCategory] ([CatID])
)

create table tblLanguage
(
LanguageID int identity(1,1) primary key,
LanguageName nvarchar(50),
AuthID   int,
EdID   int,
CatID int,
SubCatID int,
Constraint [FK_tblLanguage_ToAuthor] FOREIGN KEY ([AuthID]) REFERENCES [tblAuthors] ([AuthID]),
Constraint [FK_tblLanguage_ToEdition] FOREIGN KEY ([EdID]) REFERENCES [tblEdition] ([EdID]),
Constraint [FK_tblLanguage_ToCategory] FOREIGN KEY ([CatID]) REFERENCES [tblCategory] ([CatID]),
Constraint [FK_tblLanguage_ToSubCategory] FOREIGN KEY ([SubCatID]) REFERENCES [tblSubCategory] ([SubCatID])
)

create table tblBooks
(
BID int identity(1,1) primary key,
BName nvarchar(MAX),
BPrice money,
BSellingPrice Money,
BAuthor int,
BEdition int,
BCategory int,
BSubCategory int,
BLanguage int,
BDescription nvarchar(MAX),
BBookDetails nvarchar(MAX),
FreeDelivery int,
[7DayReturn] int,
COD int,
Constraint [FK_tblBooks_ToAuthor] FOREIGN KEY ([BAuthor]) REFERENCES [tblAuthors] ([AuthID]),
Constraint [FK_tblBooks_ToEdition] FOREIGN KEY ([BEdition]) REFERENCES [tblEdition] ([EdID]),
Constraint [FK_tblBooks_ToCategory] FOREIGN KEY ([BCategory]) REFERENCES [tblCategory] ([CatID]),
Constraint [FK_tblBooks_ToSubCategory] FOREIGN KEY ([BSubCategory]) REFERENCES [tblSubCategory] ([SubCatID]),
Constraint [FK_tblBooks_ToLanguage] FOREIGN KEY ([BLanguage]) REFERENCES [tblLanguage] ([LanguageID]),
)

create table tblBooksImages
(
BIMGID int identity(1,1) primary key,
BID  int,
Name nvarchar(MAX),
Extention nvarchar(500),
Constraint [FK_tblBooksImages_ToBook] FOREIGN KEY ([BID]) REFERENCES [tblBooks] ([BID])
)

create table tblBookQuantity
(
BQuantityID int identity(1,1) primary key,
BID int,
BLanguage int,
BQuantity int,
Constraint [FK_tblBookQuantity_ToBookInfo] FOREIGN KEY ([BID]) REFERENCES [tblBooks] ([BID]),
Constraint [FK_tblBookQuantity_ToBookLang] FOREIGN KEY ([BLanguage]) REFERENCES [tblLanguage] ([LanguageID])
)