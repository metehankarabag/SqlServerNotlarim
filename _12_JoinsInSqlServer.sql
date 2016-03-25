/*Join
Belirlediðimiz bir koþula göre farklý 2 tablonun satýrlarýný eþleþtirilir ve eþleþtirilen satýrlarý birleþtirerek tek bir satýr halinde oluþturulacak tabloya eklenir.
Join Types
Join: 2 tablodan da sadece eþleþen satýrlarý alarak tablo oluþturulur.
Left Join: Tablo, 2 tabloda da eþleþen satýrlar + sol tablonun eþleþmeyen satýrlarýndan oluþur.
Right Join: Tablo, 2 tabloda da eþleþen satýrlar + sað tablonun eþleþmeyen satýrlarýndan oluþur.
Full Join: koþulu saðlayan satýrlar birleþtirilerek ve koþulu saðlamasada sol ve sað tablo satýrlarý eklenir.
Cross Join: On Key Word'ü kullanýlmaz. Yani sol tablodaki satýrlarý hepsi sýrayla sað tablodaki tüm satýrlar ile eþleþtirilir. Yani sol tabloda 10 sað tabloda 4 satýr varsa 40 satýr sonuç çýkar

Önemli Not: Oluþturulacak tablo hem sol hemde sað tablonun sütunlarýný içerir. Left Table'ýn eþleþmeyen satýrý sað tabloda karþýlýðý olmayan satýrdýr. Bu satýrý oluþturulacak tabloya ekliyorsak, sað tablonun herhangi bir satýrýnda deðer gelmediði için oluþturulacak satýrýn sað sütunlarýndaki tüm deðerler Null olur.(Aynsý Right Table içinde geçerli)
*/
--Yazým
select		ColumnList -- Anatablodan ve Eklenen tablodan görmek istediðimiz sütunlarý yazýyoruz
from		LeftTable  -- Ana tabloyu belirliyoruz
joinType	RightTable -- Eklenecek tabloyu belirtiyoruz
on			JoinCondition -- Tablolarda eþleþmenin hangi ütunlarada aranacaðýný belirtiyoruz.
--select ColumnList  from LeftTable join RightTable on JoinCondition 
--					 Join''in solu        saðý
select * FROM tblPersonel
select * FROM tblDepartment

--JOIN
select Name,Gender,Salary,DepartmentName
from tblPersonel
Join tblDepartment
On tblPersonel.DepartmentID = tblDepartment.ID

--LEFT JOIN/LEFT OUTER
select Name,Gender,Salary,DepartmentName
from tblPersonel
LEFT JOIN tblDepartment
On tblPersonel.DepartmentID = tblDepartment.ID

--RIGHT JOIN/RIGHT OUTER
select Name,Gender,Salary,DepartmentName
from tblPersonel
RIGHT JOIN tblDepartment 
On tblPersonel.DepartmentID = tblDepartment.ID

--FULL JOIN/FULL OUTER
select Name,Gender,Salary,DepartmentName
from tblPersonel
FULL JOIN tblDepartment
On tblPersonel.DepartmentID = tblDepartment.ID

--CROSS JOIN
select Name,Gender,Salary,DepartmentName
from tblPersonel
CROSS JOIN tblDepartment

