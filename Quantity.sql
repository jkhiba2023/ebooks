create table tblBookQuantity
(
BQuantityID int identity(1,1) primary key,
BID int,
LanguageID int,
BQuantity int,
Constraint [FK_tblBookQuantity_ToBookInfo] FOREIGN KEY ([BID]) REFERENCES [tblBooks] ([BID]),
Constraint [FK_tblBookQuantity_ToBookLang] FOREIGN KEY ([LanguageID]) REFERENCES [tblLanguage] ([LanguageID])
)