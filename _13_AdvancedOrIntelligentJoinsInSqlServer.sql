/*Join'ler oluþturulacak tabloya koþula uyan satýrlarý her zaman ekler. Bu derste bu satýrlarý çýkartarak sadece eþleþmeyen satýrlar ile tablo oluþturacaðýz.
Left Join: Oluþturulacak tablo sadece sol tablonun eþleþmeyen satýrlarýndan oluþacak. Eþleþmenin saðlanamamasý için sol tablodaki karþýlaþtýrma sütunundaki deðerin Null yada geçersiz olmasý gerekir. Bu iþi Where'e 2 farklý koþul vererek yapabiliriz. 
1. sol tablodaki karþýlaþtýrma sütunun deðeri Null'sa diyebiliriz. Fakat geçersiz deðer alan sütunlarý sonuca eklenmez.
2. Eþleþme saðlanmadýðýnda oluþturulacak satýrýn sað tablo sütunlarý Null deðeri alacaðýný söylemiþtik. Yani satýrýn herhangi bir sað sütunu Null'sa kesinlikle bu satýr eþleþmeyen sol tablo satýrdýr.

Right Join: Üstdeki ile ayný mantýk.
Full Join: Bu durumda almayý istediðimiz satýrlarýn ya sað sütunlarýnýn yada sol sütunlarýnýn boþ olmasý gerekir. Where'e or ile kullanarak yapabiliriz.

Not: Karþýlaþtýrma sütunun Primary Key gibi Null olamayacak bir sütun ise 1. yol iþe yaramaz. Fakat karþý tablodan hiç bir deðer alýnmadýðý için 2. yol her zaman iþe yarar.
*/

Select * from tblPersonel
Select * from tblDepartment

select		Name,Gender,Salary,DepartmentName
from		tblPersonel
Left join	tblDepartment
on			tblPersonel.DepartmentID = tblDepartment.ID
WHERE		tblPersonel.DepartmentID is NULL
--Where		tblDepartment.ID ÝS NULL

select		Name,Gender,Salary,DepartmentName
from		tblPersonel
RIGHT join	tblDepartment
on			tblPersonel.DepartmentID = tblDepartment.ID
where		tblDepartment.ID = 4
--WHERE		tblPersonel.DepartmentID is NULL

select		Name,Gender,Salary,DepartmentName
from		tblPersonel
FULL join	tblDepartment
on			tblPersonel.DepartmentID = tblDepartment.ID
WHERE		tblPersonel.DepartmentID is NULL
or			tblDepartment.ID iS NULL
