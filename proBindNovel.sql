USE [EBOOK]
GO
/****** Object:  StoredProcedure [dbo].[proBindNovel]    Script Date: 05-08-2024 16:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[proBindNovel]
As
select A.*,B.*,C.AuthorName,A.BPrice-A.BSellingPrice as DisAmount,B.Name as ImageName,C.AuthorName as AName from tblBooks A
inner join tblAuthors C on C.AuthID = A.BAuthor
cross apply(
select top 1 * from tblBooksImages B where B.BID=A.BID order by B.BID desc
)B
order by A.BID desc

Return 0