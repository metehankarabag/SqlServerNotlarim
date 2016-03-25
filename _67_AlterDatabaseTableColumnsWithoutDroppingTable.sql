/*Bu derste veri tabanını silmeden güncellemeyi görecekmişiz.

--> Cinsiyete göre maaş dağalımını göstermişiz. Fakat sorgu çalıştığında hata verecek çünkü salary sütununun türü nvarchar(). değiştrebiliriz.
-->Object Explorer'da Tabloya sağ tıklayıp Desing'ı kullanarak. türü değiştirebiliriz fakat tabloyu silip yeniden kurmamızı gerektiren uzun bir uyarı veriyor. Bu durumda tablodaki veriler silinir. Daha önce bir milyon kez yaptığımız gibi Atler ile yapabiliriz. Fakat bir seçenek daha var-> Tools > Options > Designers > Prevent saving changes that require table re-create checkbox'ındaki tiki kaldırdıktan sonra tabloya sağ tıklayıp Desing'ı açarak yapabiliriz. Tekrar uyarı verir fakat yes diyerek sorunu çözebiliriz.
*/
Create table tblEmployee
(
 ID int primary key identity,
 Name nvarchar(50),
 Gender nvarchar(50),
 Salary nvarchar(50)
)
Insert into tblEmployee values('Sara Nani','Female','4500')
Insert into tblEmployee values('James Histo','Male','5300')
Insert into tblEmployee values('Mary Jane','Female','6200')
Insert into tblEmployee values('Paul Sensit','Male','4200')
Insert into tblEmployee values('Mike Jen','Male','5500')

Select Gender, Sum(Salary) as Total 
from tblEmployee
Group by Gender