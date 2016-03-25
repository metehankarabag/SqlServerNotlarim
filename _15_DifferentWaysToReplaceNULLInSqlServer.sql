/*IsNull(): 1. parametre olarak aldýðý Filed Null ise, 2. parametresindeki deðeri dönderilir, deðiþse birinci parametredeki deðer dönderilir. Yani Null durumlarýn varsayýlan deðerini belirliyoruz.
--> 16.Ders
COALESCE(): isNull ile ayný mantýkla çalýþýyor fakat daha güçlü.  Çünkü daha fazla paramatre girebiliriz. 1. parametre boþsa 2. ye bakar 2. boþþa 3. ye bakar oda boþþa bir mesaj yazdýrabiliriz.
coalesce(FistName,MiddleName,LastName)

Case When Expression  Then 'true iken' else 'false iken'
*/

select * from tblEmployee

select		E.Name AS EMPLOYEE,M.Name AS MANAGER
from		tblEmployee E
Left JOIN	tblEmployee M
ON			E.ManagerId=M.EmployeeId

                               COALESCE('PRAGÝM','NO MANAGER')
select		E.Name AS EMPLOYEE,ISNULL(M.Name,'NO MANAGER')AS MANAGER
from		tblEmployee E
Left JOIN	tblEmployee M
ON			E.ManagerId=M.EmployeeId

--CASE WHEN Expression THEN '' ELSE '' END
                                --Manager name null ise||o zaman Manager yok||Deðilse manager var
select		E.Name AS EMPLOYEE, CASE WHEN M.Name IS NULL THEN 'NO MANAGER' ELSE M.Name END AS MANAGER
from		tblEmployee E
Left JOIN	tblEmployee M
ON			E.ManagerId=M.EmployeeId