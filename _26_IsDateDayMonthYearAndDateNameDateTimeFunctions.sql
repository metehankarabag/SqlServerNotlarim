/*ISDATE(): Parametre olarak aldığı STRING'in tarih olup olmadığını kontrol eder ve Boolean değer döner. 
Datetime2 değerleri için IsDate() 0 döner.

Day(), Month(), Year(): Parametre olarak aldıkları string doğru bir tarih ise kendi kısımlarını alır ve sayı karşılıklarını döner.

DateName(): String değer döner. Birinci parametrede döndürülecek bölüm belirlenir 2. parametre de tarih.
Day : 1. parametre olarak Day verirsek Ayın hangi gününe geldiğini alırız. Yani string olarak günün sayısını alırız.
WeekDay: Gün adını verir.
Month: Ay adını verir.
Bir sürü var, saat, dakika, saniye.....
*/


Select ISDATE('PRAGIM') -- returns 0
Select ISDATE(Getdate()) -- returns 1
Select ISDATE('2012-08-31 21:02:04.167')

Select ISDATE('2012-09-01 11:34:21.1918447')
Day()

Select Day(GETDATE())
Select Day('01/31/2012') 

Select Month(GETDATE())
Select Month('01/31/2012')

Select Year(GETDATE())
Select Year('01/31/2012')


Select DATENAME(Day, '2012-09-30 12:43:46.837') -- Returns 30
Select DATENAME(WEEKDay, '2012-09-30 12:43:46.837') -- Returns SunDay
Select DATENAME(Month, '2012-09-30 12:43:46.837') -- Returns September

Select Name, DateOfBirth, DateName(WEEKDay,DateOfBirth) as [Day], 
            Month(DateOfBirth) as MonthNumber, 
            DateName(Month, DateOfBirth) as [MonthName],
            Year(DateOfBirth) as [Year] 
From   tblEmployees