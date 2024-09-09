ALTER PROCEDURE BindViewAllBooks
AS
SELECT A.*,B.*, C.AuthorName, A.BPrice-A.BSellingPrice as DisCount,
B.Name as ImageName,
C.AuthorName as AName from tblBooks 
A inner join tblAuthors C on C.AuthID = A.BAuthor
cross apply(
SELECT TOP 1 * FROM tblBooksImages B Where B.BIMGID=A.BID ORDER BY B.BID desc
)B
ORDER BY A.BID desc

Return 0