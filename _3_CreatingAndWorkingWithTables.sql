/*FOREIGN KEY CONSTRAINT
Foreign key 2 tabloyu iliþkilendirir. Bu yüzden References Key olarak da adlandýrýlýr. Yani tablonun bir satýrýný, satýrdaki bir sütun deðerine göre referans tablodaki bir satýr ile iliþkilendirir. Referance tabloda kullanabileceðimiz tek sütun Primary Key sütunudur. Bu tablodaki bir satýr diðer tablodaki sadece bir satýr ile iliþkilendirilebilir. Zaten Foreing Key'in amacý bir birinden baðýmsýz tablolar arasýnda tablo bütünlüðü oluþturmak. Bu yüzden Foreing Key'in uygulandýðý sütuna deðer olarak referans tablonun Primary sütunda olmayan bir deðer girmeye çalýþýrsak hata alýrýz. (Bir tabloyu 2 ye bölmek için de kullanabiliriz. Sonuçda tablo bütünlüðünü korumak için kullanýlýyor.)

Tabloyu oluþtururken Foreign Key ekleme -> Tanýmladýðýmýz bir sütundan sonra Forign Key References Diðer_tablo_adý(Primary Key'i) yazmak yeterlidir.
Tabloyu oluþturduktan sonra Foreign Key ekleme-> Alter ile tabloyu 2. derste gösterlidiði gibi düzenlememiz gerekiyor. 

http://stackoverflow.com/questions/83147/whats-wrong-with-foreign-keys
*/

alter table tblPerson --> Foreign Key'in oluþturulacaðý tablo
add constraint tblPerson_GenderID_FK Foreign key --> Ekleneek Constraint'in adý
(GenderId) --> üstteki tablonun Foreign Key olacak sütunlarý.
references tblGender(ID) --> referansdaki tablonun Primary Key sütunu.


sp_renameDB 'sample1','Sample'
Use [Sample]
Go
Create table tblGender
(
ID int not null primary key,
Gender nvarchar(50) not null
)


