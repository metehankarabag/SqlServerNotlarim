/*DEFAULT CONSTRAINT
Eklendiği tablonun belirlenen sütununda değer girilmediğinde varsayılan değeri atama işini yapar. Geçerli olmasa bile herhangi bir değer girilirse çalışmaz.(örneğin Null)
Bütün Constraint'lerin yazım şekli hemen hemen aynı.

alter table 'TabloAdı' -> Constraint'in ekleceneği tablo
add constraint 'Constraınt türü_Tabloadı_sütun adı' -> Constraint Adı --> 
default DefaultValue
For 'Tablo sütun adı' -> Constraint'in uygulacağı sütun

Not: Aynı anda mevcut tabloya hem ekleyip hemde bu sütuna Consratin uygulayabiliriz. Bu yapmak için Add anahtarından sonra normal sütun ekler gibi ekleyip devam edebiliriz.

ADD { COLUMN_NAME } { DATA_TYPE } { NULL | NOT NULL } CONSTRAINT...
*/
select * from tblGender
select * from tblPerson

insert into tblPerson(ID,Name,Email) values (7,'Rich','r@r.com')
insert into tblPerson(ID,Name,Email) values (8,'Mike','mike@mike.com')
insert into tblPerson(ID,Name,Email,GenderID) values (9,'sara','sara@sara.com',1)
insert into tblPerson(ID,Name,Email,GenderID) values (10,'Jhonny','j@r.com',NULL)

alter table tblPerson
add constraint DF_tblPerson_GenderId
default 3 For GenderID



alter table tblPerson
Drop DF_tblPerson_GenderId
