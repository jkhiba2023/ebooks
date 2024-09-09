SELECT TOP (1000) [LanguageID]
      ,[LanguageName]
      ,[AuthID]
      ,[EdID]
      ,[CatID]
      ,[SubCatID]
  FROM [EBOOK].[dbo].[tblLanguage]


  select A.*,B.*,C.*,D.*,E.* from tblLanguage A inner join tblAuthors B on B.AuthID =A.AuthID inner join tblCategory C on C.CatID=A.CatID inner join tblSubCategory D on D.SubCatID = A.SubCatID inner join tblEdition E on E.EdID =A.EdID 