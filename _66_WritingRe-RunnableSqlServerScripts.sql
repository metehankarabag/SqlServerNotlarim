/*Re-Runnable Sql Scripts: birden fazla kez hata vermeden çalışabilecek bir sorguya denir.

To make this script re-runnable
1. Check for the existence of the table
2. Create the table if it does not exist
3. Else print a message stating, the table already exists

OBJECT_ID(): method parametre olarak aldığı string ile eşleşen bir nesne arar. Varsa nesneyi döner(tahminim) yoksa Null döner.

INFORMATION_SCHEMA.COLUMNS: Bir tablonun sütunun kontrol edebiliriz. Bu KeyWord veri tabanındaki tüm tabloların sütunlarını döner bu yüzen Where ile eleme yapmamız gerekiyor.
if not exists(Select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME='EmailAddress' and TABLE_NAME = 'tblEmployee' and TABLE_SCHEMA='dbo') 
Not: Sql Server bir den fazla Schema kullanıyorsa Table_Schema'ı Where ekliyoruz. Yoksa gerek yok.

Col_length(): methodunda bir tablonun bir sütnunu alır. 2 parametrelidir. 1. parametre tabloyu 2. parametre alınacak sütunu belirler.
*/

USE [Sample]
Create table tblEmployee
(
 ID int identity primary key,
 Name nvarchar(100),
 Gender nvarchar(10),
 DateOfBirth DateTime
) 

Use [Sample]
If not exists (select * from information_schema.tables where table_name = 'tblEmployee') --> Tablo varlığını kontrol ediyoruz.
Begin--> yoksa oluş türüyoruz.
 Create table tblEmployee
 (
  ID int identity primary key,
  Name nvarchar(100),
  Gender nvarchar(10),
  DateOfBirth DateTime
 )
 Print 'Table tblEmployee successfully created'
End
Else--> Varsa var olduğunu gösteriyoruz. ata vermiyoruz.
Begin
 Print 'Table tblEmployee already exists'
End

------
IF OBJECT_ID('tblEmployee') IS NULL --> Method nesne varsa nesneyi döner yoksa Null döner. Üstteki ile aynı mantık
Begin
   -- Create Table Script
   Print 'Table tblEmployee created'
End
Else
Begin
   Print 'Table tblEmployee already exists'
End

Use [Sample]
IF OBJECT_ID('tblEmployee') IS NOT NULL --> Üstekinin dersi.
Begin
 Drop Table tblEmployee
End
Create table tblEmployee
(
 ID int identity primary key,
 Name nvarchar(100),
 Gender nvarchar(10),
 DateOfBirth DateTime
)

Use [Sample]
ALTER TABLE tblEmployee
ADD EmailAddress nvarchar(50) --> Bu sorgu Tabloye EmailAddress sütunu ekler. 2. kez çalıştırdığımızda hata verir.

-- To make this script re-runnable, check for the column existence
Use [Sample]
if not exists(Select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME='EmailAddress' and TABLE_NAME = 'tblEmployee' and TABLE_SCHEMA='dbo')  -->Sütun varlığını kontrol ediyoruz. Aynı mantık.
Begin
 ALTER TABLE tblEmployee
 ADD EmailAddress nvarchar(50)
End
Else
BEgin
 Print 'Column EmailAddress already exists'
End
--------------------
--Col_length() Bu methodu kullanarak üstteki işin aynısını yapabiliriz.
If col_length('tblEmployee','EmailAddress') is not null
Begin
 Print 'Column already exists'
End
Else
Begin
 Print 'Column does not exist'
End 
