/*UNIQUE CONSTRAÝNT

Primary key her tabloda bir tane olur Unique Constraint birden fazla olabilir.
Primary Key Null'a izin vermez ama Unique Key verebilir.
Tablodaki her satýrýn Email sütunun özel olmasýný istiyorsak Uniqe Key kullanabiliriz.

Eklemesi
alter table tblPerson
add 
Constraint UQ_tblPerson_Age 
unique(Age)



*/
Select * From tblPerson

alter table tblPerson
add Constraint UQ_tblPerson_Age unique(Age)
insert into tblPerson values (2,'xyz','a@a.com',2,20)
Delete from tblPerson

alter table tblPerson
Drop onstraint UQ_tblPerson_Age

