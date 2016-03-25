/*Try/Catch in Sql Server
Not: Try/Catch kullanıcıların oluşturduğum methodlarda kullanılamıyormuş.
@@Error kullanırken sorgu sonucunda hata olduu gösteriliyordu. Catch içide hata oldursa sonuçda hata mesajı çıkmaz. Yani uygulama hata vermemiş gibi çalışır.
*/
BEGIN TRY
     { Any set of SQL statements }
END TRY
BEGIN CATCH
     [ Optional: Any set of SQL statements ]
END CATCH
[Optional: Any other SQL Statements]

-- Geçen dersteki Procedure
Create Procedure spSellProduct
@ProductId int,
@QuantityToSell int
as
Begin
 
 Declare @StockAvailable int
 Select @StockAvailable = QtyAvailable 
 from tblProduct where ProductId = @ProductId
 
 if(@StockAvailable < @QuantityToSell)
   Begin
  Raiserror('Not enough stock available',16,1) --> Hata oluşturduk.
   End
 Else
   Begin
    Begin Try --> Try blogunu açtık. Bu blok içindeki işlemler hata verdiğinde, uygulama devam etmeyecek hemen Cache bloguna gidecek.
     Begin Transaction
  Update tblProduct set QtyAvailable = (QtyAvailable - @QuantityToSell)
  where ProductId = @ProductId
  
  Declare @MaxProductSalesId int
  Select @MaxProductSalesId = Case When 
          MAX(ProductSalesId) IS NULL 
          Then 0 else MAX(ProductSalesId) end 
         from tblProductSales
  -- Set @MaxProductSalesId = @MaxProductSalesId + 1 --> yeni ürün eşkisinin üzerine eklenmeye çalışacağı için hata vercek.
  Insert into tblProductSales values(@MaxProductSalesId, @ProductId, @QuantityToSell)
     Commit Transaction --> Yani uygulamada bir hata olursa çalışmaz.
    End Try -- kapattık
    Begin Catch 
  Rollback Transaction
  Select 
   ERROR_NUMBER() as ErrorNumber, --> Hespi kendini çalışlıyor. Bu methodları Catch dışında kullanırsak Null döner. ve As ile verdiğimiz sütun adı.
   ERROR_MESSAGE() as ErrorMessage,
   ERROR_PROCEDURE() as ErrorProcedure,
   ERROR_STATE() as ErrorState,
   ERROR_SEVERITY() as ErrorSeverity,
   ERROR_LINE() as ErrorLine
    End Catch 
   End
End


