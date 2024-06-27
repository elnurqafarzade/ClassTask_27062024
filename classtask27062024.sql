Create Database KontaktHomeDB

Use KontaktHomeDB

Create Table Category
(
Id int identity(1,1) Primary Key,
Name nvarchar(50) not null unique,
)

Create Table Product
(
 Id int identity(1,1) Primary Key,
 Name nvarchar(50) not null unique,
 Price decimal(18,2),
 Description nvarchar(100) not null,
 CategoryId int Foreign Key references Category(Id)
 )


 Create Table Cart
 (
Id int identity(1,1) Primary Key,
CardId int Foreign Key references Product(Id)
 )

 Insert into Category
 Values
 ('Phones'), ('Appliances'), ('Computers')

Insert into Product
Values
('Samsung Galaxy A73', 1100, 'Samsung telefon',1),
('Xiaomi Black Shark', 3200, 'Xiaomi telefon',1),
('Asus Rog Phone', 2100, 'Asus telefon',1),
('Acer Predator Helios', 5500, 'Alma bala yaziqsan',3),
('Gaming Tower Predator Y7', 5500, 'Gaming Tower Personal Computer',3),
('HP Pavilion TP01-2018UR MT', 2700, 'HP Personal Computer',3),
('LG F18L2CRV2T2',3300,'Paltaryuyan',2),
('LG GR-X267CQES',5300,'Soyuducu',2),
('HOFFMANN SOAC-09/XA81P', 1700, 'Kondisioner',2)

Select * From Product
Select * From Category
Select * From Cart

Create Procedure AddToCart @ProdId int 
as
insert into Cart Values
(@ProdId)

Create Procedure DeleteCart @ProdId int
AS
Delete from Product
Where Id = @ProdId

Create Procedure TotalPriceOfCart
as 
select Sum(Price) from Product

