/*SELF JOIN: Sol ve sağ tablonun aynı tablo olması durumuna nedir.
Bir tabloyu bir sorguda 2 kez kullanabilmemiz için Tabloya Alias veriyoruz. Böylece tabloyu aynı tabloyu 2 farklı isim ile farklı tablolarmış gibi kullanabiliyoruz.
*/
select		E.Name as Employee,M.Name as Manager
from		tblEmployee E
LEFT JOIN	tblEmployee M
ON			E.ManagerId = M.EmployeeId

