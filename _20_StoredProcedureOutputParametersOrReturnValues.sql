/*OutPut Parametre veya Return value

Output parametresı Procedure'nin değer almak içindeğil değer çıkarmak için kullandığı bir parametredir ve Procedure'ı kullanmayı istiyorsak çıkacak değeri tutabilecek bir Field vermek zorundayız.
Return value sadece int türünde veri döner ve 0 dönerse işlem başarılı olmuştur.
Sorgu sonucu nvarchar olan bir değeri Return'a verirsek hata alırız.
*/
--/////Int değer dönen Procedure'ler
Create Procedure spGetTotalCount1
@TotalCount int out
as
Begin
	Select @TotalCount = COUNT (ID)FROM tblPersonel
end

Create Procedure spGetTotalCount2
as
Begin
	return(Select COUNT (ID)FROM tblPersonel)
end
--/////

Declare @Total int
Execute spGetTotalCount1 @Total out
Print @Total

Declare @Total int
Execute @Total  = spGetTotalCount2
Print @Total

--/////String değer dönen Procedure'ler
Create Procedure spGetNameById1
@Id int,
@Name nvarchar(20) output
as
begin
	select @Name = Name from tblPersonel where ID=@Id
end

Create Procedure spGetNameById2
@Id int
as
begin
	return (select Name from tblPersonel where ID = @Id)
end
--//////

Declare @Name nvarchar(50)
Execute spGetNameById1 1, @Name out
Print 'Name = ' + @Name

Declare @Name nvarchar(50)
Execute @Name = spGetNameById2 1
Print 'Name = ' + @Name
