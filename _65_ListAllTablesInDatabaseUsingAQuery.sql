/*T-SQL kullanarak tüm tabloları listeleme
Bir veri tabanında bulunan tüm Sql Server nesnelerini görmek için Object Explorer'ı kullanabiliriz. Fakat aynı işi sorgularlada yapabiliriz.  Sistem görünümü veren 3 anahtar var.
1. SysObjects: Sql Server 200,2005, ve 2008'de çalışır.
2. Sys.Tables: Sql Server 2005 ve 2008'de çalışır.
3. Information_Schema.Tables: Sql Server 2005 ve 2008'de çalışır.

1. SysObjects: Bir tablo döner ve bu tablonun sütunları kullanarak veri tabanındaki belirli Sql Server nesnelerini(Tablo,Procedure..) alabiliriz.
XType: Sütunun nesnelerin Type'ının gösterildiği sütundur ve buradaki değerlere göre istediğimiz nesneyi alabiliriz.
Bu sütundaki değerlerin bazıları.
IT: Internal Table
P: Stored Procedure
PK: Primary Key Constraint
S: System Table 
SQ: Service Queue
U - User Table
V - View
Tüm değerler için MSDN linki
http://msdn.microsoft.com/en-us/library/ms177596.aspx 
*/


Select * from SYSOBJECTS where XTYPE='U' --> kullanıcının oluşturduğu tüm tabloları döner.
Select * from  SYS.TABLES --> Bu tüm tabloları döner. Tables Property gibi kullanılmış tüm türleri böyle kullanabiliriz.

Select * from INFORMATION_SCHEMA.TABLES --Hem View hemde Tabloları döner -- ROUTINES STORED PROCEDURE ve FUNCTİON ları döner.

Select Distinct XTYPE from SYSOBJECTS --> kaç farkı tür nesne kullanıldığını anlayabiliriz.
--özetle bu sorgu sonuçlarına göre eleme yapabiliriz.