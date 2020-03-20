
--建立資料表「訂單」、「訂單明細」、「客戶」、「產品」，規格詳如正規化練習，並建立其關聯性
CREATE DATABASE MYDB
GO

USE MYDB
GO

--建立資料表
USE MYDB
GO

--建立資料表
CREATE TABLE 訂單(
	訂單序號 int primary key,
訂貨日期 datetime,
送貨日期 datetime,
客戶代號 int,
訂購產品代號 nvarchar,
訂購數量為  int,
訂購單價為 int
)
go

drop table 訂單
go

CREATE TABLE 訂單明細(
	訂單序號 int primary key,
訂貨日期 datetime,
送貨日期 datetime,
客戶代號 int,
訂購產品代號 nvarchar,
訂購數量為  int,
訂購單價為 int
)
go

drop table 訂單明細
go
--建立計算欄位
CREATE TABLE 產品(
	訂單編號  int identity not null ,
	下單日期  datetime not null ,
	客戶  int,	
	原價      smallmoney,
	折扣      decimal(2,2),
	優惠價  AS  原價*折扣
)
go
--依正規化練習(EXCEL檔)輸入資料


--請將客戶地址的長度增加到100
--建立資料表條件限制
--1.Primary Key
drop table 客戶
CREATE TABLE dbo.[客戶](
   客戶編號  int not null,
   身份證字號  char(10) not null,  
   年齡  tinyint ,
   地址  varchar(100),
   電話  char(12)
)
go
alter table 客戶 add  constraint [PK_客編_身份證號] primary key (客戶編號,身份證字號)
alter table 客戶 drop  constraint [PK_客編_身份證號] 


--2. NULL 、 NOT NULL
drop table 客戶

CREATE TABLE 客戶
(  客戶編號  int NOT NULL,
   身份證字號  char(10) NOT NULL,
   年齡  tinyint NULL,
   地址  varchar(100),
   電話  char(12),   
   CONSTRAINT [PK_客戶編號] PRIMARY KEY (客戶編號)  ) 
 go
--在資料表-訂單明細中新增單價(int)與小計(單價*數量)欄位，單價為必填欄位，且預設值為0

SELECT * FROM 客戶
SELECT * FROM 訂單
UPDATE 客戶 SET 客戶編號=4 WHERE 客戶編號=3
SELECT * FROM 客戶
go
--請將訂單資料表中訂貨日期欄位設計為必填欄位且自動取系統日期


--請將訂單資料表中送貨日期欄位設計為不可填入過去的日期



/*
加入一筆訂單資料
訂單序號:6
訂貨日期:2020/1/1
送貨日期:2020/2/2
客戶代號:C03
訂購產品代號為: P01，P03
訂購數量為: 3,5
訂購單價為:1500,5500
*/


INSERT [訂單] VALUES (6,'2020/1/1','2020/2/2'C03,P01，P03,3,5)

go


--將訂單序號1的送貨日期變更為2020-5-1




--刪除訂單序號6的資料
