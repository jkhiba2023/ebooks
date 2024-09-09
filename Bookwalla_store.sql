CREATE TABLE Users(
Uid int identity (1,1) Primary key not null,
Username nvarchar(100) Null,
Password nvarchar(100) Null,
Email nvarchar(50) Null,
Name nvarchar(100) Null,
)