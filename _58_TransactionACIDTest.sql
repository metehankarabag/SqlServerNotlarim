/*Transaction Acid Test
Bu şartları sağlamak zorunda
Atomic: Transaction'daki işlemlerin ya hepsinin uygulanması yada hiç birinin uygulanmaması
Consistent: Transaction'da çalıştırdığımız sorgudan sonra başka bir sorguyu çalıştırmamız gerekiyorsa, diğer sorguda Transaction üyesi olmalı.
Isolated: Aynı anda çalışan Transaction'ların bir birlerini etkilenmemeisini sağlamak. Onaylanmmış verinin başka session'lar tarafından görüntülenmesini engelleyerek yapıyoruz.
Durable: Transaction çalışırken elektik kesilirse, elektrik geri geldiğinde yapılan işlemlerin geri alınabilmesini sağlamak

Not: Transaction'daki sorgunun kullandığı tabloyu, başka bir sessiondaki select sorgusu ile seçemiyoruz. Fakat Select sorgusuna Where ile transaction'ın kullandığı onaylanmamış veriyi içeren satırı çıkartırsak alabiliriz.
*/

Create Procedure spUpdateInventory_and_Sell
as
Begin
  Begin Try
    Begin Transaction
      Update tblProduct set QtyAvailable = (QtyAvailable - 10)
      where ProductId = 1

      Insert into tblProductSales values(3, 1, 10)
    Commit Transaction
  End Try
  Begin Catch 
    Rollback Transaction
  End Catch 
End 
