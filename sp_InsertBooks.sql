create procedure sp_InsertBook
(
@BName nvarchar(MAX),
@BPrice money,
@BSellingPrice money,
@BAuthor int,
@BEdition int,
@BCategory int,
@BSubCategory int,
@BLanguage int,
@BDescription nvarchar(MAX),
@BBookDetails nvarchar(MAX),
@FreeDelivery int,
@7DayReturn int,
@COD int
)
as
insert into tblBooks values (@BName,@BPrice,@BSellingPrice,@BAuthor,@BEdition,@BCategory,@BSubCategory,
@BLanguage,@BDescription,@BBookDetails,@FreeDelivery,@7DayReturn,@COD)
select SCOPE_IDENTITY()
return 0