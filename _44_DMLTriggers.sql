/*Bu derste Dml trigger> After insert'i Update sorgusu ile kullanacaðýz. Geçen derste Delete ve Insert için kullanmýþtýk.
Update sorgusu 2 farký durumu içeriyor. -> Eski veri siliniyor, yeni veri ekleniyor. Bu yüzden Update sorgusu ile çalýþan Trigger'ýn Body'sinde ýnsterted ve Deleted tablolarý kullanabiliriz.

Rapor için oluþturduðumuz tabloya hangi satýrlarda hangi deðerlerin güncelleþtirildiðini göstermemiz gerekiyor. Bu yüzden Inserted ve deleted tablolarýndan adlýðýmýz verileri karþýlaþtýrýp, farklý deðerleri veren sütunun eski ve yeni deðerini Rapor için oluþturduðumuz tabloya atýyoruz.
*/
Create AFTER UPDATE trigger script:
Create trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
 Select * from deleted
 Select * from inserted 
End

Update tblEmployee set Name = 'Tods', Salary = 2000, 
Gender = 'Female' where Id = 4

Alter trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
--Deleted ve Inserted tablodan aldýðýmýz verileri, karþýlaþtýrmak için oluþturdýðumuz field'lar.
	  Declare @Id int --> iki tabloda da deðer ayný olacaðý için tek field yeter.
	  Declare @OldName nvarchar(20), @NewName nvarchar(20)
	  Declare @OldSalary int, @NewSalary int
	  Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
	  Declare @OldDeptId int, @NewDeptId int
	  Declare @AuditString nvarchar(1000) --> Bu Field Rapor tablosuna gireceðimiz raporu belirliyor.
	  
	Select * into #TempTable from inserted --> Inserted tabloya gelen deðerleri kullanarak Local Temporary tablo oluþturuyoruz. 
	 
	  While(Exists(Select Id from #TempTable)) --> Geçici tabloda satýr olduðu sürece dön demek. Yani tablodaki satýrlarý silmessek bu sonsuz bir döngü demek. Yani siliyoruz. Bu yüzden Temporary tablo oluþturduk.
	  Begin
			Set @AuditString = ''
		   
		   
			Select Top 1 @Id = Id, --> Instered Tablodaki ilk satýrýn deðerlerini üstte oluþturduðumuz field'lara alýyoruz.
						 @NewName = Name,
						 @NewGender = Gender, @NewSalary = Salary,
						 @NewDeptId = DepartmentId 
						 from #TempTable 
			
			Select 	@OldName = Name, 
					@OldGender = Gender, 
					@OldSalary = Salary, 
					@OldDeptId = DepartmentId
					from deleted where Id = @Id --> Ayný satýrýn eski deðerlerini üstte oluþturduðumuz field'lara alýyoruz.
         
			--> Rapor tablosuna gireceðimiz string'in ilk kýsmý(bunu üsttede belirleyebilirdik.)
			Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
			--> Bu string'in 2. kýsmýna sadece üzerinde deðiþiklik yaptýðýmýz sütunlarý ekleyeceðiz. Bu yüzden if ile üstdeki field'lara aldýðýmýz deðerleri kontrol ediyoruz.
			if(@OldName <> @NewName)	 Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
			if(@OldGender <> @NewGender) Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender
			if(@OldSalary <> @NewSalary) Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))
			if(@OldDeptId <> @NewDeptId) Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))
		   
			insert into tblEmployeeAudit values(@AuditString)
			
			--> Döngüde bu tabloyu kullanýyoruz ve geçerli satýrý siliyoruz. Böylece 2. satýr ilk satýr oluyor ve üstteki select sorgusu ilk satýrý alýyor.
			Delete from #TempTable where Id = @Id
	  End
End 