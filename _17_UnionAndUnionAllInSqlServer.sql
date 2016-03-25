/*UNION VE UNION ALL
Join'ler satýrlarý birleþtirir. Union ve Union All'da tablolarý. Birleþtirme iþleminin yapýlabilmesi için 2 tablonundan alýnan sütunlarý türü,sayýsý, sýrasýnýn ayný olmasý gerekir. Çünkü biri int diðeri nvarchar() olursa ayný sütun'da tutulamaz.

UNION ALL: Ýlk tablonun tüm satýrlarýný alýr ve ikinci tablonun tüm satýrlarýný sonuna ekler.
UNION : 2 tabloyu birleþtirir, birleþtirilmiþ satýrlarý sýralar ve tüm deðerleri ayný olan satýrlar varsa sadece bir tanesini gösterir.

Union sýralama ve silme iþlemi yaptýðý için süre %63 uzuyor. Bu Union'un çalýþma planýnda Distinct Sort anýnda gerçekleþiyor.
Scope'daki sorgunun çalýþma planýný görüntülemek için -> Estimated query Execution Plan:  Ctrl + L. 
Not: Sýralama iþlemi yapmayý istiyorsak tablolar birleþtirildikten sonra yapmamýz gerekiyor. Bu yüzden en sona yazýyoruz.
*/

select *o from tblIndiaCustomers
Union all
select * from tblUSCustomers
order by Name

Select Id, Name, Email from tblIndiaCustomers
UNION
Select Id, Name, Email from tblUKCustomers

Select Id, Name, Email from tblIndiaCustomers
UNION ALL
Select Id, Name, Email from tblUKCustomers
UNION ALL
Select Id, Name, Email from tblUSCustomers
Order by Name -- sýralama sonda olmalý