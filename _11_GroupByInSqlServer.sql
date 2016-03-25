/* GROUP BY
Group by bir tablo sütununun ayný deðerleri içeren satýrlarýný deðer adý altýnda gruplama iþini yapar ve kullanýlan sorgu gruplanmýþ satýrlar üzerinde çalýþýr. Group by Aggregate Function'lar ile birlikte kullanýlýr -> sum(), count(), min()...

select City, SUM(Salary) as TotalSalary
from tblPersonel
Group By City -- Grup yaptý city ile maaþý

Bir sütundaki deðere göre bazý satýrlarý gruplama iþlemine almayý istemiyorsak, Where kullanabiliriz. Where Group By'dan önce yazýdýr. Ayný iþi Having kullanarak da yapabiliriz fakat Having Group By'dan sonra yazýlýr
Farklarý
1. Where kullanýrken tablodan koþula uyan tüm satýrlar alýnýr ve gruplama yapýlýr.
	Having kullanýrken Tablodaki tüm satýrlar gruplanýr ve gruplarýn koþula uyan satýrlarý iþleme girer.
2. Where tüm sorgular ile çalýþýr, Having sadece Select ile çalýþýr.
3. Where'e Aggregate Function veremeyiz fakat Having'e verebiliriz.


Not: GROUP BY'a birden fazla sütun verebiliriz. Bu durumda Distinct gibi belirlediðimiz gruba girecek satýrlarýn 2 sütun deðerininde beklendiði gibi olmasý gerekir.
Not: Sütunlarýn sorguya eklenme sýrasý ile GRUOP BY sýrasý ayný olmalý. Veri türleri farklý deðilse hata varmez ama yanlýþ sonuç çýkar.

COUNT(): parametre olarak bir sütun verip satýr sayýsýný alabiliriz.
Order By: Group By ile birlikte kullanýldýðýnda, Group By'dan sonra yazýlýr ve sýralama Gruplanmýþ sütunlar ile yapýlabilir.

Bir sütuna Aggregate Function uygulayýp sorguya eklersek sorgu sonucu isimsiz bir sütun ile gösterilir. Bu yüzden takma ad vermeliyiz. -> as TakmaAd Takma ad birden fazla kelimeden oluþuyorsa aray boþluk koymak için adý [] içinde yazmalýyýz.

*/


select * from tblPersonel
select SUM (Salary) from tblPersonel

select City,SUM(Salary) as TotalSalary
from tblPersonel
Group By City 

Select count (ID) from	 tblPersonel

select Gender, City, SUM(Salary) as TotalSalary, Count(ID) AS [Total Personel]
from tblPersonel
Group by Gender, City
Order by City

select Gender, City, SUM(Salary) as TotalSalary, Count(ID) AS [Total Personel]
from tblPersonel
where Gender = 'Male'
Group By Gender,City
Having Gender = 'Male'

select Gender, City, SUM(Salary) as TotalSalary, Count(ID) AS [Total Personel]
from tblPersonel
Group By Gender,City
HAVÝNG SUM(Salary) >5000 kullanýlabilir -- bu olur

Select * from tblPersonel where SUM (Salary) > 4000 --bu olmaz